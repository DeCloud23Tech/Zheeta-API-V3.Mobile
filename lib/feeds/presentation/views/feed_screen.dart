import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/app/color.dart';
import 'package:zheeta/app/router/app_router.gr.dart';

class Feeds extends StatefulWidget {
  const Feeds({super.key});

  @override
  State<Feeds> createState() => _FeedsState();
}

class _FeedsState extends State<Feeds> {
  var search;
  static final TextEditingController _searchController = TextEditingController();
  var activeTab = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                      height: 50,
                      child: TextFormField(
                        onFieldSubmitted: (value) {},
                        onChanged: (value) {},
                        style: TextStyle(color: Colors.black),
                        controller: _searchController,
                        keyboardType: TextInputType.text,
                        cursorColor: AppColors.primaryDark,
                        decoration: InputDecoration(
                            suffixIcon: Padding(
                                padding: EdgeInsets.all(10),
                                child: SvgPicture.asset(
                                  'assets/images/icons/search.svg',
                                  width: 10,
                                  height: 10,
                                )),
                            border: OutlineInputBorder(),
                            hintText: 'Search People & Posts',
                            hintStyle: TextStyle(color: AppColors.hintText)),
                        // focusNode: _focusNode,
                        validator: (searchValue) {
                          if (searchValue!.isEmpty) {
                            return 'Please enter search keyword';
                          }
                          return null;
                        },
                      )),
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
                                width: MediaQuery.of(context).size.width * 0.46,
                                decoration: BoxDecoration(color: activeTab == 1 ? AppColors.primaryDark : Colors.transparent, border: Border(), borderRadius: BorderRadius.circular(8)),
                              ),
                              SizedBox(height: 5),
                              Text("Activites", style: TextStyle(color: activeTab == 1 ? AppColors.grayscale : AppColors.grey, fontSize: 16, fontWeight: FontWeight.w600))
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
                                  width: MediaQuery.of(context).size.width * 0.46,
                                  decoration: BoxDecoration(color: activeTab == 2 ? AppColors.primaryDark : Colors.transparent, border: Border(), borderRadius: BorderRadius.circular(8)),
                                ),
                                SizedBox(height: 5),
                                Text("MarketPlace", style: TextStyle(color: activeTab == 2 ? AppColors.grayscale : AppColors.grey, fontSize: 16, fontWeight: FontWeight.w600))
                              ],
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            activeTab == 1
                ? Column(
                    children: [
                      Padding(padding: const EdgeInsets.only(left: 15, right: 15), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("Boosts", style: TextStyle(color: AppColors.grayscale, fontSize: 20, fontWeight: FontWeight.w600)), SizedBox(height: 5), Divider(thickness: 2), SizedBox(height: 10)])),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SizedBox(width: 7),
                            for (var i = 0; i < 6; i++)
                              GestureDetector(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8, right: 8),
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: 158,
                                        width: 120,
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image.asset(
                                            "assets/images/status.png",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 158,
                                        width: 120,
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(begin: Alignment.center, end: Alignment.bottomCenter, colors: [
                                              Colors.transparent,
                                              AppColors.black.withOpacity(0.9),
                                            ]),
                                            borderRadius: BorderRadius.circular(10)),
                                      ),
                                      Positioned(
                                          bottom: 6,
                                          left: 6,
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 16,
                                                width: 16,
                                                padding: EdgeInsets.all(1),
                                                decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(100)),
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(100),
                                                  child: Image.asset(
                                                    "assets/images/User.png",
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 5),
                                              Text("John Doe", style: TextStyle(color: AppColors.white, fontSize: 10, fontWeight: FontWeight.w400)),
                                            ],
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            SizedBox(width: 7)
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            for (var i = 0; i < 6; i++)
                              Padding(
                                padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(8)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                height: 35,
                                                width: 35,
                                                padding: EdgeInsets.all(1),
                                                decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(100)),
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(100),
                                                  child: Image.asset(
                                                    "assets/images/User.png",
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 10),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("Christine Doe", style: TextStyle(color: AppColors.grayscale, fontSize: 12, fontWeight: FontWeight.w400)),
                                                  Text("20 Min Ago.", style: TextStyle(color: AppColors.grey, fontSize: 10, fontWeight: FontWeight.w400)),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [SvgPicture.asset("assets/images/icons/post_marker.svg"), SizedBox(width: 5), Text("Lagos, NGA", style: TextStyle(color: AppColors.grey, fontSize: 10, fontWeight: FontWeight.w400))],
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Text("Weekend have fun everyone!!!", style: TextStyle(color: AppColors.grayscale, fontSize: 12, fontWeight: FontWeight.w400)),
                                      SizedBox(height: 10),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          width: MediaQuery.of(context).size.width,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: Image.asset(
                                              "assets/images/post.png",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 15),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    height: 16,
                                                    width: 16,
                                                    padding: EdgeInsets.all(1),
                                                    decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(100)),
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(100),
                                                      child: Image.asset(
                                                        "assets/images/User.png",
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 5),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [Text("Christine Doe and 200 others", style: TextStyle(color: AppColors.grayscale, fontSize: 10, fontWeight: FontWeight.w400))],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 15),
                                              Row(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {},
                                                    child: SvgPicture.asset("assets/images/icons/like.svg"),
                                                  ),
                                                  SizedBox(width: 5),
                                                  Text("2335", style: TextStyle(color: AppColors.grayscale, fontSize: 12, fontWeight: FontWeight.w400)),
                                                  SizedBox(width: 10),
                                                  GestureDetector(
                                                    onTap: () {},
                                                    child: SvgPicture.asset("assets/images/icons/unlike.svg"),
                                                  ),
                                                  SizedBox(width: 5),
                                                  Text("2335", style: TextStyle(color: AppColors.grayscale, fontSize: 12, fontWeight: FontWeight.w400)),
                                                  SizedBox(width: 10),
                                                  GestureDetector(
                                                    onTap: () {},
                                                    child: SvgPicture.asset("assets/images/icons/comment.svg"),
                                                  ),
                                                  SizedBox(width: 5),
                                                  Text("512", style: TextStyle(color: AppColors.grayscale, fontSize: 12, fontWeight: FontWeight.w400))
                                                ],
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {},
                                                child: SvgPicture.asset("assets/images/icons/link.svg"),
                                              ),
                                              SizedBox(width: 10),
                                              GestureDetector(
                                                onTap: () {},
                                                child: SvgPicture.asset("assets/images/icons/share.svg"),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 10)
                                    ],
                                  ),
                                ),
                              )
                          ],
                        ),
                      ),
                      SizedBox(height: 100)
                    ],
                  )
                : Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SizedBox(width: 7),
                            for (var i = 0; i < 6; i++)
                              GestureDetector(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8, right: 8),
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: 48,
                                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                        decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(8)),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              "assets/images/men.png",
                                              width: 32,
                                              height: 32,
                                            ),
                                            Container(height: 20, width: 1, color: AppColors.grey),
                                            SizedBox(width: 5),
                                            Text("Men Clothing", style: TextStyle(color: AppColors.grayscale, fontSize: 14, fontWeight: FontWeight.w400))
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            SizedBox(width: 7)
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      SingleChildScrollView(
                        child: Wrap(
                          runSpacing: 15,
                          spacing: 15,
                          children: [
                            for (var i = 0; i < 6; i++)
                              GestureDetector(
                                onTap: () {
                                  context.router.push(ProductDetailsRoute(product: 'Plain black t-shirt'));
                                },
                                child: Container(
                                  height: MediaQuery.of(context).size.width * 0.56,
                                  width: MediaQuery.of(context).size.width * 0.44,
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                                  decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(8)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        "assets/images/product.png",
                                        height: MediaQuery.of(context).size.width * 0.38,
                                        width: MediaQuery.of(context).size.width * 0.38,
                                      ),
                                      SizedBox(height: 8),
                                      Text("\$126", style: TextStyle(color: AppColors.primaryDark, fontSize: 14, fontWeight: FontWeight.w600)),
                                      SizedBox(height: 5),
                                      Text("Plain black t-shirt", style: TextStyle(color: AppColors.grayscale, fontSize: 14, fontWeight: FontWeight.w600))
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
            SizedBox(height: 100)
          ],
        ),
      ),
    );
  }
}
