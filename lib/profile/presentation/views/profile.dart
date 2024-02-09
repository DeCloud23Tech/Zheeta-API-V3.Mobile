import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/widgets/media_container.dart';
import 'package:zheeta/widgets/primary_button.dart';
import 'package:zheeta/widgets/transparent_button.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var _current = 0;
  var activeTab = 1;

  String profileBio =
      "My name is Christine Doe and I enjoy meeting new people and finding ways to help them have an uplifting experience. I enjoy reading, and the knowledge ...";
  bool showFullBio = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.secondaryLight,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.65,
                    width: double.infinity,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        CarouselSlider.builder(
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int itemIndex,
                                  int pageViewIndex) =>
                              ClipRRect(
                            child: Image.asset(
                              "assets/images/User.png",
                              fit: BoxFit.cover,
                              height: MediaQuery.of(context).size.height * 0.65,
                              width: double.infinity,
                              // loadingBuilder: (BuildContext context, Widget image,
                              //     ImageChunkEvent? loadingProgress) {
                              //   if (loadingProgress == null) return image;
                              //   return Shimmer.fromColors(
                              //       baseColor: grey.withOpacity(0.05),
                              //       highlightColor: grey.withOpacity(0.1),
                              //       child: Container(
                              //         width: MediaQuery.of(context).size.width,
                              //         height: 120,
                              //         decoration: BoxDecoration(
                              //           color: grey,
                              //           borderRadius: BorderRadius.circular(8),
                              //         ),
                              //       ));
                              // },
                            ),
                          ),
                          options: CarouselOptions(
                            autoPlay: false,
                            height: MediaQuery.of(context).size.height * 0.65,
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
                        Positioned(
                          bottom: 50,
                          child: Row(
                            children: [
                              for (var i = 0; i < 5; i++)
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
                                            : AppColors.white.withOpacity(0.2)),
                                  ),
                                )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            // Image.asset('assets/images/badge.png',
                            //     width: 19, height: 19),
                            SizedBox(width: 5),
                            // SvgPicture.asset('assets/images/icons/share_2.svg'),
                            SizedBox(width: 5),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xffFEB237),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      spreadRadius: 0,
                                      blurRadius: 2,
                                      offset: Offset(0, 1),
                                    ),
                                  ]),
                              child: Text(
                                'Premium',
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.white),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Christine Doe',
                                  style: const TextStyle(
                                    color: AppColors.darkText,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 24,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Ikeja, Nigeria (2 miles away)',
                                  style: const TextStyle(
                                    color: AppColors.grey,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
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
                                            BorderRadius.circular(100)),
                                    child: SvgPicture.asset(
                                      'assets/images/icons/dots.svg',
                                      width: 30,
                                    )),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          height: 40,
                          child: PrimaryButton(
                              invert: true,
                              title: 'Boost Profile',
                              action: () {}),
                        ),
                        SizedBox(height: 15),
                        Container(
                          height: 85,
                          padding: EdgeInsets.all(22),
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Column(
                                  children: [
                                    Text("12k",
                                        style: TextStyle(
                                            color: AppColors.grayscale,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                    Text("Friends",
                                        style: TextStyle(
                                            color: AppColors.grey,
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
                                            color: AppColors.grayscale,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                    Text("Referees",
                                        style: TextStyle(
                                            color: AppColors.grey,
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
                                            color: AppColors.grayscale,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                    Text("Posts",
                                        style: TextStyle(
                                            color: AppColors.grey,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              border: Border(),
                              borderRadius: BorderRadius.circular(8)),
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
                                      margin: EdgeInsets.only(left: 5),
                                      width: MediaQuery.of(context).size.width *
                                          0.43,
                                      decoration: BoxDecoration(
                                          color: activeTab == 1
                                              ? AppColors.primaryDark
                                              : Colors.transparent,
                                          border: Border(),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                    ),
                                    SizedBox(height: 5),
                                    Text("Bio",
                                        style: TextStyle(
                                            color: activeTab == 1
                                                ? AppColors.grayscale
                                                : AppColors.grey,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600))
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
                                      margin: EdgeInsets.only(right: 5),
                                      height: 3,
                                      width: MediaQuery.of(context).size.width *
                                          0.44,
                                      decoration: BoxDecoration(
                                          color: activeTab == 2
                                              ? AppColors.primaryDark
                                              : Colors.transparent,
                                          border: Border(),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                    ),
                                    SizedBox(height: 5),
                                    Text("Post",
                                        style: TextStyle(
                                            color: activeTab == 2
                                                ? AppColors.grayscale
                                                : AppColors.grey,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        activeTab == 1
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Text('Christine Doe',
                                        style: const TextStyle(
                                          color: AppColors.primaryDark,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 19,
                                        )),
                                    SizedBox(height: 5),
                                    Text(
                                      profileBio.length > 150 && showFullBio
                                          ? profileBio
                                          : profileBio.substring(0, 150) +
                                              "...",
                                      style: const TextStyle(
                                        color: AppColors.grayscale,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                      ),
                                    ),
                                    if (profileBio.length > 150)
                                      SizedBox(
                                        height: 10,
                                      ),
                                    if (profileBio.length > 150)
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: TransparentButtonNew(
                                          title: showFullBio
                                              ? 'Show Less'
                                              : 'Show More',
                                          action: () {
                                            setState(() {
                                              showFullBio = !showFullBio;
                                            });
                                          },
                                        ),
                                      ),
                                    SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "My Recent Referees",
                                          style: TextStyle(
                                            color: AppColors.grayscale,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        TransparentButtonNew(
                                          title: 'View All',
                                          action: () {},
                                          isBold: true,
                                          size: 16,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          for (var i = 0; i < 15; i++)
                                            GestureDetector(
                                              onTap: () {},
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(right: 10),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  child: Image.asset(
                                                    "assets/images/ref.png",
                                                    height: 42,
                                                    width: 42,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Text("Interest",
                                        style: TextStyle(
                                            color: AppColors.grayscale,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600)),
                                    SizedBox(height: 10),
                                    Wrap(
                                      runSpacing: 10,
                                      spacing: 10,
                                      children: [
                                        interest('Friend WB'),
                                        interest('Hangout'),
                                        interest('Dating'),
                                        interest('Body Massage'),
                                        interest('Friends'),
                                        interest('Serious Relationships'),
                                        interest('Massage Plus'),
                                        interest('Networking'),
                                      ],
                                    )
                                  ])
                            : activeTab == 2
                                ? PostsWidget()
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: []),
                        SizedBox(height: 200),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                top: 65,
                right: 20,
                child: Row(children: [
                  GestureDetector(
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                            padding: EdgeInsets.all(10),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: AppColors.white.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(100)),
                            child: SvgPicture.asset(
                              'assets/images/icons/menu.svg',
                              width: 30,
                            )),
                      )),
                  GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                            padding: EdgeInsets.all(10),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: AppColors.white.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(100)),
                            child: SvgPicture.asset(
                              'assets/images/icons/bell.svg',
                              width: 30,
                            )),
                      ))
                ]))
          ],
        ));
  }

  Container interest(title) {
    return Container(
      height: 28,
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(4)),
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

class BasicProfileProp extends StatelessWidget {
  final String leftTitle;
  final String leftValue;
  final String rightTitle;
  final String rightValue;
  const BasicProfileProp({
    super.key,
    required this.leftTitle,
    required this.leftValue,
    required this.rightTitle,
    required this.rightValue,
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
                    '$leftTitle: ',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '$leftValue',
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
                  '$rightTitle: ',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                Text(
                  '$rightValue',
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
  const ProfileAddOrLike({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
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
          SizedBox(width: 8),
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
                  'Super-Like',
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
  PostsWidget({super.key, this.isVideo = false});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PostsWidgetState();
}

class _PostsWidgetState extends ConsumerState<PostsWidget> {
  List<String> medias = [
    "https://sample-videos.com/video321/mp4/720/big_buck_bunny_720p_1mb.mp4",
    "https://sample-videos.com/img/Sample-jpg-image-50kb.jpg",
    "https://sample-videos.com/img/Sample-jpg-image-100kb.jpg",
    "https://sample-videos.com/video321/mp4/720/big_buck_bunny_720p_1mb.mp4",
    "https://sample-videos.com/video321/mp4/720/big_buck_bunny_720p_1mb.mp4",
    "https://sample-videos.com/img/Sample-jpg-image-100kb.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        width: double.infinity,
        child: Wrap(
            runSpacing: 10,
            alignment: WrapAlignment.spaceBetween,
            // runAlignment: WrapAlignment.spaceBetween,
            children: medias.map((e) => MediaContainer(mediaPath: e)).toList()
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
