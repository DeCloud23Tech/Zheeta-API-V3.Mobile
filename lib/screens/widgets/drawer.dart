import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:zheeta/constants/color.dart';
import 'package:zheeta/screens/authentication/pages/signin.dart';
import 'package:zheeta/screens/homepage/pages/bank.dart';
import 'package:zheeta/screens/homepage/pages/giftshop.dart';
import 'package:zheeta/screens/homepage/pages/mygifts.dart';
import 'package:zheeta/screens/homepage/pages/pending.dart';
import 'package:zheeta/screens/homepage/pages/referees.dart';
import 'package:zheeta/screens/widgets/primary_button.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({super.key});

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Drawer(
            elevation: 0.0,
            child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(color: primaryDark),
                child: ListView(padding: EdgeInsets.zero, children: [
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(19),
                              child: Image.asset(
                                'assets/images/User.png',
                                height: 57,
                                width: 57,
                                fit: BoxFit.cover,
                              )),
                          SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images/icons/verified.svg'),
                                      SizedBox(width: 5),
                                      Text("Christine Doe",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400)),
                                      SizedBox(height: 5)
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("@christinedoe",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400)),
                                ],
                              ),
                              SizedBox(height: 20),
                            ],
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Scaffold.of(context).closeDrawer();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                              padding: EdgeInsets.all(10),
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: white.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(100)),
                              child: SvgPicture.asset(
                                'assets/images/icons/close.svg',
                                width: 30,
                              )),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              Text("12k",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400)),
                              Text("Friends",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400))
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              Text("20",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400)),
                              Text("Referees",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400))
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              Text("300",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400)),
                              Text("Posts",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: PrimaryButton(
                        invert: true,
                        icon: "assets/images/icons/manage.svg",
                        title: 'Manage User',
                        action: () {}),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("My Communities",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500)),
                      Text("View All",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w400))
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 70,
                        padding: EdgeInsets.all(14),
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(8)),
                        child: SvgPicture.asset("assets/images/icons/plus.svg"),
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.77,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (var i = 0; i < 6; i++)
                                community(context, "Community 1",
                                    "assets/images/comm.png", PendingRequests())
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Wrap(
                    runSpacing: 10,
                    spacing: 15,
                    children: [
                      menu(context, 'Wallet', "assets/images/icons/manage.svg",
                          () {}),
                      menu(context, 'My Friend Request',
                          "assets/images/icons/request.svg", PendingRequests()),
                      menu(context, 'Gift Shop', "assets/images/icons/shop.svg",
                          GiftShop()),
                      menu(context, 'My Gifts', "assets/images/icons/gifts.svg",
                          MyGifts()),
                      menu(context, 'Bank Account',
                          "assets/images/icons/bank.svg", BankAccount()),
                      menu(context, 'Subscription Plan',
                          "assets/images/icons/subscription.svg", () {}),
                      menu(context, 'My Referees',
                          "assets/images/icons/referees.svg", Referees()),
                      menu(context, 'Nearby Users',
                          "assets/images/icons/nearby.svg", () {})
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 100,
                    padding: EdgeInsets.only(left: 15, top: 15, right: 15),
                    decoration: BoxDecoration(
                        color: white, borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Z- \$ Rate in my Local Currency",
                            style: TextStyle(
                                color: darkText,
                                fontSize: 14,
                                fontWeight: FontWeight.w400)),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: secondaryLight,
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("1 USD",
                                  style: TextStyle(
                                      color: darkText,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                              Container(
                                color: primaryDark,
                                height: 15,
                                width: 1,
                              ),
                              Text("740.00 NGN",
                                  style: TextStyle(
                                      color: darkText,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 40,
                    child: PrimaryButton(
                        invert: true,
                        icon: "assets/images/icons/logout.svg",
                        title: 'Logout',
                        action: () {
                          Scaffold.of(context).closeDrawer();
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeftWithFade,
                                  child: SignIn()));
                        }),
                  ),
                ]))));
  }

  GestureDetector menu(BuildContext context, String title, String icon, page) {
    return GestureDetector(
      onTap: () {
        Scaffold.of(context).closeDrawer();
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.rightToLeftWithFade, child: page));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.44,
        height: 70,
        padding: EdgeInsets.only(left: 15, top: 15),
        decoration:
            BoxDecoration(color: white, borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(icon),
            SizedBox(height: 5),
            Text(title,
                style: TextStyle(
                    color: darkText, fontSize: 14, fontWeight: FontWeight.w400))
          ],
        ),
      ),
    );
  }

  GestureDetector community(
      BuildContext context, String title, String icon, page) {
    return GestureDetector(
      onTap: () {
        Scaffold.of(context).closeDrawer();
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.rightToLeftWithFade, child: page));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 6.0, right: 6.0),
        child: Column(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: white, borderRadius: BorderRadius.circular(8)),
              child: Image.asset(icon),
            ),
            SizedBox(height: 5),
            Text(title,
                style: TextStyle(
                    color: white, fontSize: 10, fontWeight: FontWeight.w400))
          ],
        ),
      ),
    );
  }
}
