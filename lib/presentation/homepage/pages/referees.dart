import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/presentation/widgets/primary_button.dart';

class Referees extends StatefulWidget {
  const Referees({super.key});

  @override
  State<Referees> createState() => _RefereesState();
}

class _RefereesState extends State<Referees> {
  var search;
  static final TextEditingController _searchController =
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
            'Referees',
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
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  height: 50,
                  child: TextFormField(
                    onFieldSubmitted: (value) {},
                    onChanged: (value) {},
                    style: TextStyle(color: Colors.black),
                    controller: _searchController,
                    keyboardType: TextInputType.text,
                    cursorColor: primaryDark,
                    decoration: InputDecoration(
                        suffixIcon: Padding(
                            padding: EdgeInsets.all(10),
                            child: SvgPicture.asset(
                              'assets/images/icons/search.svg',
                              width: 10,
                              height: 10,
                            )),
                        border: OutlineInputBorder(),
                        hintText: 'Search',
                        hintStyle: TextStyle(color: hintText)),
                    // focusNode: _focusNode,
                    validator: (searchValue) {
                      if (searchValue!.isEmpty) {
                        return 'Please enter search keyword';
                      }
                      return null;
                    },
                  )),
              SizedBox(height: 20),
              for (var i = 0; i < 20; i++)
                Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              padding: EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(100)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset(
                                  "assets/images/User.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Text("Christine Doe",
                                style: TextStyle(
                                    color: primaryDark,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400)),
                          ],
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: 30,
                            child: PrimaryButton(
                                title: "View Profile", action: () {})),
                      ],
                    )),
              SizedBox(height: 100),
            ],
          ),
        ));
  }
}
