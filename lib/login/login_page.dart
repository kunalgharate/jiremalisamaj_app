
import 'package:community_app/app-service-connector/realm_service.dart';
import 'package:community_app/app_services.dart';
import 'package:community_app/components/appbar.dart';
import 'package:community_app/components/button.dart';
import 'package:community_app/components/input_form_field.dart';
import 'package:community_app/login/login_controller.dart';
import 'package:community_app/model/schemas.dart';
import 'package:community_app/utils/app_string.dart';
import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: headAppbar(context, "Login", true),
      body: Column(
        children: [
          Form(
            key: formKey,
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                CustomInputFormField(hintText: "Enter password",errorText: "",icon: Icons.lock,controller: loginController.passwordController),
              ],
            ),
          ))
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
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
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    realmServices = Get.isRegistered()?Get.find():Get.put(RealmServices(appServices.app));
  }
}
