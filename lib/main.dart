import 'dart:math';

import 'package:community_app/app-service-connector/bloc/real_login_bloc.dart';
import 'package:community_app/app_services.dart';
import 'package:community_app/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realm/realm.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  var appservice =
  AppServices("communityapp-urbzp", Uri.parse("https://realm.mongodb.com"));
  runApp(MyApp(
    appServices: appservice,
  ));
}

class MyApp extends StatelessWidget {
  final AppServices appServices;

  MyApp({required this.appServices, super.key});

//just to know
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: BlocProvider(
            create: (context) => RealLoginBloc(appServices),
            child: MyHomePage(appServices: appServices)));
  }
}

class MyHomePage extends StatefulWidget {
  final AppServices appServices;

  const MyHomePage({super.key, required this.appServices});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Success App")),
      body: BlocConsumer<RealLoginBloc, RealLoginState>(
        listener: (context, state) {
          if (state is RealLoginSuccess) {
            navigateToLoginPage();
          }
        }, builder: (BuildContext context, RealLoginState state) {
        if (state is RealLoginSuccess) {
            return Text("Welcome to jiremali samaj app");
        }
        else
          {
            return Text("Internal server error please try again after sometime");
          }

      },
      ),
    );
  }

  void navigateToLoginPage() async {
    await Future.delayed(Duration(seconds: 5)); // Add a delay of 2 seconds
    Navigator.push(context, MaterialPageRoute(builder: (context)=> RegistrationPage()));
  }


  @override
  void initState() {
    login();
    super.initState();
  }

  void login() {
    final RealLoginBloc authBloc = BlocProvider.of<RealLoginBloc>(context);
    authBloc.add(RealmAppLogin("kunalgharate@gmail.com", "Kunal@123"));
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Success with login"),
      ),
    );
  }
}

class Failed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Error with login"),
      ),
    );
  }
}
