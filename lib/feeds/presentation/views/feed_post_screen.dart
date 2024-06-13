import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../app/common/color.dart';
import '../../../app/common/enums/others.dart';
import '../../../app/router/app_router.dart';
import '../../../widgets/input_field.dart';
import '../../../widgets/primary_button.dart';
import '../../../widgets/top_nav.dart';

class FeedPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          leading: GestureDetector(
            onTap: () => router.pop(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  padding: EdgeInsets.all(5),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(100)),
                  child: Icon(Icons.arrow_back_ios_new, color: AppColors.grey)),
            ),
          ),
          title: Text(
            'Feed',
            style: TextStyle(
                color: AppColors.grayscale,
                fontSize: 32,
                fontWeight: FontWeight.w600),
          ),
          centerTitle: false,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: AppColors.white, borderRadius: BorderRadius.circular(8)),
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
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(100)),
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
                          Text("Christine Doe",
                              style: TextStyle(
                                  color: AppColors.grayscale,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400)),
                          Text("20 Min Ago.",
                              style: TextStyle(
                                  color: AppColors.grey,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset("assets/images/icons/post_marker.svg"),
                      SizedBox(width: 5),
                      Text("Lagos, NGA",
                          style: TextStyle(
                              color: AppColors.grey,
                              fontSize: 10,
                              fontWeight: FontWeight.w400))
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
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(100)),
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
                            children: [
                              Text("Christine Doe and 200 others",
                                  style: TextStyle(
                                      color: AppColors.grayscale,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400))
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
                                  color: AppColors.grayscale,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400)),
                          SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(
                                "assets/images/icons/unlike.svg"),
                          ),
                          SizedBox(width: 5),
                          Text("2335",
                              style: TextStyle(
                                  color: AppColors.grayscale,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400)),
                          SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (BuildContext context) {
                                  return DraggableScrollableSheet(
                                      expand: false,
                                      snap: true,
                                      snapSizes: [0.4, 0.85],
                                      initialChildSize: 0.85,
                                      maxChildSize: 0.85,
                                      minChildSize: 0.4,
                                      builder: (context, scrollController) {
                                        return Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.9,
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
                                                      'Comments',
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
                                              Divider(),
                                              // SizedBox(
                                              //   height: MediaQuery.of(context)
                                              //           .size
                                              //           .height *
                                              //       0.7,
                                              //   child: CommentSection(),
                                              // ),
                                            ],
                                          ),
                                        );
                                      });
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
                                    color: AppColors.grayscale,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
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
                                            onTap: () =>
                                                Navigator.of(context).pop(),
                                            child: Container(
                                              padding: EdgeInsets.all(5),
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.white,
                                                borderRadius:
                                                    BorderRadius.circular(100),
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
                                            'Gift coins',
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Amount',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.grayscale,
                                            ),
                                          ),
                                          InputField(
                                            hintText: 'Amount',
                                            onChanged: (value) {},
                                          ),
                                          SizedBox(height: 20),
                                          PrimaryButton(
                                            title: 'Gift coins',
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
                                  color: AppColors.grayscale,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
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
        ));
  }
}
