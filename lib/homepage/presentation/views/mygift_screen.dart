import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zheeta/app/color.dart';
import 'package:zheeta/widgets/primary_button.dart';

@RoutePage()
class MyGiftScreen extends StatefulWidget {
  const MyGiftScreen({super.key});

  @override
  State<MyGiftScreen> createState() => _MyGiftScreenState();
}

class _MyGiftScreenState extends State<MyGiftScreen> {
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
            'My gifts',
            style: TextStyle(color: AppColors.grayscale, fontSize: 24, fontWeight: FontWeight.w600),
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
                    decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(color: AppColors.secondaryLight.withOpacity(0.7), borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                padding: EdgeInsets.all(1),
                                decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(8)),
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
                                  Text("Headphone", style: TextStyle(color: AppColors.grayscale, fontSize: 14, fontWeight: FontWeight.w400)),
                                  SizedBox(height: 5),
                                  Text("\$20.4", style: TextStyle(color: AppColors.primaryDark, fontSize: 16, fontWeight: FontWeight.w600)),
                                  SizedBox(height: 5),
                                  Text("Sent a day ago", style: TextStyle(color: AppColors.grey, fontSize: 12, fontWeight: FontWeight.w400)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Sender", style: TextStyle(color: AppColors.grayscale, fontSize: 16, fontWeight: FontWeight.w600)),
                            Text("@Christine", style: TextStyle(color: AppColors.grayscale, fontSize: 14, fontWeight: FontWeight.w400)),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Quantity", style: TextStyle(color: AppColors.grayscale, fontSize: 16, fontWeight: FontWeight.w600)),
                            Text("1 Unit", style: TextStyle(color: AppColors.grayscale, fontSize: 14, fontWeight: FontWeight.w400)),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total amount redeemable", style: TextStyle(color: AppColors.grayscale, fontSize: 16, fontWeight: FontWeight.w600)),
                            Text("1 Unit", style: TextStyle(color: AppColors.grayscale, fontSize: 14, fontWeight: FontWeight.w400)),
                          ],
                        ),
                        SizedBox(height: 20),
                        SizedBox(width: MediaQuery.of(context).size.width, height: 30, child: PrimaryButton(title: "Redeem Gift", action: () {})),
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
