import 'package:community_app/components/input_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../app-service-connector/realm_service.dart';
import '../components/button.dart';
import '../login/registration_controller.dart';
import '../utils/app_colors.dart';

class Forget_Password_Page extends StatefulWidget {
  const Forget_Password_Page({super.key});

  @override
  State<Forget_Password_Page> createState() => _Forget_Password_PageState();
}

class _Forget_Password_PageState extends State<Forget_Password_Page> {
  final RegisterController registerController = Get.isRegistered()? Get.find():Get.put(RegisterController());
  late RealmServices realmServices;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forget Password"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 60),
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/images/logo_icon.svg",width: 100,height: 100),
                  Text(
                    "Welcome to",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppColors.primary,fontSize: 30),
        
                  ),Text(
                    "Jire Mali Samaj",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppColors.primary,fontSize: 30,fontWeight: FontWeight.bold ),
        
                  ),
                ],
              ),
        
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 60),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomInputFormField(hintText: "Enter Email" , validator: (value){}, icon: Icons.email, ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                    child: CustomButton(onPress: () {}, buttonText: "Reset Password"),
        
        
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


