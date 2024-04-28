import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/activity/data/models/activity_model.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/common/enums/others.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/profile/data/model/user_profile_model.dart';
import 'package:zheeta/profile/data/model/view_profile_model.dart';
import 'package:zheeta/profile/presentation/bloc/profile_cubit.dart';
import 'package:zheeta/profile/presentation/viewmodel/user_profile_viewmodel.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/empty_content.dart';
import 'package:zheeta/widgets/loading_screen.dart';
import 'package:zheeta/widgets/media_container.dart';
import 'package:zheeta/widgets/primary_button.dart';
import 'package:zheeta/widgets/top_nav.dart';
import 'package:zheeta/widgets/transparent_button.dart';

@RoutePage<String?>()
class ProfileScreen extends StatefulWidget {
  String? profileId;
  ProfileScreen({super.key, this.profileId});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late UserProfileViewModel userProfileViewModel;

  final controller = ScrollController();
  var _current = 0;
  var activeTab = 1;

  bool invertAppBarIcons = false;
  UserProfileDataModel? theUser;
  @override
  void initState() {
    super.initState();
    userProfileViewModel = locator<UserProfileViewModel>();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (widget.profileId != null) {
        await userProfileViewModel.visitUserProfile(context, widget.profileId!);
        setState(() {
          theUser = userProfileViewModel.visitProfilePage?.profile;
        });
      } else {
        theUser = userProfileViewModel.userProfileModel?.data;
      }
      await userProfileViewModel.loadUserRecentActivity(context);

      //userProfileViewModel.loadSelectedCountryStates('Nigeria');
    });
  }

  bool showFullBio = true;

  @override
  Widget build(BuildContext context) {
    int carouselCount = 1;

    if (theUser != null) {
      carouselCount = theUser?.userCarousels?.length ?? 1;
    }

    controller.addListener(() {
      if (controller.offset > 450) {
        setState(() {
          invertAppBarIcons = true;
        });
      } else {
        setState(() {
          invertAppBarIcons = false;
        });
      }
    });
    return widget.profileId != null &&
            !userProfileViewModel.visitProfilePage!.canViewProfile
        ? BlockedUserContent()
        : theUser == null
            ? SizedBox(
                child: Center(child: Text("No User")),
              )
            : BlocConsumer<ProfileCubit, ProfileState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return Scaffold(
                    backgroundColor: AppColors.secondaryLight,
                    body: CustomScrollView(
                      controller: controller,
                      slivers: <Widget>[
                        SliverAppBar(
                          elevation: 0,
                          centerTitle: true,
                          backgroundColor: AppColors.secondaryLight,
                          surfaceTintColor: AppColors.secondaryLight,
                          scrolledUnderElevation: 0.5,
                          shadowColor: Colors.grey,
                          leadingWidth: MediaQuery.of(context).size.width * 0.4,
                          leading: Row(
                            children: [
                              SizedBox(width: 16),
                              CustomBackButton(
                                isOpaque: invertAppBarIcons,
                                greyBackground: true,
                              ),
                            ],
                          ),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                invertAppBarIcons
                                    ? TopNavBtn2(iconType: IconType.menu)
                                    : TopNavBtn(iconType: IconType.menu),
                                invertAppBarIcons
                                    ? TopNavBtn2(iconType: IconType.bell)
                                    : TopNavBtn(iconType: IconType.bell),
                              ],
                            ),
                            SizedBox(width: 16),
                          ],
                          pinned: true,
                          expandedHeight:
                              MediaQuery.of(context).size.height * 0.55,
                          flexibleSpace: FlexibleSpaceBar(
                            centerTitle: true,
                            background: Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
                                CarouselSlider.builder(
                                  itemCount: theUser?.userCarousels?.length != 0
                                      ? theUser?.userCarousels?.length
                                      : 1,
                                  itemBuilder: (BuildContext context,
                                      int itemIndex, int pageViewIndex) {
                                    if (theUser?.userCarousels?.length != 0)
                                      return ClipRRect(
                                        child: Image.network(
                                            theUser?.userCarousels?[itemIndex]
                                                .carouselPhotoUrl,
                                            fit: BoxFit.cover,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.55,
                                            width: double.infinity),
                                      );
                                    return ClipRRect(
                                      child: Image.network(
                                          theUser?.profile?.profilePhotoURL,
                                          fit: BoxFit.cover,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.55,
                                          width: double.infinity),
                                    );
                                  },
                                  options: CarouselOptions(
                                    autoPlay: false,
                                    height: MediaQuery.of(context).size.height *
                                        0.65,
                                    // enlargeCenterPage: true,
                                    viewportFraction: 1.0,
                                    // aspectRatio: 2.0,
                                    initialPage: 0,
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        _current = index;
                                      });
                                    },
                                  ),
                                ),
                                if (widget.profileId == null &&
                                    theUser!.userCarousels!.length > 0)
                                  Positioned(
                                    bottom: 75,
                                    left: 10,
                                    child: TopNavBtn(iconType: IconType.photo),
                                  ),
                                Positioned(
                                  bottom: 30,
                                  child: Row(
                                    children: [
                                      for (var i = 0; i < carouselCount; i++)
                                        Padding(
                                          padding: const EdgeInsets.all(3),
                                          child: Container(
                                            height: 10,
                                            width: 10,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: _current == i
                                                  ? AppColors.white
                                                  : AppColors.white
                                                      .withOpacity(0.2),
                                            ),
                                          ),
                                        )
                                    ],
                                  ),
                                ),
                                if (widget.profileId != null)
                                  ProfileAddOrLike(
                                    visitProfile:
                                        userProfileViewModel.visitProfilePage,
                                  ),
                              ],
                            ),
                          ),
                        ),
                        SliverList(
                          delegate: SliverChildListDelegate(
                            <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        if (widget.profileId != null)
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: DecorationImage(
                                                    image: NetworkImage(theUser
                                                        ?.profile!
                                                        .profilePhotoURL))),
                                            width: 50,
                                            height: 50,
                                          ),
                                        if (widget.profileId != null)
                                          SizedBox(
                                            width: 10,
                                          ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  if (theUser
                                                      ?.user?.isFullyVerified)
                                                    Image.asset(
                                                        'assets/images/badge.png',
                                                        width: 19,
                                                        height: 19),
                                                  SizedBox(width: 5),
                                                  if (theUser?.subscription
                                                          ?.name ==
                                                      "Yellow")
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10,
                                                              vertical: 5),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          color:
                                                              Color(0xffFEB237),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.3),
                                                              spreadRadius: 0,
                                                              blurRadius: 2,
                                                              offset:
                                                                  Offset(0, 1),
                                                            ),
                                                          ]),
                                                      child: Text(
                                                        'Premium',
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: AppColors
                                                                .white),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    '${theUser?.profile?.firstName} ${theUser?.profile?.lastName}',
                                                    style: const TextStyle(
                                                      color: AppColors.darkText,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 24,
                                                    ),
                                                  ),
                                                  SizedBox(width: 20),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 3,
                                                                horizontal: 6),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: AppColors
                                                              .primaryDark,
                                                          gradient:
                                                              const LinearGradient(
                                                            begin: Alignment
                                                                .topLeft,
                                                            end: Alignment
                                                                .bottomRight,
                                                            colors: [
                                                              AppColors
                                                                  .primaryLight,
                                                              AppColors
                                                                  .primaryDark
                                                            ],
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            SvgPicture.asset(
                                                                'assets/images/female.svg',
                                                                width: 11),
                                                            SizedBox(width: 3),
                                                            Text(
                                                              '${theUser?.profile?.age}',
                                                              style: const TextStyle(
                                                                  color:
                                                                      AppColors
                                                                          .white,
                                                                  fontSize: 10),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(width: 8),
                                                      Container(
                                                        width: 25,
                                                        height: 20,
                                                        padding:
                                                            EdgeInsets.all(1),
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xff07C35D),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(6),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            theUser?.profile
                                                                        ?.gender ==
                                                                    1
                                                                ? 'M'
                                                                : 'F',
                                                            style: const TextStyle(
                                                                color: AppColors
                                                                    .white,
                                                                fontSize: 12),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(),
                                                ],
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                '${theUser?.residentialAddress?.city}, ${theUser?.residentialAddress?.country}(2 miles away)',
                                                style: const TextStyle(
                                                  color: AppColors.grey,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (widget.profileId == null)
                                          GestureDetector(
                                            onTap: () {
                                              // Scaffold.of(context).openDrawer();
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.all(5),
                                              child: Container(
                                                padding: EdgeInsets.all(10),
                                                height: 40,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                  color: AppColors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                ),
                                                child: SvgPicture.asset(
                                                  'assets/images/icons/dots.svg',
                                                  width: 30,
                                                ),
                                              ),
                                            ),
                                          )
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    Container(
                                      padding: EdgeInsets.all(22),
                                      decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          GestureDetector(
                                            onTap: () {},
                                            child: Column(
                                              children: [
                                                Text(
                                                  '${theUser?.profileCounters?.friendsCount}',
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.grayscale,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                SizedBox(height: 3),
                                                Text(
                                                  "Friends",
                                                  style: TextStyle(
                                                      color: AppColors.grey,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {},
                                            child: Column(
                                              children: [
                                                Text(
                                                  '${theUser?.profileCounters?.refereesCount}',
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.grayscale,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                SizedBox(height: 3),
                                                Text(
                                                  "Referees",
                                                  style: TextStyle(
                                                      color: AppColors.grey,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {},
                                            child: Column(
                                              children: [
                                                Text(
                                                  '${theUser?.profileCounters?.postCount}',
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.grayscale,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                SizedBox(height: 3),
                                                Text(
                                                  "Posts",
                                                  style: TextStyle(
                                                      color: AppColors.grey,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    if (widget.profileId == null)
                                      SizedBox(height: 15),
                                    if (widget.profileId == null)
                                      PrimaryButton(
                                        icon: 'assets/images/icons/rocket.svg',
                                        invert: false,
                                        title: 'Boost Profile',
                                        action: () {},
                                      ),
                                    SizedBox(height: 20),
                                    Container(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: AppColors.white,
                                        border: Border(),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.44,
                                                    decoration: BoxDecoration(
                                                      color: activeTab == 1
                                                          ? AppColors
                                                              .primaryDark
                                                          : Colors.transparent,
                                                      border: Border(),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    "Bio",
                                                    style: TextStyle(
                                                        color: activeTab == 1
                                                            ? AppColors
                                                                .grayscale
                                                            : AppColors.grey,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600),
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
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.44,
                                                    decoration: BoxDecoration(
                                                      color: activeTab == 2
                                                          ? AppColors
                                                              .primaryDark
                                                          : Colors.transparent,
                                                      border: Border(),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    "Post",
                                                    style: TextStyle(
                                                        color: activeTab == 2
                                                            ? AppColors
                                                                .grayscale
                                                            : AppColors.grey,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    activeTab == 1
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              if (theUser?.profile?.aboutMe
                                                      .length >
                                                  0)
                                                SizedBox(height: 20),
                                              if (theUser?.profile?.aboutMe
                                                      .length >
                                                  0)
                                                Text(
                                                  '${theUser?.profile?.firstName} ${theUser?.profile?.lastName}',
                                                  style: const TextStyle(
                                                    color:
                                                        AppColors.primaryDark,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              Text(
                                                theUser?.profile?.aboutMe
                                                                .length >
                                                            150 &&
                                                        showFullBio
                                                    ? theUser?.profile?.aboutMe
                                                            .substring(0, 150) +
                                                        "..."
                                                    : theUser?.profile?.aboutMe,
                                                style: const TextStyle(
                                                  color: AppColors.grayscale,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 13,
                                                ),
                                              ),
                                              if (theUser?.profile?.aboutMe
                                                      .length >
                                                  0)
                                                SizedBox(height: 5),
                                              if (theUser?.profile?.aboutMe
                                                      .length >
                                                  150)
                                                SizedBox(
                                                  height: 10,
                                                ),
                                              if (theUser?.profile?.aboutMe
                                                      .length >
                                                  150)
                                                Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: TransparentButtonNew(
                                                    title: showFullBio
                                                        ? 'Show More'
                                                        : 'Show Less',
                                                    action: () {
                                                      setState(() {
                                                        showFullBio =
                                                            !showFullBio;
                                                      });
                                                    },
                                                  ),
                                                ),
                                              SizedBox(height: 20),
                                              SizedBox(height: 20),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Recent Referees",
                                                    style: TextStyle(
                                                        color:
                                                            AppColors.grayscale,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  if (theUser!.userDownlines!
                                                          .length >
                                                      0)
                                                    TransparentButtonNew(
                                                      title: 'View all',
                                                      action: () {},
                                                    ),
                                                ],
                                              ),
                                              SizedBox(height: 10),
                                              SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                    children: theUser
                                                            ?.userDownlines!
                                                            .map((e) {
                                                          return GestureDetector(
                                                            onTap: () {},
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      right:
                                                                          10),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                                child: Image.network(
                                                                    e
                                                                        .profilePhotoURL,
                                                                    height: 42,
                                                                    width: 42,
                                                                    fit: BoxFit
                                                                        .cover),
                                                              ),
                                                            ),
                                                          );
                                                        }).toList() ??
                                                        []
                                                    // children: [
                                                    //   for (var i = 0; i < 5; i++)
                                                    //     GestureDetector(
                                                    //       onTap: () {},
                                                    //       child: Padding(
                                                    //         padding: EdgeInsets.only(right: 10),
                                                    //         child: ClipRRect(
                                                    //           borderRadius:
                                                    //               BorderRadius.circular(8),
                                                    //           child: Image.asset(
                                                    //               "assets/images/ref.png",
                                                    //               height: 42,
                                                    //               width: 42,
                                                    //               fit: BoxFit.cover),
                                                    //         ),
                                                    //       ),
                                                    //     )
                                                    // ],
                                                    ),
                                              ),
                                              SizedBox(height: 20),
                                              Text(
                                                "Basic Profile",
                                                style: TextStyle(
                                                    color: AppColors.grayscale,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              SizedBox(height: 10),
                                              BasicProfileProp(
                                                leftTitle: 'Height',
                                                leftValue:
                                                    '${theUser?.profile?.height.round()}cm',
                                                rightTitle: 'Weight',
                                                rightValue:
                                                    '${theUser?.profile?.weight.round()}kg',
                                              ),
                                              BasicProfileProp(
                                                leftTitle: 'Body Type',
                                                leftValue:
                                                    '${theUser?.profile?.bodyType}',
                                                rightTitle: 'Occupation',
                                                rightValue:
                                                    '${theUser?.profile?.occupation}',
                                              ),
                                              BasicProfileProp(
                                                leftTitle: 'Complexion',
                                                leftValue:
                                                    '${theUser?.profile?.complexion}',
                                                rightTitle: 'Language',
                                                rightValue:
                                                    '${theUser?.profile?.languageCSV}',
                                              ),
                                              BasicProfileProp(
                                                leftTitle: 'Religion',
                                                leftValue:
                                                    '${theUser?.profile?.religion}',
                                              ),
                                              SizedBox(height: 20),
                                              Text(
                                                "Interest",
                                                style: TextStyle(
                                                    color: AppColors.grayscale,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              SizedBox(height: 10),
                                              Wrap(
                                                  runSpacing: 10,
                                                  spacing: 10,
                                                  children: theUser?.interests!
                                                          .map((e) {
                                                        return InterestWidget(
                                                            title: e.title);
                                                      }).toList() ??
                                                      []
                                                  // children: [
                                                  //   InterestWidget(title: 'Friend WB'),
                                                  //   InterestWidget(title: 'Hangout'),
                                                  //   InterestWidget(title: 'Dating'),
                                                  //   InterestWidget(title: 'Body Massage'),
                                                  //   InterestWidget(title: 'Friends'),
                                                  //   InterestWidget(
                                                  //       title: 'Serious Relationships'),
                                                  //   InterestWidget(title: 'Massage Plus'),
                                                  //   InterestWidget(title: 'Networking'),
                                                  // ],
                                                  ),
                                            ],
                                          )
                                        : PostsWidget(
                                            medias: userProfileViewModel
                                                .userActivityModel?.data,
                                          ),
                                    SizedBox(height: 200),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                });
  }
}

class BasicProfileProp extends StatelessWidget {
  String? leftTitle;
  String? leftValue;
  String? rightTitle;
  String? rightValue;
  BasicProfileProp({
    super.key,
    this.leftTitle,
    this.leftValue,
    this.rightTitle,
    this.rightValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Row(
                children: [
                  Text(
                    leftTitle != null ? '$leftTitle: ' : '',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    leftValue != null ? '$leftValue' : '',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff979797)),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  rightTitle != null ? '$rightTitle: ' : '',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                Text(
                  rightValue != null ? '$rightValue' : '',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff979797)),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 15),
      ],
    );
  }
}

class InterestWidget extends StatelessWidget {
  const InterestWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        title,
        style: TextStyle(
            color: AppColors.grayscale,
            fontSize: 12,
            fontWeight: FontWeight.w400),
      ),
    );
  }
}

class ProfileAddOrLike extends StatelessWidget {
  ViewProfileModel? visitProfile;
  ProfileAddOrLike({
    super.key,
    this.visitProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if (visitProfile!.canAddFriend)
            Container(
              color: AppColors.primaryDark,
              height: 50,
              width: MediaQuery.of(context).size.width * 0.4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/images/icons/add_friend.svg'),
                  SizedBox(width: 10),
                  Text(
                    'Add Friend',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white),
                  ),
                ],
              ),
            ),
          if (visitProfile!.canAddFriend) SizedBox(width: 8),
          if (visitProfile!.canAddFriend)
            Container(
              color: AppColors.primaryDark,
              height: 50,
              width: MediaQuery.of(context).size.width * 0.4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/images/icons/star.svg'),
                  SizedBox(width: 10),
                  Text(
                    'Super-FR',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white),
                  ),
                ],
              ),
            ),
          if (visitProfile!.isFriend)
            Container(
              color: AppColors.primaryDark,
              height: 50,
              width: MediaQuery.of(context).size.width * 0.4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //SvgPicture.asset('assets/images/icons/add_friend.svg'),
                  SizedBox(width: 10),
                  Text(
                    'Unfriend',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white),
                  ),
                ],
              ),
            ),
          if (visitProfile!.isFriend) SizedBox(width: 8),
          if (visitProfile!.isFriend && visitProfile!.canMessage)
            Container(
              color: AppColors.primaryDark,
              height: 50,
              width: MediaQuery.of(context).size.width * 0.4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/images/icons/chat_user.svg'),
                  SizedBox(width: 10),
                  Text(
                    'Chat User',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class PostsWidget extends ConsumerStatefulWidget {
  bool isVideo;
  List<ActivityModel>? medias;
  PostsWidget({super.key, this.isVideo = false, required this.medias});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PostsWidgetState();
}

class _PostsWidgetState extends ConsumerState<PostsWidget> {
  @override
  Widget build(BuildContext context) {
    // List<String> theMedia = [];
    // if(widget.medias != null){
    //   theMedia = widget.medias?.map((e) => e.mediaCollectionURL[0]).toList();
    // }
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        width: double.infinity,
        child: Wrap(
            runSpacing: 10,
            alignment: WrapAlignment.spaceBetween,
            // runAlignment: WrapAlignment.spaceBetween,
            children: widget.medias!
                .map((e) => MediaContainer(mediaPath: e.mediaCollectionURL[0]))
                .toList()
            // children: [
            //   ...List.generate(10, (index) {
            //     return MediaContainer();
            //     // return Container(
            //     //   height: 170,
            //     //   width: 122,
            //     //   decoration:
            //     //       BoxDecoration(borderRadius: BorderRadius.circular(10)),
            //     //   clipBehavior: Clip.hardEdge,
            //     //   child: Image.asset('assets/images/post.png', fit: BoxFit.cover),
            //     // );
            //   })
            // ],
            ),
      ),
    );
  }
}
