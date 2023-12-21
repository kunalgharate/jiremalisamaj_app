
import 'package:community_app/app-service-connector/realm_service.dart';
import 'package:community_app/app_services.dart';
import 'package:community_app/components/appbar.dart';
import 'package:community_app/components/button.dart';
import 'package:community_app/components/input_form_field.dart';
import 'package:community_app/login/login_page.dart';
import 'package:community_app/login/registration_controller.dart';

import 'package:community_app/utils/app_colors.dart';
import 'package:community_app/utils/app_string.dart';
import 'package:community_app/utils/app_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import '../components/input_password_form_field.dart';
import '../model/schemas.dart';

class RegistrationPage extends StatefulWidget {
  RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final AppServices appServices = GetIt.I.get<AppServices>();
  final RegisterController registerController = Get.isRegistered()? Get.find():Get.put(RegisterController());
  late RealmServices realmServices;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: headAppbar(context, "Create your account", true),
      body: Column(
        children: [
        Expanded(flex: 3,child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/images/logo_icon.svg",width: 90,height: 90),
          Text(
            "Welcome to",
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.primary,fontSize: 25),

          ),Text(
            "Jire Mali Samaj",
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.primary,fontSize: 25,fontWeight: FontWeight.bold ),

          ),
        ],
              ),),

          Expanded(flex: 7,
            child:Column(
              children: [
                Form(
                  key: formKey,
                  child:Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0 ,vertical: 1),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        CustomInputFormField(hintText: "Enter full name", icon: Icons.person, controller: registerController.nameController ,validator: (value){
                          if (value == null || value.isEmpty) {
                            return AppString.errorMsg_fullnameIsEmpty;
                          }
                          // else if(!value.isAlphabetOnly)
                          // {
                          //   return AppString.errorMsg_fullnameIsEmpty;
                          // }
                          return null;
                        },
                        ),


                        SizedBox(
                          height: 20,
                        ),

                        CustomInputFormField(hintText: "Enter mobile number",icon: Icons.mobile_friendly,controller: registerController.mobileController, validator: (value){
                          if (value == null || value.isEmpty) {
                            return AppString.errorMsg_mobileIsEmpty;
                          }
                          // else if(!value.isAlphabetOnly)
                          // {
                          //   return AppString.errorMsg_mobileIsEmpty;
                          // }
                          return null;
                        },),

                        SizedBox(
                          height: 20,
                        ),

                        CustomInputFormField(hintText: "Enter email id",icon: Icons.email,controller: registerController.emailController, validator: (value){
                          if (value == null || value.isEmpty) {
                            return AppString.errorMsg_emailIsEmpty;
                          }
                          else if(!value.isEmail)
                          {
                            return AppString.errorMsg_emailIsValid;
                          }
                          return null;
                        },),

                        SizedBox(
                          height: 20,
                        ),

                        CustomPasswordInputFormField(hintText: "Enter password",errorText: "",icon: Icons.lock,controller: registerController.passwordController,validator: (value){
                          if (value == null || value.isEmail) {
                            return AppString.errorMsg_passwordIsValid;
                          }
                          else if(!value.isAlphabetOnly)

                          {
                            return AppString.errorMsg_passwordIsValid;
                          }
                          return null;
                        },)
      ,

                        SizedBox(
                          height: 20,
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6.0,vertical: 5),
                          child: CustomButton(onPress: () async {
                            if(formKey.currentState!.validate())
                            {
                              AppUser? user = await  realmServices.registerUser(
                                  registerController.nameController.text.toString().trim(),
                                registerController.emailController.text.toString().trim(),
                                registerController.mobileController.text.toString().trim(),
                                 registerController.passwordController.text.toString().trim());

                              if(user!=null && user?.id!=null)
                              {
                                Get.snackbar("Welcome ","${user.name}! Your  registration was a success",snackPosition: SnackPosition.BOTTOM);
                              }
                              else
                              {
                                Get.snackbar("Internal server error","",snackPosition: SnackPosition.BOTTOM);
                              }
                            }
                          }, buttonText: "Register"),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                  text: 'Already have an account? ', style: AppTheme.normalBlackTextTheme
              ),
              TextSpan(
                text: 'Sign in',
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
                // Add a gesture recognizer to handle the tap on "Sign up"
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                    print('Sign up tapped!');
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    realmServices = Get.isRegistered()?Get.find():Get.put(RealmServices(appServices.app));
  }
}
