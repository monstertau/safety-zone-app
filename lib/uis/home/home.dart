import 'package:flutter/material.dart';
import 'package:global_dev_challenge_2021/common/constant.dart';
import 'package:global_dev_challenge_2021/uis/common/bottom_bar.dart';
import 'package:global_dev_challenge_2021/uis/home/map.dart';
import 'package:global_dev_challenge_2021/uis/validation_form/validation_form.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _lastSelected = 0;
  List<Widget> _listScreen = [
    MapPage(),
    ValidationFormPage(),
  ];

  ///Set state function
  void _selectedTab(int index) {
    setState(() {
      _lastSelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: FABBottomAppBar(
        centerItemText: 'QR Scanner',
        color: Colors.grey,
        selectedColor: Color(0xFF0B877D),
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _selectedTab,
        items: [
          FABBottomAppBarItem(iconData: Icons.map, text: 'Location'),
          FABBottomAppBarItem(
              iconData: Icons.format_list_numbered_sharp, text: 'Medical Form'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, qrCodeRoute);
        },
        child: Icon(Icons.qr_code_scanner),
        elevation: 2.0,
        backgroundColor: Color(0xFF0B877D),
      ),
      body: _listScreen[_lastSelected],
    );
  }
}
