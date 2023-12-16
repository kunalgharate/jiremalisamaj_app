
import 'package:community_app/app-service-connector/realm_service.dart';
import 'package:community_app/app_services.dart';
import 'package:community_app/components/appbar.dart';
import 'package:community_app/components/button.dart';
import 'package:community_app/components/input_form_field.dart';
import 'package:community_app/login/login_controller.dart';
import 'package:community_app/login/registration_page.dart';
import 'package:community_app/model/schemas.dart';
import 'package:community_app/utils/app_colors.dart';
import 'package:community_app/utils/app_string.dart';
import 'package:community_app/utils/app_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AppServices appServices = GetIt.I.get<AppServices>();
  late RealmServices realmServices;
  final formKey = GlobalKey<FormState>();
  final LoginController loginController = Get.isRegistered()? Get.find():Get.put(LoginController());
  Future<bool> _onPop() async {
    return false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [

            Expanded(flex: 4,
              child:Column(
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
            ),),



            Expanded(flex: 6,child:

            Column(
              children: [
                Form(
                  key: formKey,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        CustomInputFormField(hintText: AppString.hint_enterEmailId,icon: Icons.person, controller: loginController.emailController,validator: (value){
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
                          height: 25,
                        ),
                        CustomInputFormField(hintText: "Enter password",errorText: "",icon: Icons.lock,controller: loginController.passwordController),
                      ],
                    ),

                  ),

                ),
                Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forget Password',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 15,
                            color: Color(0xff4c505b),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),


                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 5),
                  child: CustomButton(onPress: ()
                  async {
                    if(formKey.currentState!.validate())
                    {
                      AppUser? user = await  realmServices.getUserByEmailAndPassword("${loginController.emailController.text.toString().trim()}", "${loginController.passwordController.text.toString().trim()}");

                      if(user!=null && user?.id!=null)
                      {
                        Get.snackbar("Welcome back","${user.name}! Your login was a success",snackPosition: SnackPosition.BOTTOM);
                      }
                      else
                      {
                        Get.snackbar("Invalid credentials","",snackPosition: SnackPosition.BOTTOM);
                      }
                    }

                    //realmServices.createItem("lalit", "lalit@gmail.com", "9876543210", "123456");
                  }, buttonText: "Login"),
                )
              ],
            ))
        ],
      ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: RichText(
            textAlign: TextAlign.center,
          text: TextSpan(
          children: [
          TextSpan(
          text: 'Don\'t have an account? ', style: AppTheme.normalBlackTextTheme
          ),
          TextSpan(
          text: 'Sign up',
          style: TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
          ),
          // Add a gesture recognizer to handle the tap on "Sign up"
          recognizer: TapGestureRecognizer()
          ..onTap = () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> RegistrationPage()));
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
