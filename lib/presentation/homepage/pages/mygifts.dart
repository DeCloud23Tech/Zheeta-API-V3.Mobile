import 'package:flutter/material.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/presentation/widgets/primary_button.dart';



class MyGifts extends StatefulWidget {
  const MyGifts({super.key});

  @override
  State<MyGifts> createState() => _MyGiftsState();
}

class _MyGiftsState extends State<MyGifts> {
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
            'My gifts',
            style: TextStyle(
                color: grayscale, fontSize: 24, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var i = 0; i < 10; i++)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: white, borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: secondaryLight.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                padding: EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(8)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    "assets/images/redeem.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Headphone",
                                      style: TextStyle(
                                          color: grayscale,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400)),
                                  SizedBox(height: 5),
                                  Text("\$20.4",
                                      style: TextStyle(
                                          color: primaryDark,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600)),
                                  SizedBox(height: 5),
                                  Text("Sent a day ago",
                                      style: TextStyle(
                                          color: grey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Sender",
                                style: TextStyle(
                                    color: grayscale,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600)),
                            Text("@Christine",
                                style: TextStyle(
                                    color: grayscale,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400)),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Quantity",
                                style: TextStyle(
                                    color: grayscale,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600)),
                            Text("1 Unit",
                                style: TextStyle(
                                    color: grayscale,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400)),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total amount redeemable",
                                style: TextStyle(
                                    color: grayscale,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600)),
                            Text("1 Unit",
                                style: TextStyle(
                                    color: grayscale,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400)),
                          ],
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 30,
                            child: PrimaryButton(
                                title: "Redeem Gift", action: () {})),
                      ],
                    ),
                  ),
                ),
              SizedBox(height: 100),
            ],
          ),
        ));
  }
}
