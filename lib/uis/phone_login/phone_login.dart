import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:global_dev_challenge_2021/common/constant.dart';

class PhoneLoginPage extends StatefulWidget {
  @override
  _PhoneLoginPageState createState() => _PhoneLoginPageState();
}

class _PhoneLoginPageState extends State<PhoneLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Đăng nhập SafetyZone"),
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 32, right: 32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Nhập số điện thoại để đăng nhập",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
              SizedBox(height: 16),
              TextField(
                decoration: new InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: "Nhập số điện thoại"),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ], // Only numbers can be entered
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                    color: Color(0xFF126872),
                    textColor: Colors.white,
                    padding: EdgeInsets.only(
                        bottom: 12.0, top: 12.0, right: 80.0, left: 80.0),
                    splashColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    onPressed: () => Navigator.pushNamedAndRemoveUntil(
                      context,
                      homeRoute,
                      (Route<dynamic> route) => false,
                    ),
                    child: Text(
                      "Gửi mã OTP",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
