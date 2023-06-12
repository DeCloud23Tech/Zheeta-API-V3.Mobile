import 'package:flutter/material.dart';
import 'package:zheeta/constants/color.dart';
import 'package:zheeta/screens/widgets/primary_button.dart';

class PendingRequests extends StatefulWidget {
  const PendingRequests({super.key});

  @override
  State<PendingRequests> createState() => _PendingRequestsState();
}

class _PendingRequestsState extends State<PendingRequests> {
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
          title: Column(
            children: [
              Text(
                'Pending requests',
                style: TextStyle(
                    color: grayscale,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                'Users waiting to be friend',
                style: TextStyle(
                    color: grey, fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ],
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
                    child: Row(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              padding: EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(8)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  "assets/images/User.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("@Khareem23",
                                    style: TextStyle(
                                        color: grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400)),
                                Text("Christine Doe",
                                    style: TextStyle(
                                        color: grayscale,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400)),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        height: 30,
                                        child: PrimaryButton(
                                            invert: true,
                                            color: secondaryLight,
                                            title: "Reject",
                                            action: () {})),
                                    SizedBox(width: 20),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.35,
                                        height: 30,
                                        child: PrimaryButton(
                                            title: "Accept", action: () {}))
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
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
