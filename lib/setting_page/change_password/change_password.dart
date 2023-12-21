import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/button.dart';
import '../../components/input_form_field.dart';
import '../../utils/app_colors.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Password"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 60),
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/images/logo_icon.svg",
                      width: 100, height: 100),
                  Text(
                    "Welcome to",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppColors.primary, fontSize: 30),
                  ),
                  Text(
                    "Jire Mali Samaj",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 60),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomInputFormField(
                      hintText: "Enter Old Password",
                      validator: (value) {},
                      icon: Icons.lock,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomInputFormField(
                      hintText: "Enter New Password",
                      validator: (value) {},
                      icon: Icons.lock,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomInputFormField(
                      hintText: "Confirm Password",
                      validator: (value) {},
                      icon: Icons.lock,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 80, vertical: 10),
                      child: CustomButton(
                          onPress: () {}, buttonText: "Reset Password"),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
