import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/primary_button.dart';

@RoutePage()
class PendingRequestScreen extends StatefulWidget {
  const PendingRequestScreen({super.key});

  @override
  State<PendingRequestScreen> createState() => _PendingRequestScreenState();
}

class _PendingRequestScreenState extends State<PendingRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.secondaryLight,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: AppColors.secondaryLight,
          surfaceTintColor: AppColors.secondaryLight,
          scrolledUnderElevation: 0.5,
          shadowColor: Colors.grey,
          leadingWidth: MediaQuery.of(context).size.width * 0.2,
          leading: Row(
            children: [
              AppBackButton(),
            ],
          ),
          title: Column(
            children: [
              Text(
                'Pending requests',
                style: TextStyle(color: AppColors.grayscale, fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Text(
                'Users waiting to be friend',
                style: TextStyle(color: AppColors.grey, fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ],
          ),
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
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          padding: EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              "assets/images/User.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "@Khareem23",
                                style: TextStyle(color: AppColors.grey, fontSize: 12, fontWeight: FontWeight.w400),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Christine Doe",
                                    style: TextStyle(color: AppColors.grayscale, fontSize: 14, fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(width: 10),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 6),
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryDark,
                                      gradient: const LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [AppColors.primaryLight, AppColors.primaryDark],
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset('assets/images/female.svg', width: 10),
                                        SizedBox(width: 3),
                                        Text(
                                          '23',
                                          style: const TextStyle(color: AppColors.white, fontSize: 9),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 6),
                                  Container(
                                    width: 24,
                                    height: 19,
                                    padding: EdgeInsets.all(1),
                                    decoration: BoxDecoration(
                                      color: Color(0xff07C35D),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'F',
                                        style: const TextStyle(color: AppColors.white, fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              SizedBox(
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.345,
                                      height: 30,
                                      child: PrimaryButton(
                                        invert: true,
                                        color: AppColors.secondaryLight,
                                        title: "Reject",
                                        action: () {},
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.345,
                                      height: 30,
                                      child: PrimaryButton(
                                        title: "Accept",
                                        action: () {},
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
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
