import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/discover/presentation/views/discover.dart';
import 'package:zheeta/feeds/presentation/views/feed_screen.dart';
import 'package:zheeta/messages/presentation/views/messages.dart';
import 'package:zheeta/profile/presentation/views/profile.dart';
import 'package:zheeta/widgets/drawer.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int index = 0;

  final appbar = [
    AppBar(
      backgroundColor: AppColors.primaryDark,
      elevation: 0.0,
      leadingWidth: double.infinity * 0.5,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20, top: 10),
        child: Text(
          'Discover',
          style: TextStyle(color: AppColors.white, fontSize: 32, fontWeight: FontWeight.w600),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Row(
            children: [
              TopNavBtn(icon: 'assets/images/icons/menu.svg'),
              TopNavBtn(icon: 'assets/images/icons/filter.svg'),
              TopNavBtn(icon: 'assets/images/icons/bell.svg'),
            ],
          ),
        )
      ],
    ),
    AppBar(
      backgroundColor: AppColors.secondaryLight,
      elevation: 0.0,
      leadingWidth: double.infinity * 0.5,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20, top: 10),
        child: Text(
          'Feeds',
          style: TextStyle(color: AppColors.grayscale, fontSize: 32, fontWeight: FontWeight.w600),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Row(
            children: [TopNavBtn2(icon: 'assets/images/icons/menu.svg'), TopNavBtn2(icon: 'assets/images/icons/bell.svg')],
          ),
        )
      ],
    ),
    AppBar(
      backgroundColor: AppColors.secondaryLight,
      elevation: 0.0,
      leadingWidth: double.infinity * 0.5,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20, top: 10),
        child: Text(
          'Messages',
          style: TextStyle(color: AppColors.grayscale, fontSize: 32, fontWeight: FontWeight.w600),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Row(
            children: [TopNavBtn2(icon: 'assets/images/icons/bell.svg')],
          ),
        )
      ],
    ),
    AppBar(backgroundColor: AppColors.secondaryLight, elevation: 0.0)
  ];

  final pages = [DiscoverPage(), Feeds(), Messages(), Profile()];

  final bg = [AppColors.primaryDark, AppColors.secondaryLight, AppColors.secondaryLight, AppColors.secondaryLight];

  List icons = [
    ["Discover", "assets/images/icons/card.svg"],
    ["Feed", "assets/images/icons/feed.svg"],
    ["Messages", "assets/images/icons/messages.svg"],
    ["Profile", "assets/images/icons/user.svg"]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg[index],
      appBar: index == 3 ? null : appbar[index],
      drawer: SideDrawer(),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: Platform.isIOS ? 40.0 : 80.0),
        child: SizedBox(
          height: 55,
          width: 55,
          child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  shadowColor: MaterialStateProperty.all<Color>(AppColors.black.withOpacity(0.7)),
                  elevation: MaterialStateProperty.all(10),
                  backgroundColor: MaterialStateProperty.all<Color>(AppColors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ))),
              child: SvgPicture.asset('assets/images/icons/plus.svg')),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          pages[index],
          Positioned(
              child: Stack(
            children: [
              CustomPaint(size: Size(double.infinity, 78), painter: BNBCustomPainter()),
              Container(
                padding: const EdgeInsets.fromLTRB(6, 0, 6, 20),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(icons.length, (i) {
                      return Expanded(
                        child: CupertinoButton(
                          child: AnimatedOpacity(
                            opacity: index == i ? 1 : 0.5,
                            duration: const Duration(milliseconds: 200),
                            child: Stack(clipBehavior: Clip.none, alignment: Alignment.center, children: [
                              SizedBox(
                                  height: 26,
                                  width: 26,
                                  child: SvgPicture.asset(
                                    icons[i][1],
                                    colorFilter: ColorFilter.mode(index == i ? AppColors.primaryDark : AppColors.grey, BlendMode.srcIn),
                                  )),
                              Positioned(
                                top: 32,
                                child: Text(
                                  icons[i][0],
                                  style: TextStyle(fontSize: 10, color: index == i ? AppColors.primaryDark : AppColors.grey),
                                ),
                              ),
                            ]),
                          ),
                          onPressed: () {
                            setState(() {
                              index = i;
                              // _pageController.jumpToPage(i);
                              // _pageController.animateToPage(
                              //   i,
                              //   duration: const Duration(milliseconds: 400),
                              //   curve: Curves.easeInOut,
                              // );
                            });
                          },
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ],
          ))
        ],
      ),
      // body: pages[index],
    );
  }
}

class TopNavBtn extends StatelessWidget {
  final icon;
  const TopNavBtn({super.key, this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Scaffold.of(context).openDrawer();
      },
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
            padding: EdgeInsets.all(10),
            height: 40,
            width: 40,
            decoration: BoxDecoration(color: AppColors.white.withOpacity(0.3), borderRadius: BorderRadius.circular(100)),
            child: SvgPicture.asset(
              icon,
              width: 30,
            )),
      ),
    );
  }
}

class TopNavBtn2 extends StatelessWidget {
  final icon;
  const TopNavBtn2({super.key, this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Scaffold.of(context).openDrawer();
      },
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(padding: EdgeInsets.all(10), height: 40, width: 40, decoration: BoxDecoration(color: AppColors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(100)), child: SvgPicture.asset(icon, width: 30, colorFilter: ColorFilter.mode(AppColors.grey, BlendMode.srcIn))),
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 0); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);

    // Adjust the 0.4 and 0.6 for start and end points
    path.quadraticBezierTo(size.width * 0.55, 0, size.width * 0.42, 0);
    path.arcToPoint(Offset(size.width * 0.58, 0), radius: Radius.circular(38.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
