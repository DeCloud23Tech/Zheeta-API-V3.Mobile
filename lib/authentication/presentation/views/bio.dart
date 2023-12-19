import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zheeta/app/color.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/input_field.dart';
import 'package:zheeta/widgets/primary_button.dart';

class BioData extends StatefulWidget {
  const BioData({super.key});

  @override
  State<BioData> createState() => _BioDataState();
}

class _BioDataState extends State<BioData> {
  bool _isLoading = false;

  final TextEditingController _firstname = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
  final TextEditingController _dob = TextEditingController();

  var sexSelect; //for radio selections
  var sex;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryLight,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              CustomBackButton(),
              SizedBox(height: 40),
              InputField(controller: _firstname, label: 'First Name'),
              InputField(controller: _lastname, label: 'Last Name'),
              Theme(
                  data: Theme.of(context).copyWith(unselectedWidgetColor: primaryDark),
                  child: Row(
                    children: [radioItem('Male'), radioItem('Female'), radioItem('Not specified')],
                  )),
              SizedBox(height: 10),
              TextField(
                  controller: _dob,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: white,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: grey, width: 0.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryDark, width: 1.0),
                      ),
                      hintText: 'Date of Birth (DOB)',
                      hintStyle: TextStyle(color: grey.withOpacity(0.5), fontSize: 14),
                      errorStyle: const TextStyle(color: Colors.red),
                      prefixIcon: Icon(Icons.calendar_today)),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime(2101));
                    if (pickedDate != null) {
                      print(pickedDate);
                      String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
                      print(formattedDate);

                      setState(() {
                        _dob.text = formattedDate;
                      });
                    } else {
                      print("Date is not selected");
                    }
                  }),
              SizedBox(height: 32),
              SizedBox(
                  width: double.infinity,
                  child: PrimaryButton(
                      title: 'Continue',
                      action: () {
                        setState(() {
                          _isLoading == !_isLoading;
                        });
                      }))
            ],
          ),
        ),
      ),
    );
  }

  Row radioItem(data) {
    return Row(
      children: [
        Radio(
            value: data,
            groupValue: sexSelect,
            onChanged: (value) {
              setState(() {
                sexSelect = value;
                sex = data.toString().toLowerCase() == 'male'
                    ? 1
                    : data.toString().toLowerCase() == 'female'
                        ? 2
                        : 0;
              });
              print(sex);
            }),
        Text(data, style: TextStyle(fontSize: 12)),
        SizedBox(width: 5)
      ],
    );
  }
}
