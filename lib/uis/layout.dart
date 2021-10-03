import 'package:flutter/material.dart';
import 'package:global_dev_challenge_2021/common/constant.dart';

class LayoutPage extends StatefulWidget {
  LayoutPage({Key key}) : super(key: key);

  @override
  _LayoutPageState createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  @override
  void initState() {
    super.initState();
    this.checkAppState();
  }

  Future<void> checkAppState() async {
    // TODO: add validation on login
    return this.navigate(homeRoute);
  }

  void navigate(String route) {
    Navigator.pushNamedAndRemoveUntil(
        context, route, (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white);
  }
}
