import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zheeta/app/color.dart';
import 'package:zheeta/widgets/input_field.dart';
import 'package:zheeta/widgets/primary_button.dart';

@RoutePage()
class BankAccountScreen extends StatefulWidget {
  const BankAccountScreen({super.key});

  @override
  State<BankAccountScreen> createState() => _BankAccountScreenState();
}

class _BankAccountScreenState extends State<BankAccountScreen> {
  static final TextEditingController _countryController = TextEditingController();
  static final TextEditingController _bankController = TextEditingController();
  static final TextEditingController _accNoController = TextEditingController();
  static final TextEditingController _recipientController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.secondaryLight,
        appBar: AppBar(
          backgroundColor: AppColors.secondaryLight,
          elevation: 0.0,
          leading: GestureDetector(
              onTap: () => context.router.pop(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(padding: EdgeInsets.all(5), height: 30, width: 30, decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(100)), child: Icon(Icons.arrow_back_ios_new, color: AppColors.grey)),
              )),
          title: Text(
            'My Bank Account',
            style: TextStyle(color: AppColors.grayscale, fontSize: 18, fontWeight: FontWeight.w600),
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
              InputField(controller: _recipientController, label: 'Recipient (autofill)'),
              SizedBox(height: 20),
              SizedBox(width: MediaQuery.of(context).size.width, child: PrimaryButton(title: "Update", action: () {})),
              SizedBox(height: 100),
            ],
          ),
        ));
  }
}
