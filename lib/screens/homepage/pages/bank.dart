import 'package:flutter/material.dart';
import 'package:zheeta/constants/color.dart';
import 'package:zheeta/screens/widgets/input_field.dart';
import 'package:zheeta/screens/widgets/primary_button.dart';

class BankAccount extends StatefulWidget {
  const BankAccount({super.key});

  @override
  State<BankAccount> createState() => _BankAccountState();
}

class _BankAccountState extends State<BankAccount> {
  static final TextEditingController _countryController =
      TextEditingController();
  static final TextEditingController _bankController = TextEditingController();
  static final TextEditingController _accNoController = TextEditingController();
  static final TextEditingController _recipientController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secondaryLight,
        appBar: AppBar(
          backgroundColor: secondaryLight,
          elevation: 0.0,
          leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    padding: EdgeInsets.all(5),
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: white, borderRadius: BorderRadius.circular(100)),
                    child: Icon(Icons.arrow_back_ios_new, color: grey)),
              )),
          title: Text(
            'My Bank Account',
            style: TextStyle(
                color: grayscale, fontSize: 18, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InputField(controller: _countryController, label: 'Bank Country'),
              InputField(controller: _bankController, label: 'Select Bank'),
              InputField(controller: _accNoController, label: 'Account Number'),
              InputField(
                  controller: _recipientController,
                  label: 'Recipient (autofill)'),
              SizedBox(height: 20),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: PrimaryButton(title: "Update", action: () {})),
              SizedBox(height: 100),
            ],
          ),
        ));
  }
}
