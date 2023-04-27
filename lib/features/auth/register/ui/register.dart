import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_tracking_app/core/helper/router.dart';
import 'package:health_tracking_app/core/widgets/app_custom_app_bar.dart';
import 'package:health_tracking_app/features/auth/login/ui/login.dart';
import 'package:health_tracking_app/features/auth/model/user_model.dart';
import 'package:health_tracking_app/features/auth/otp/ui/otp.dart';
import 'package:health_tracking_app/features/auth/register/bloc/sign_up_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/constants/color_constant.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helper/helper.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_snackbar.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/const_size_box.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  File? image;
  @override
  void dispose() {
    emailTextEditingController.dispose();
    nameTextEditingController.dispose();
    passwordTextEditingController.dispose();
    super.dispose();
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final tempImage = File(image.path);
      setState(() {
        this.image = tempImage;
      });
    } catch (err) {
      log(err.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final SignUpBloc signUpBloc = SignUpBloc();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: size.width * 0.06,
          right: size.width * 0.06,
          top: size.height * 0.06,
          bottom: size.height * 0.04,
        ),
        child: SingleChildScrollView(
          child: BlocConsumer<SignUpBloc, SignUpState>(
            bloc: signUpBloc,
            listenWhen: (previous, current) => current is SignUpActionState,
            buildWhen: (previous, current) => current is! SignUpActionState,
            listener: (context, state) {
              if (state is SignUpSuccessActionState) {
                routeWithPushReplacement(
                    OTPScreen(email: emailTextEditingController.text), context);
                appSnackBar(
                    size: size, message: state.message, color: Colors.green);
              } else if (state is SignUpErrorActionState) {
                appSnackBar(
                    size: size, message: state.message, color: Colors.red);
              }
            },
            builder: (context, state) {
              return Column(
                children: [
                  CustomAppBar(
                    title: "Registration",
                    subtitle: "",
                    profile: false,
                  ),
                  AppConstSizeBox.constHightSizedBox(size.height * 0.01),
                  Text(
                    "Empower your wellness journey today, track, improve, and conquer your health with HealthTrack.",
                    style: AppTextStyles.text20(bold: true, size: size)
                        .copyWith(color: AppColors.secondaryColor),
                  ),
                  AppConstSizeBox.constHightSizedBox(size.height * 0.01),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            pickImage();
                          },
                          child: Container(
                              clipBehavior: Clip.hardEdge,
                              width: size.width * 0.25,
                              height: size.width * 0.25,
                              decoration: BoxDecoration(
                                border: image != null
                                    ? null
                                    : Border.all(
                                        color: AppColors.primaryColor,
                                        width: 2),
                                shape: BoxShape.circle,
                              ),
                              child: image == null
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.upload,
                                          size: size.width * 0.08,
                                          color: AppColors.primaryColor,
                                        ),
                                        Text(
                                          "Upload Profile",
                                          style: AppTextStyles.text12(
                                              bold: false, size: size),
                                        )
                                      ],
                                    )
                                  : Image.file(
                                      image!,
                                      fit: BoxFit.cover,
                                    )),
                        ),
                        AppConstSizeBox.constHightSizedBox(size.height * 0.01),
                        AppTextField(
                            hintText: "Name",
                            inputType: TextInputType.name,
                            obscureText: false,
                            textEditingController: nameTextEditingController,
                            validator: (value) => Helper.nameValidator(value)),
                        AppConstSizeBox.constHightSizedBox(size.height * 0.01),
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
                          inputType: TextInputType.text,
                          obscureText: true,
                          textEditingController: passwordTextEditingController,
                          validator: (value) => Helper.passwordValidator(value),
                        ),
                        AppConstSizeBox.constHightSizedBox(size.height * 0.04),
                        AppButton(
                          child: Visibility(
                            visible: state is! SignUpButtonLoadingState,
                            replacement: CircularProgressIndicator(
                                color: AppColors.white),
                            child: Text(
                              "SignUp",
                              style:
                                  AppTextStyles.text28(bold: true, size: size)
                                      .copyWith(color: AppColors.white),
                            ),
                          ),
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            if (formKey.currentState!.validate()) {
                              signUpBloc.add(
                                SignUpButtonClickedActionEvent(
                                  model: User(
                                    email: emailTextEditingController.text,
                                    name: nameTextEditingController.text,
                                    password:
                                        passwordTextEditingController.text,
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                        AppConstSizeBox.constHightSizedBox(size.height * 0.02),
                        Divider(color: AppColors.secondaryColor),
                        AppConstSizeBox.constHightSizedBox(size.height * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account? ",
                                style: AppTextStyles.text18(
                                    bold: false, size: size)),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Login()));
                              },
                              child: Text("Login",
                                  style: AppTextStyles.text20(
                                          bold: true, size: size)
                                      .copyWith(color: AppColors.primaryColor)),
                            ),
                          ],
                        ),
                        AppConstSizeBox.constHightSizedBox(size.height * 0.02),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
