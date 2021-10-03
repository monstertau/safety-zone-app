import 'package:flutter/material.dart';
import 'package:global_dev_challenge_2021/common/constant.dart';
import 'package:global_dev_challenge_2021/uis/home/home.dart';
import 'package:global_dev_challenge_2021/uis/home/map.dart';
import 'package:global_dev_challenge_2021/uis/layout.dart';
import 'package:global_dev_challenge_2021/uis/phone_login/otp.dart';
import 'package:global_dev_challenge_2021/uis/phone_login/phone_login.dart';
import 'package:global_dev_challenge_2021/uis/qr_code/qr.dart';
import 'package:global_dev_challenge_2021/uis/validation_form/validation_form.dart';

class AppRouter {
  // implement for navigating between screen
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments as List<Object>;
    switch (settings.name) {
      case phoneRoute:
        return MaterialPageRoute(builder: (_) => PhoneLoginPage());
        break;
      case otpRoute:
        return MaterialPageRoute(builder: (_) => OTPPage());
        break;
      case qrCodeRoute:
        return MaterialPageRoute(builder: (_) => BarcodePage());
        break;
      case validationFormRoute:
        return MaterialPageRoute(builder: (_) => ValidationFormPage());
        break;
        break;
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case layoutRoute:
        return MaterialPageRoute(builder: (_) => LayoutPage());
        break;
      case mapRoute:
        return MaterialPageRoute(builder: (_) => MapPage());
      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}'))));
    }
  }
}
