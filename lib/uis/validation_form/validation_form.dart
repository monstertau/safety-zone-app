import 'package:flutter/material.dart';

class ValidationFormPage extends StatefulWidget {
  @override
  _ValidationFormPageState createState() => _ValidationFormPageState();
}

class _ValidationFormPageState extends State<ValidationFormPage> {
  TextEditingController nameController =
      new TextEditingController(text: 'VŨ TRUNG DŨNG');
  TextEditingController identityCardController =
      new TextEditingController(text: '001099022599');
  TextEditingController phoneNumController =
      new TextEditingController(text: '0977554906');

  TextEditingController addressDetailController =
      new TextEditingController(text: '38 hẻm 72/73/92 Quan nhân');
  String cityValue = 'Hà Nội';
  bool firstAnswerForm = false;
  bool secondAnswerForm = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Khai báo y tế online"),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Thông tin cá nhân",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              _personalInformation(context),
              SizedBox(height: 16),
              Text("Thông tin y tế",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              _basicInfoContainer(
                  "Trong vòng 14 ngày qua anh/chị có "
                  "đến tỉnh/thành phố nào (có thể đi qua nhiều nơi)",
                  firstAnswerForm),
              SizedBox(height: 16),
              _basicInfoContainer(
                  "Trong vòng 14 ngày qua anh/chị có "
                  "thấy xuất hiện ít nhát 1 trong các dấu hiệu: sốt, ho, khó thở, đau người - "
                  "mệt mỏi - ớn lạnh, giảm hoặc mất vị giác hoặc khứu giác không?",
                  secondAnswerForm),
              SizedBox(height: 32),
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
                    onPressed: () => {},
                    child: Text(
                      "Gửi tờ khai",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _personalInformation(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _inputField(nameController, "Họ tên"),
          _inputField(identityCardController, "CMND/CCCD/Hộ chiếu"),
          _inputField(phoneNumController, "Điện thoại"),
          Container(
            margin: EdgeInsets.only(top: 2, bottom: 2),
            padding: EdgeInsets.only(bottom: 10, top: 10),
            child: DropdownButtonFormField<String>(
              value: cityValue,
              icon: const Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              onChanged: (String newValue) {
                setState(() {
                  cityValue = newValue;
                });
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Tỉnh thành'),
              items: <String>['Hà Nội', 'TP.HCM', 'Đà Nẵng']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          _inputField(addressDetailController, "Địa chỉ cụ thể"),
        ],
      ),
    );
  }

  Widget _basicInfoContainer(String text, bool value) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xFF58f59e),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Radio(value: value, groupValue: 'null', onChanged: (v) {}),
                    Expanded(
                      child: Text('Không'),
                    )
                  ],
                ),
                flex: 1,
              ),
              Expanded(
                child: Row(
                  children: [
                    Radio(value: value, groupValue: 'null', onChanged: (v) {}),
                    Expanded(
                      child: Text('Có'),
                    )
                  ],
                ),
                flex: 1,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _inputField(TextEditingController con, String labelText,
      {String errorText, bool validation}) {
    if (errorText == null) {
      errorText = "Có lỗi xảy ra";
    }
    if (validation == null) {
      validation = true;
    }
    return Container(
      margin: EdgeInsets.only(top: 2, bottom: 2),
      padding: EdgeInsets.only(bottom: 10, top: 10),
      child: TextField(
        controller: con,
        // obscureText: false,
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: labelText,
            errorText: validation ? null : errorText),
      ),
    );
  }
}
