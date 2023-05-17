import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_tracking_app/core/constants/text_styles.dart';
import 'package:health_tracking_app/core/helper/helper.dart';
import 'package:health_tracking_app/core/helper/router.dart';
import 'package:health_tracking_app/core/widgets/app_snackbar.dart';
import 'package:health_tracking_app/core/widgets/const_size_box.dart';
import 'package:health_tracking_app/features/Bmi/ui/bmi.dart';
import 'package:health_tracking_app/features/auth/model/user_model.dart';
import 'package:health_tracking_app/locator.dart';

import '../../../../core/constants/color_constant.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../bloc/otp_bloc.dart';

class OTPScreen extends StatelessWidget {
  String email;
  OTPScreen({required this.email, super.key});
  TextEditingController textEditingController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.1, vertical: size.height * 0.1),
              child: BlocConsumer<OtpBloc, OtpState>(
                bloc: locator.get<OtpBloc>(),
                listenWhen: (previous, current) => current is OtpActionState,
                buildWhen: (previous, current) => current is! OtpActionState,
                listener: (context, state) {
                  if (state is OtpErrorState) {
                    appSnackBar(
                        size: size, message: state.message, color: Colors.red);
                  } else if (state is OtpSuccessState) {
                    routeWithPushReplacement(const BmiPage(), context);
                    appSnackBar(
                        size: size,
                        message: state.message,
                        color: Colors.green);
                  }
                },
                builder: (context, state) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Otp sent to your Email",
                        style: AppTextStyles.text18(bold: false, size: size)
                            .copyWith(color: AppColors.lightSecondaryColor),
                      ),
                      AppConstSizeBox.constHightSizedBox(0.01 * size.height),
                      Text(email.toString(),
                          style: AppTextStyles.text24(bold: true, size: size)),
                      AppConstSizeBox.constHightSizedBox(0.04 * size.height),
                      Form(
                        key: formKey,
                        child: AppTextField(
                          hintText: "OTP",
                          inputType: TextInputType.number,
                          obscureText: false,
                          textEditingController: textEditingController,
                          validator: (value) => Helper.otpValidator(value),
                        ),
                      ),
                      AppConstSizeBox.constHightSizedBox(0.06 * size.height),
                      GestureDetector(
                        onTap: () {
                          log("Print");
                          FocusScope.of(context).unfocus();
                          if (formKey.currentState!.validate()) {
                            locator.get<OtpBloc>().add(
                                  OtpButtonClickedEvent(
                                    model: User(
                                      email: email,
                                      otp: textEditingController.text,
                                    ),
                                  ),
                                );
                          }
                        },
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Align(
                              child: Visibility(
                            visible: state is! OtpLoadingState,
                            replacement: CircularProgressIndicator(
                              color: Colors.grey.shade200,
                              strokeWidth: 3,
                            ),
                            child: Text(
                              "Verify",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey.shade200,
                              ),
                            ),
                          )),
                        ),
                      ),
                    ],
                  );
                },
              )),
        ),
      ),
    );
  }
}
