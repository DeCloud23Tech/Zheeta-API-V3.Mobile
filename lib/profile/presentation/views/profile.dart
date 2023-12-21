import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/app/color.dart';
import 'package:zheeta/widgets/primary_button.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var _current = 0;
  var activeTab = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.secondaryLight,
        body: Stack(
          children: [
            SingleChildScrollView(
                child: Column(children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.65,
                width: double.infinity,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    CarouselSlider.builder(
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) => ClipRRect(
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
                        child: Row(children: [
                          for (var i = 0; i < 5; i++)
                            Padding(
                              padding: const EdgeInsets.all(3),
                              child: Container(
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: _current == i ? AppColors.white : AppColors.white.withOpacity(0.2)),
                              ),
                            )
                        ])),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Christine Doe',
                                style: const TextStyle(
                                  color: AppColors.darkText,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24,
                                )),
                            SizedBox(height: 5),
                            Text('Ikeja, Nigeria (2 miles away)',
                                style: const TextStyle(
                                  color: AppColors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                )),
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
                                  decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(100)),
                                  child: SvgPicture.asset(
                                    'assets/images/icons/dots.svg',
                                    width: 30,
                                  )),
                            ))
                      ],
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 40,
                      child: PrimaryButton(invert: true, title: 'Boost Profile', action: () {}),
                    ),
                    SizedBox(height: 15),
                    Container(
                      height: 85,
                      padding: EdgeInsets.all(22),
                      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Column(
                              children: [Text("12k", style: TextStyle(color: AppColors.grayscale, fontSize: 18, fontWeight: FontWeight.w500)), Text("Friends", style: TextStyle(color: AppColors.grey, fontSize: 12, fontWeight: FontWeight.w400))],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Column(
                              children: [Text("20", style: TextStyle(color: AppColors.grayscale, fontSize: 18, fontWeight: FontWeight.w500)), Text("Referees", style: TextStyle(color: AppColors.grey, fontSize: 12, fontWeight: FontWeight.w400))],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Column(
                              children: [Text("300", style: TextStyle(color: AppColors.grayscale, fontSize: 18, fontWeight: FontWeight.w500)), Text("Posts", style: TextStyle(color: AppColors.grey, fontSize: 12, fontWeight: FontWeight.w400))],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(color: AppColors.white, border: Border(), borderRadius: BorderRadius.circular(8)),
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
                                  width: MediaQuery.of(context).size.width * 0.295,
                                  decoration: BoxDecoration(color: activeTab == 1 ? AppColors.primaryDark : Colors.transparent, border: Border(), borderRadius: BorderRadius.circular(8)),
                                ),
                                SizedBox(height: 5),
                                Text("Bio", style: TextStyle(color: activeTab == 1 ? AppColors.grayscale : AppColors.grey, fontSize: 16, fontWeight: FontWeight.w600))
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
                                    width: MediaQuery.of(context).size.width * 0.295,
                                    decoration: BoxDecoration(color: activeTab == 2 ? AppColors.primaryDark : Colors.transparent, border: Border(), borderRadius: BorderRadius.circular(8)),
                                  ),
                                  SizedBox(height: 5),
                                  Text("Post", style: TextStyle(color: activeTab == 2 ? AppColors.grayscale : AppColors.grey, fontSize: 16, fontWeight: FontWeight.w600))
                                ],
                              )),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  activeTab = 3;
                                });
                              },
                              child: Column(
                                children: [
                                  Container(
                                    height: 3,
                                    width: MediaQuery.of(context).size.width * 0.295,
                                    decoration: BoxDecoration(color: activeTab == 3 ? AppColors.primaryDark : Colors.transparent, border: Border(), borderRadius: BorderRadius.circular(8)),
                                  ),
                                  SizedBox(height: 5),
                                  Text("Product", style: TextStyle(color: activeTab == 3 ? AppColors.grayscale : AppColors.grey, fontSize: 16, fontWeight: FontWeight.w600))
                                ],
                              ))
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    activeTab == 1
                        ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Text('Christine Doe',
                                style: const TextStyle(
                                  color: AppColors.primaryDark,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                )),
                            SizedBox(height: 5),
                            Text('My name is Christine Doe and I enjoy meeting new people and finding ways to help them have an uplifting experience. I enjoy reading, and the knowledge ...',
                                style: const TextStyle(
                                  color: AppColors.grayscale,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                )),
                            SizedBox(height: 20),
                            Text("M Recent Referees", style: TextStyle(color: AppColors.grayscale, fontSize: 16, fontWeight: FontWeight.w600)),
                            SizedBox(height: 10),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  for (var i = 0; i < 5; i++)
                                    GestureDetector(
                                      onTap: () {},
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 10),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(8),
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
                            Text("Interest", style: TextStyle(color: AppColors.grayscale, fontSize: 16, fontWeight: FontWeight.w600)),
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
                            ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [])
                            : Column(crossAxisAlignment: CrossAxisAlignment.start, children: []),
                    SizedBox(height: 200),
                  ],
                ),
              ),
            ])),
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
                            decoration: BoxDecoration(color: AppColors.white.withOpacity(0.3), borderRadius: BorderRadius.circular(100)),
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
                            decoration: BoxDecoration(color: AppColors.white.withOpacity(0.3), borderRadius: BorderRadius.circular(100)),
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
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(4)),
      child: Text(
        title,
        style: TextStyle(color: AppColors.grayscale, fontSize: 12, fontWeight: FontWeight.w400),
      ),
    );
  }
}
