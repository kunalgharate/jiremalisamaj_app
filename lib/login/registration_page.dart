
import 'package:community_app/app-service-connector/realm_service.dart';
import 'package:community_app/app_services.dart';
import 'package:community_app/components/appbar.dart';
import 'package:community_app/components/button.dart';
import 'package:community_app/components/input_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class RegistrationPage extends StatefulWidget {
  RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final AppServices appServices = GetIt.I.get<AppServices>();
  late RealmServices realmServices;
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: headAppbar(context, "Create your account", true),
      body: Column(
        children: [
          Form(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                CustomInputFormField(hintText: "Enter full name",errorText: "", icon: Icons.person,),
                CustomInputFormField(hintText: "Enter mobile number",errorText: "",icon: Icons.person,),
                CustomInputFormField(hintText: "Enter email id",errorText: "",icon: Icons.person,),
                CustomInputFormField(hintText: "Enter password",errorText: "",icon: Icons.person,),
              ],
            ),
          ))
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomButton(onPress: (){
          realmServices.getUserByEmailAndPassword("ram@gmail.com", "123456");
          //realmServices.createItem("ram", "ram@gmail.com", "9876543210", "123456");
        }, buttonText: "Register"),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    realmServices = Get.isRegistered()?Get.find():Get.put(RealmServices(appServices.app));
  }
}
