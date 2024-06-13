import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/common/enums/others.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/discover/presentation/views/discover_screen.dart';
import 'package:zheeta/feeds/presentation/views/feed_screen.dart';
import 'package:zheeta/messages/presentation/views/messages.dart';
import 'package:zheeta/profile/presentation/views/profile.dart';
import 'package:zheeta/widgets/drawer.dart';
import 'package:zheeta/widgets/top_nav.dart';

import '../../../profile/presentation/viewmodel/user_profile_viewmodel.dart';

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
  late UserProfileViewModel userProfileViewModel;
  // late MatchCriteriaViewModel matchCriteriaViewModel;

  //late NotificationViewModel notificationViewModel;

  int activeTab = 1;


  @override
  void initState() {
    userProfileViewModel = locator<UserProfileViewModel>();
    // matchCriteriaViewModel = locator<MatchCriteriaViewModel>();
    //notificationViewModel = ref.read(notificationViewModelProvider.notifier);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      userProfileViewModel.getSingleUserProfile(context);
      // matchCriteriaViewModel.getMatchCriteria(context);
      //notificationViewModel.getNotifications();
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
      backgroundColor: AppColors.white,
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
              TopNavBtn2(iconType: IconType.menu),
              TopNavBtn2(iconType: IconType.bell),
            ],
          ),
        )
      ],
    ),
    AppBar(backgroundColor: AppColors.secondaryLight, elevation: 0.0)
  ];

  final pages = [DiscoverPage(), FeedsSection(), Messages(), ProfileScreen()];

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
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  decoration: BoxDecoration(
                    color: AppColors.secondaryLight,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: Container(
                                padding: EdgeInsets.all(5),
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Icon(
                                  Icons.close,
                                  color: AppColors.grey,
                                  size: 18,
                                ),
                              ),
                            ),
                            Spacer(),
                            Text(
                              'Create new',
                              style: TextStyle(
                                color: AppColors.grayscale,
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return StatefulBuilder(
                                      builder: (BuildContext context,
                                          StateSetter setState) {
                                        // Search query variable
                                        String searchQuery = '';
                                        return Container(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height *
                                              0.7,
                                          decoration: BoxDecoration(
                                            color: AppColors.secondaryLight,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20.0),
                                              topRight: Radius.circular(20.0),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding:
                                                const EdgeInsets.all(24.0),
                                                child: Row(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () =>
                                                          Navigator.of(context)
                                                              .pop(),
                                                      child: Container(
                                                        padding:
                                                        EdgeInsets.all(5),
                                                        height: 30,
                                                        width: 30,
                                                        decoration:
                                                        BoxDecoration(
                                                          color:
                                                          AppColors.white,
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              100),
                                                        ),
                                                        child: Icon(
                                                          Icons.close,
                                                          color: AppColors.grey,
                                                          size: 18,
                                                        ),
                                                      ),
                                                    ),
                                                    Spacer(),
                                                    Text(
                                                      'Search',
                                                      style: TextStyle(
                                                        color:
                                                        AppColors.grayscale,
                                                        fontSize: 24,
                                                        fontWeight:
                                                        FontWeight.w600,
                                                      ),
                                                    ),
                                                    Spacer(),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.all(15),
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    // Search field
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8),
                                                      ),
                                                      child: TextField(
                                                        onChanged: (value) {
                                                          setState(() {
                                                            searchQuery = value;
                                                          });
                                                        },
                                                        decoration:
                                                        InputDecoration(
                                                          prefixIcon: Icon(
                                                              Icons.search),
                                                          hintText: 'Search',
                                                          border:
                                                          InputBorder.none,
                                                          contentPadding:
                                                          EdgeInsets.all(
                                                              15),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 20),
                                                    // Tab bar
                                                    Container(
                                                      height: 40,
                                                      width:
                                                      MediaQuery.of(context)
                                                          .size
                                                          .width,
                                                      decoration: BoxDecoration(
                                                        color: AppColors.white,
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8),
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                activeTab = 1;
                                                              });
                                                            },
                                                            child: Column(
                                                              children: [
                                                                Container(
                                                                  height: 3,
                                                                  width: MediaQuery.of(
                                                                      context)
                                                                      .size
                                                                      .width *
                                                                      0.46,
                                                                  decoration:
                                                                  BoxDecoration(
                                                                    color: activeTab ==
                                                                        1
                                                                        ? AppColors
                                                                        .primaryDark
                                                                        : Colors
                                                                        .transparent,
                                                                    borderRadius:
                                                                    BorderRadius
                                                                        .circular(8),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                    height: 5),
                                                                Text(
                                                                  "People",
                                                                  style:
                                                                  TextStyle(
                                                                    color: activeTab ==
                                                                        1
                                                                        ? AppColors
                                                                        .grayscale
                                                                        : AppColors
                                                                        .grey,
                                                                    fontSize:
                                                                    16,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                activeTab = 2;
                                                              });
                                                            },
                                                            child: Column(
                                                              children: [
                                                                Container(
                                                                  height: 3,
                                                                  width: MediaQuery.of(
                                                                      context)
                                                                      .size
                                                                      .width *
                                                                      0.46,
                                                                  decoration:
                                                                  BoxDecoration(
                                                                    color: activeTab ==
                                                                        2
                                                                        ? AppColors
                                                                        .primaryDark
                                                                        : Colors
                                                                        .transparent,
                                                                    borderRadius:
                                                                    BorderRadius
                                                                        .circular(8),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                    height: 5),
                                                                Text(
                                                                  "Hashtag",
                                                                  style:
                                                                  TextStyle(
                                                                    color: activeTab ==
                                                                        2
                                                                        ? AppColors
                                                                        .grayscale
                                                                        : AppColors
                                                                        .grey,
                                                                    fontSize:
                                                                    16,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),

                                                    // Content based on active tab
                                                    activeTab == 1
                                                        ? PeopleTabContent(
                                                        searchQuery:
                                                        searchQuery)
                                                        : HashtagTabContent(
                                                        searchQuery:
                                                        searchQuery),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                      'assets/images/icons/card-or-bank.svg'),
                                  SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Post Activity',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.grayscale,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'Share your happenings with your friends',
                                        style: TextStyle(
                                            color: AppColors.grey,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
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

// Define PeopleTabContent widget
class PeopleTabContent extends StatelessWidget {
  final String searchQuery;

  PeopleTabContent({required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    List<String> names = List.generate(10, (index) => 'Name $index');

    // Filtered list based on search query
    List<String> filteredNames = names.where((name) {
      return name.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      margin: EdgeInsets.only(top: 5),
      child: ListView(
        children: List.generate(
          filteredNames.length,
              (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage('assets/images/User.png'),
                ),
                SizedBox(width: 10),
                Text(
                  filteredNames[index],
                  style: TextStyle(
                      color: AppColors.primaryDark,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(width: 15),
                Image.asset('assets/images/verified.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Define HashtagTabContent widget
class HashtagTabContent extends StatelessWidget {
  final String searchQuery;

  HashtagTabContent({required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    List<String> hashtags =
    List.generate(10, (index) => '#Hashtag ${index + 1}');

    // Filtered list based on search query
    List<String> filteredHashtags = hashtags.where((hashtag) {
      return hashtag.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      margin: EdgeInsets.only(top: 5),
      child: ListView(
        children: List.generate(
          filteredHashtags.length,
              (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage('assets/images/User.png'),
                ),
                SizedBox(width: 10),
                Text(
                  filteredHashtags[index],
                  style: TextStyle(
                      color: AppColors.primaryDark,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
