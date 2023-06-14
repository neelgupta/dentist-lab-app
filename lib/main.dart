import 'package:dentalapp/main.dart';
import 'package:dentalapp/screen/accepted_quote_screen.dart';
import 'package:dentalapp/screen/acceptedquote_details_screen.dart';
import 'package:dentalapp/screen/add_services_screen.dart';
import 'package:dentalapp/screen/advance_payment_done_screen.dart';
import 'package:dentalapp/screen/bottomNavigationBar_screen.dart';
import 'package:dentalapp/screen/dashboard_1_screen.dart';
import 'package:dentalapp/screen/dashboard_screen.dart';
import 'package:dentalapp/screen/date_picker_screeen.dart';
import 'package:dentalapp/screen/edit_profile_screen.dart';
import 'package:dentalapp/screen/email_verification_screen.dart';
import 'package:dentalapp/screen/email_verified_done_screen.dart';
import 'package:dentalapp/screen/job_success_screen.dart';
import 'package:dentalapp/screen/login_screen.dart';
import 'package:dentalapp/screen/manage_profile_1.dart';
import 'package:dentalapp/screen/manage_profile_2.dart';
import 'package:dentalapp/screen/manage_profile_3.dart';
import 'package:dentalapp/screen/manage_profile_4.dart';
import 'package:dentalapp/screen/manage_profile_5.dart';
import 'package:dentalapp/screen/manage_profile_6.dart';
import 'package:dentalapp/screen/new_password_screen.dart';
import 'package:dentalapp/screen/notification_screen.dart';
import 'package:dentalapp/screen/payment_received_screen.dart';
import 'package:dentalapp/screen/public_profile_screen.dart';
import 'package:dentalapp/screen/register_type_screen.dart';
import 'package:dentalapp/screen/reset_password_screen.dart';
import 'package:dentalapp/screen/reset_successful_screen.dart';
import 'package:dentalapp/screen/services_%20screen.dart';
import 'package:dentalapp/screen/set_up_done_screen.dart';
import 'package:dentalapp/screen/sign_up_screen.dart';
import 'package:dentalapp/screen/splash.dart';
import 'package:dentalapp/screen/starter_page_screen.dart';
import 'package:dentalapp/screen/submit_code_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
       home: AddServicesScreen(),
    );
  }
}
