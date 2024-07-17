import 'package:flutter/material.dart';
import 'package:flutter_application_1/get_started.dart';
import 'package:flutter_application_1/LoginpageWidget.dart';
import 'package:flutter_application_1/Login.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_application_1/SignupuserWidget.dart';
import 'package:flutter_application_1/ChefLoginWidget.dart';
import 'package:flutter_application_1/OtpWidget.dart';
import 'package:flutter_application_1/AddNewItemScreen.dart';
import 'package:flutter_application_1/RestaurantViewScreen.dart';
//import 'package:firebase_core/firebase_core.dart';

void main()  {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homely',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', 
      routes: {
        '/': (context) => const GetStarted(), 
        '/loginp': (context) => LoginpageWidget(),
        '/login1': (context) => ChefLoginWidget(),  
        '/signup': (context) => SignupuserWidget(), 
        '/otp': (context) => OtpWidget(), 
        '/add' : (context) => AddNewItemScreen(),  

        
      },
    );
  }
}
