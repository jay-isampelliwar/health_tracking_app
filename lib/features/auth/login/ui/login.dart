import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_tracking_app/core/constants/color_constant.dart';
import 'package:health_tracking_app/core/constants/text_styles.dart';
import 'package:health_tracking_app/core/helper/helper.dart';
import 'package:health_tracking_app/core/helper/router.dart';
import 'package:health_tracking_app/core/widgets/app_custom_app_bar.dart';
import 'package:health_tracking_app/core/widgets/app_snackbar.dart';
import 'package:health_tracking_app/core/widgets/app_text_field.dart';
import 'package:health_tracking_app/core/widgets/const_size_box.dart';
import 'package:health_tracking_app/features/Bmi/ui/bmi.dart';
import 'package:health_tracking_app/features/auth/model/user_model.dart';
import 'package:health_tracking_app/features/auth/register/ui/register.dart';
import 'package:health_tracking_app/features/home/ui/home_screen.dart';
import 'package:health_tracking_app/locator.dart';
import 'package:hive/hive.dart';

import '../../../../core/widgets/app_button.dart';
import '../bloc/login_bloc.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final box = Hive.box("localData");

  @override
  void dispose() {
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: size.width * 0.06,
            right: size.width * 0.06,
            top: size.height * 0.06,
            bottom: size.height * 0.04,
          ),
          child: BlocConsumer<LoginBloc, LoginState>(
            bloc: locator.get<LoginBloc>(),
            listenWhen: (previous, current) => current is LoginActionState,
            buildWhen: (previous, current) => current is! LoginActionState,
            listener: (context, state) {
              if (state is LoginErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(appSnackBar(
                    size: size, message: state.message, color: Colors.red));
              } else if (state is LoginSuccessState) {
                if (box.get("height") != null && box.get("weight") != null) {
                  routeWithPushReplacement(const MainWidget(), context);
                } else {
                  routeWithPushReplacement(const BmiPage(), context);
                }
              }
            },
            builder: (context, state) {
              return Column(
                children: [
                  CustomAppBar(
                    title: "Login",
                    subtitle: "",
                    profile: false,
                  ),
                  AppConstSizeBox.constHightSizedBox(size.height * 0.01),
                  Text(
                    "Empower your wellness journey today, track, improve, and conquer your health with HealthTrack.",
                    style: AppTextStyles.text20(bold: true, size: size)
                        .copyWith(color: AppColors.secondaryColor),
                  ),
                  AppConstSizeBox.constHightSizedBox(size.height * 0.04),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        AppTextField(
                          hintText: "Email",
                          inputType: TextInputType.emailAddress,
                          obscureText: false,
                          textEditingController: emailTextEditingController,
                          validator: (value) => Helper.emailValidator(value),
                        ),
                        AppConstSizeBox.constHightSizedBox(size.height * 0.01),
                        AppTextField(
                          hintText: "Password",
                          inputType: TextInputType.emailAddress,
                          obscureText: true,
                          textEditingController: passwordTextEditingController,
                        ),
                        AppConstSizeBox.constHightSizedBox(size.height * 0.04),
                        AppButton(
                          child: Visibility(
                            visible: state is! LoginLoadingState,
                            replacement: CircularProgressIndicator(
                                color: AppColors.white),
                            child: Text(
                              "Login",
                              style:
                                  AppTextStyles.text28(bold: true, size: size)
                                      .copyWith(color: AppColors.white),
                            ),
                          ),
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            if (formKey.currentState!.validate()) {
                              locator.get<LoginBloc>().add(LoginHomeActionEvent(
                                    model: User(
                                      email: emailTextEditingController.text,
                                      password:
                                          passwordTextEditingController.text,
                                    ),
                                  ));
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  AppConstSizeBox.constHightSizedBox(size.height * 0.02),
                  Divider(color: AppColors.secondaryColor),
                  AppConstSizeBox.constHightSizedBox(size.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account? ",
                          style: AppTextStyles.text18(bold: false, size: size)),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Registration()));
                        },
                        child: Text("SignUp",
                            style: AppTextStyles.text20(bold: true, size: size)
                                .copyWith(color: AppColors.primaryColor)),
                      ),
                    ],
                  ),
                  AppConstSizeBox.constHightSizedBox(size.height * 0.02),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
