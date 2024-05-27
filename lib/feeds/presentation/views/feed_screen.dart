import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/app/router/app_router.gr.dart';

import '../../../widgets/input_field.dart';
import '../../../widgets/primary_button.dart';
import 'feed_post_screen.dart';

class Feeds extends StatefulWidget {
  const Feeds({super.key});

  @override
  State<Feeds> createState() => _FeedsState();
}

class _FeedsState extends State<Feeds> {
  var search;
  static final TextEditingController _searchController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8)),
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
                        hintText: 'Search',
                        hintStyle: TextStyle(color: AppColors.hintText)),
                    // focusNode: _focusNode,
                    validator: (searchValue) {
                      if (searchValue!.isEmpty) {
                        return 'Please enter search keyword';
                      }
                      return null;
                    },
                  )),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sponsored  Profiles",
                        style: TextStyle(
                            color: AppColors.grayscale,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 5),
                      Divider(thickness: 2),
                      SizedBox(height: 10)
                    ],
                  ),
                ),
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
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
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
                                      gradient: LinearGradient(
                                          begin: Alignment.center,
                                          end: Alignment.bottomCenter,
                                          colors: [
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
                                          decoration: BoxDecoration(
                                              color: AppColors.white,
                                              borderRadius:
                                                  BorderRadius.circular(100)),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            child: Image.asset(
                                              "assets/images/User.png",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Text("John Doe",
                                            style: TextStyle(
                                                color: AppColors.white,
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400)),
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
                ColoredBox(
                  color: AppColors.secondaryLight,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        for (var i = 0; i < 6; i++)
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FeedPost()),
                                );
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 35,
                                              width: 35,
                                              padding: EdgeInsets.all(1),
                                              decoration: BoxDecoration(
                                                  color: AppColors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100)),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                child: Image.asset(
                                                  "assets/images/User.png",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("Christine Doe",
                                                    style: TextStyle(
                                                        color:
                                                            AppColors.grayscale,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                                Text("20 Min Ago.",
                                                    style: TextStyle(
                                                        color: AppColors.grey,
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                                "assets/images/icons/post_marker.svg"),
                                            SizedBox(width: 5),
                                            Text("Lagos, NGA",
                                                style: TextStyle(
                                                    color: AppColors.grey,
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w400))
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Text("Weekend have fun everyone!!!",
                                        style: TextStyle(
                                            color: AppColors.grayscale,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400)),
                                    SizedBox(height: 10),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          "assets/images/post.png",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  height: 16,
                                                  width: 16,
                                                  padding: EdgeInsets.all(1),
                                                  decoration: BoxDecoration(
                                                      color: AppColors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100)),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100),
                                                    child: Image.asset(
                                                      "assets/images/User.png",
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 5),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                        "Christine Doe and 200 others",
                                                        style: TextStyle(
                                                            color: AppColors
                                                                .grayscale,
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400))
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 15),
                                            Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {},
                                                  child: SvgPicture.asset(
                                                      "assets/images/icons/like.svg"),
                                                ),
                                                SizedBox(width: 5),
                                                Text("2335",
                                                    style: TextStyle(
                                                        color:
                                                            AppColors.grayscale,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                                SizedBox(width: 10),
                                                GestureDetector(
                                                  onTap: () {},
                                                  child: SvgPicture.asset(
                                                      "assets/images/icons/unlike.svg"),
                                                ),
                                                SizedBox(width: 5),
                                                Text("2335",
                                                    style: TextStyle(
                                                        color:
                                                            AppColors.grayscale,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                                SizedBox(width: 10),
                                                GestureDetector(
                                                  onTap: () {
                                                    showModalBottomSheet(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return Container(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.9,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: AppColors
                                                                .secondaryLight,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      20.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      20.0),
                                                            ),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        24.0),
                                                                child: Row(
                                                                  children: [
                                                                    GestureDetector(
                                                                      onTap: () =>
                                                                          Navigator.of(context)
                                                                              .pop(),
                                                                      child:
                                                                          Container(
                                                                        padding:
                                                                            EdgeInsets.all(5),
                                                                        height:
                                                                            30,
                                                                        width:
                                                                            30,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              AppColors.white,
                                                                          borderRadius:
                                                                              BorderRadius.circular(100),
                                                                        ),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .close,
                                                                          color:
                                                                              AppColors.grey,
                                                                          size:
                                                                              18,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Spacer(),
                                                                    Text(
                                                                      'Comments',
                                                                      style:
                                                                          TextStyle(
                                                                        color: AppColors
                                                                            .grayscale,
                                                                        fontSize:
                                                                            24,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                    ),
                                                                    Spacer(),
                                                                  ],
                                                                ),
                                                              ),
                                                              Divider(),
                                                              // SizedBox(
                                                              //   height: MediaQuery.of(
                                                              //       context)
                                                              //       .size
                                                              //       .height *
                                                              //       0.4,
                                                              //   child:
                                                              //   CommentSection(),
                                                              // ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                          "assets/images/icons/comment.svg"),
                                                      SizedBox(width: 5),
                                                      Text(
                                                        "512",
                                                        style: TextStyle(
                                                          color: AppColors
                                                              .grayscale,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {},
                                                  child: SvgPicture.asset(
                                                      "assets/images/icons/link.svg"),
                                                ),
                                                SizedBox(width: 10),
                                                GestureDetector(
                                                  onTap: () {},
                                                  child: SvgPicture.asset(
                                                      "assets/images/icons/share.svg"),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 10),
                                            GestureDetector(
                                              onTap: () {
                                                showModalBottomSheet(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return Container(
                                                      decoration: BoxDecoration(
                                                        color: AppColors
                                                            .secondaryLight,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  20.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  20.0),
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(24.0),
                                                            child: Row(
                                                              children: [
                                                                GestureDetector(
                                                                  onTap: () =>
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop(),
                                                                  child:
                                                                      Container(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .all(5),
                                                                    height: 30,
                                                                    width: 30,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: AppColors
                                                                          .white,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              100),
                                                                    ),
                                                                    child: Icon(
                                                                      Icons
                                                                          .close,
                                                                      color: AppColors
                                                                          .grey,
                                                                      size: 18,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Spacer(),
                                                                Text(
                                                                  'Gift coins',
                                                                  style:
                                                                      TextStyle(
                                                                    color: AppColors
                                                                        .grayscale,
                                                                    fontSize:
                                                                        24,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                                ),
                                                                Spacer(),
                                                              ],
                                                            ),
                                                          ),
                                                          Divider(),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(24.0),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'Amount',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: AppColors
                                                                        .grayscale,
                                                                  ),
                                                                ),
                                                                InputField(
                                                                  hintText:
                                                                      'Amount',
                                                                  onChanged:
                                                                      (value) {},
                                                                ),
                                                                SizedBox(
                                                                    height: 20),
                                                                PrimaryButton(
                                                                  title:
                                                                      'Gift coins',
                                                                  action: () {},
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      "assets/images/icons/coin-euro.svg"),
                                                  SizedBox(width: 3),
                                                  Text(
                                                    "1233",
                                                    style: TextStyle(
                                                        color:
                                                            AppColors.grayscale,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  SizedBox(width: 3),
                                                  SvgPicture.asset(
                                                    "assets/images/icons/zheeta-coin.svg",
                                                    height: 11,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 100)
              ],
            ),
            SizedBox(height: 100)
          ],
        ),
      ),
    );
  }
}
