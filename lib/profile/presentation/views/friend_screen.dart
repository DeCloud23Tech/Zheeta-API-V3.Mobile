import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/primary_button.dart';

@RoutePage()
class FriendScreen extends StatefulWidget {
  const FriendScreen({super.key});

  @override
  State<FriendScreen> createState() => _FriendScreenState();
}

class _FriendScreenState extends State<FriendScreen> {
  int activeTab = 1;
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
        title: Text(
          'Friends',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        actions: [
          SvgPicture.asset('assets/images/icons/search.svg'),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border(),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        activeTab = 1;
                      });
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          Container(
                            height: 3,
                            width: MediaQuery.of(context).size.width * 0.44,
                            decoration: BoxDecoration(
                              color: activeTab == 1 ? AppColors.primaryDark : Colors.transparent,
                              border: Border(),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "My Friends",
                            style: TextStyle(color: activeTab == 1 ? AppColors.grayscale : AppColors.grey, fontSize: 16, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        activeTab = 2;
                      });
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          Container(
                            height: 3,
                            width: MediaQuery.of(context).size.width * 0.44,
                            decoration: BoxDecoration(
                              color: activeTab == 2 ? AppColors.primaryDark : Colors.transparent,
                              border: Border(),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Blocked Users",
                            style: TextStyle(color: activeTab == 2 ? AppColors.grayscale : AppColors.grey, fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            if (activeTab == 1)
              ...List.generate(5, (index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Image.asset('assets/images/avatar.png', fit: BoxFit.cover),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Ronald Richards',
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.primaryDark),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height: 30,
                                    child: PrimaryButton(
                                      invert: true,
                                      showBorder: true,
                                      color: AppColors.secondaryLight,
                                      title: 'Block',
                                      action: () {},
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  SizedBox(
                                    height: 30,
                                    child: PrimaryButton(
                                      title: 'Unblock',
                                      action: () {},
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                );
              }),
            if (activeTab == 2)
              ...List.generate(5, (index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Image.asset('assets/images/avatar.png', fit: BoxFit.cover),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Ronald Richards',
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.primaryDark),
                              ),
                              SizedBox(
                                height: 30,
                                child: PrimaryButton(
                                  title: 'Unblock',
                                  action: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                );
              }),
            SizedBox(height: 500),
          ],
        ),
      ),
    );
  }
}
