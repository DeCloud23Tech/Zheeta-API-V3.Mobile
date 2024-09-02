import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/common/enums/others.dart';
import 'package:zheeta/discover/presentation/views/discover_screen.dart';
import 'package:zheeta/feeds/presentation/views/feed_screen.dart';
import 'package:zheeta/messages/presentation/views/messages.dart';
import 'package:zheeta/profile/presentation/views/profile_screen.dart';
import 'package:zheeta/widgets/drawer.dart';
import 'package:zheeta/widgets/top_nav.dart';

import '../../../app/common/storage/local_storage_impl.dart';
import '../../../app/common/storage/storage_keys.dart';
import '../../../app/injection/di.dart';
import '../../../app/router/app_router.gr.dart';
import '../../../discover/presentation/bloc/matches_bloc/matches_cubit.dart';
import '../../../profile/presentation/bloc/profile_cubit/profile_cubit.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProfileCubit profileCubit = locator<ProfileCubit>();

  int activeTab = 1;
  int index = 0;

  @override
  void initState() {
    super.initState();
    _initializeProfile();
  }

  Future<void> _initializeProfile() async {
    final result = await profileCubit.getSingleUserProfileCubit();
    if (result == null) {
      context.router.push(BioDataRoute());
    } else if (result.data.profile?.profilePhotoURL == null) {
      context.router
          .push(ProfilePhotoRoute(username: result.data.user!.userName));
    } else {
      await context
          .read<MatchesCubit>()
          .getMatchCubit(userId: result.data.user?.userId);
      sessionManager.set(
          SessionManagerKeys.authUserIdString, result.data.user?.userId);
    }
  }

  // Future<void> _loadMatches(BuildContext context, String? userId) async {
  //   if (userId == null) return;
  //   // await context.read<MatchesCubit>().populateMatchesCubit();
  //   await context.read<MatchesCubit>().getMatchCubit(userId: userId);
  // }

  final appBars = [
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
              TopNavBtn(iconType: IconType.menu, color: Colors.white),
              TopNavBtn(iconType: IconType.filter, color: Colors.white),
              TopNavBtn(iconType: IconType.bell, color: Colors.white),
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
    null // For ProfileScreen, no AppBar
  ];

  final pages = [DiscoverPage(), FeedsSection(), Messages(), ProfileScreen()];

  final bgColors = [
    AppColors.primaryDark,
    AppColors.secondaryLight,
    AppColors.secondaryLight,
    AppColors.secondaryLight,
  ];

  final icons = [
    ["Discover", "assets/images/icons/card.svg"],
    ["Feed", "assets/images/icons/feed.svg"],
    ["Messages", "assets/images/icons/messages.svg"],
    ["Profile", "assets/images/icons/user.svg"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColors[index],
      appBar: appBars[index],
      drawer: SideDrawer(),
      floatingActionButton: _buildFloatingActionButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          pages[index],
          _buildBottomNavigationBar(),
        ],
      ),
    );
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -30),
      child: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        backgroundColor: Colors.white,
        onPressed: () {
          _showCreateNewBottomSheet(context);
        },
        child: SvgPicture.asset('assets/images/icons/plus.svg'),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Positioned(
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
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  icons.length,
                  (i) => _buildNavItem(i),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(int i) {
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
                index == i ? AppColors.primaryDark : AppColors.grey,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        onPressed: () {
          setState(() {
            index = i;
          });
        },
      ),
    );
  }

  void _showCreateNewBottomSheet(BuildContext context) {
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
              _buildCreateNewHeader(context),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildPostActivityOption(context),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCreateNewHeader(BuildContext context) {
    return Padding(
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
    );
  }

  Widget _buildPostActivityOption(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
        _showSearchBottomSheet(context);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset('assets/images/icons/card-or-bank.svg'),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showSearchBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            String searchQuery = '';
            return Container(
              height: MediaQuery.of(context).size.height * 0.7,
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
                  _buildSearchHeader(context),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSearchField(setState, searchQuery),
                        SizedBox(height: 20),
                        _buildTabBar(setState),
                        activeTab == 1
                            ? PeopleTabContent(searchQuery: searchQuery)
                            : HashtagTabContent(searchQuery: searchQuery),
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
  }

  Widget _buildSearchHeader(BuildContext context) {
    return Padding(
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
            'Search',
            style: TextStyle(
              color: AppColors.grayscale,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }

  Widget _buildSearchField(StateSetter setState, String searchQuery) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        onChanged: (value) {
          setState(() {
            searchQuery = value;
          });
        },
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: 'Search',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15),
        ),
      ),
    );
  }

  Widget _buildTabBar(StateSetter setState) {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          _buildTabItem(setState, 1, "People"),
          _buildTabItem(setState, 2, "Hashtag"),
        ],
      ),
    );
  }

  Widget _buildTabItem(StateSetter setState, int tab, String title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          activeTab = tab;
        });
      },
      child: Column(
        children: [
          Container(
            height: 3,
            width: MediaQuery.of(context).size.width * 0.46,
            decoration: BoxDecoration(
              color:
                  activeTab == tab ? AppColors.primaryDark : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(
              color: activeTab == tab ? AppColors.grayscale : AppColors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
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
