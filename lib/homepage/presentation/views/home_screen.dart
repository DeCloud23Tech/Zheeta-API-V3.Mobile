import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/common/enums/others.dart';
import 'package:zheeta/discover/presentation/viewmodel/match_criteria_viewmodel.dart';
import 'package:zheeta/discover/presentation/views/discover_screen.dart';
import 'package:zheeta/feeds/presentation/views/feed_screen.dart';
import 'package:zheeta/messages/presentation/views/messages.dart';
import 'package:zheeta/notification/presentation/viewmodel/notification_viewmodel.dart';
import 'package:zheeta/profile/presentation/views/profile.dart';
import 'package:zheeta/widgets/drawer.dart';
import 'package:zheeta/widgets/top_nav.dart';

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  late MatchCriteriaViewModel matchCriteriaViewModel;
  late NotificationViewModel notificationViewModel;

  @override
  void initState() {
    matchCriteriaViewModel = ref.read(matchCriteriaViewModelProvider.notifier);
    notificationViewModel = ref.read(notificationViewModelProvider.notifier);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      matchCriteriaViewModel.getMatchCriteria();
      notificationViewModel.getNotifications();
    });
    super.initState();
  }

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
          style: TextStyle(
              color: AppColors.white,
              fontSize: 32,
              fontWeight: FontWeight.w600),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Row(
            children: [
              TopNavBtn(iconType: IconType.menu),
              TopNavBtn(iconType: IconType.filter),
              TopNavBtn(iconType: IconType.bell),
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
          style: TextStyle(
              color: AppColors.grayscale,
              fontSize: 32,
              fontWeight: FontWeight.w600),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Row(
            children: [
              TopNavBtn2(iconType: IconType.menu),
              TopNavBtn2(iconType: IconType.bell),
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
          'Messages',
          style: TextStyle(
              color: AppColors.grayscale,
              fontSize: 32,
              fontWeight: FontWeight.w600),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Row(
            children: [
              TopNavBtn2(iconType: IconType.bell),
            ],
          ),
        )
      ],
    ),
    AppBar(backgroundColor: AppColors.secondaryLight, elevation: 0.0)
  ];

  final pages = [DiscoverPage(), Feeds(), Messages(), ProfileScreen()];

  final bg = [
    AppColors.primaryDark,
    AppColors.secondaryLight,
    AppColors.secondaryLight,
    AppColors.secondaryLight
  ];

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

      floatingActionButton: Transform.translate(
        offset: Offset(0, -30),
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          backgroundColor: Colors.white,
          onPressed: () {},
          child: SvgPicture.asset('assets/images/icons/plus.svg'),
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
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset('assets/images/bottom_nav.png',
                    width: double.infinity),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(6, 0, 6, 10),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Container(
                    // decoration: BoxDecoration(color: Colors.blue),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(
                        icons.length,
                        (i) {
                          return Expanded(
                            child: CupertinoButton(
                              child: AnimatedOpacity(
                                opacity: index == i ? 1 : 0.5,
                                duration: const Duration(milliseconds: 200),
                                child: SizedBox(
                                  height: 26,
                                  width: 26,
                                  child: SvgPicture.asset(
                                    icons[i][1],
                                    colorFilter: ColorFilter.mode(
                                        index == i
                                            ? AppColors.primaryDark
                                            : AppColors.grey,
                                        BlendMode.srcIn),
                                  ),
                                ),
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
                        },
                      ),
                    ),
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
