
import 'package:community_app/components/input_form_field.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Text("Create your account"),
          Form(child: Column(
            children: [
              CustomInputFormField(hintText: "Enter full name",errorText: "", icon: Icons.person,),
              CustomInputFormField(hintText: "Enter mobile number",errorText: ""),
              CustomInputFormField(hintText: "Enter email id",errorText: ""),
              CustomInputFormField(hintText: "Enter password",errorText: ""),
            ],
          ))
        ],
      ),
    );
  }
}
