import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/widgets/input_field.dart';
import 'package:zheeta/widgets/primary_button.dart';
import 'package:zheeta/widgets/reusable_bottom_sheet.dart';

class PostCard extends StatelessWidget {
  final String userName;
  final String timeAgo;
  final String location;
  final String postText;
  final List<String> postImages;
  final int likesCount;
  final int commentsCount;
  final double coinsCount;
  final String userImage;
  final String redirectUrl;

  const PostCard({
    Key? key,
    required this.userName,
    required this.timeAgo,
    required this.location,
    required this.postText,
    required this.postImages,
    required this.likesCount,
    required this.commentsCount,
    required this.coinsCount,
    required this.userImage,
    required this.redirectUrl,
  }) : super(key: key);

  Widget _buildIconWithText(String asset, String text, bool isActive) {
    return Row(
      children: [
        SvgPicture.asset(
          asset,
          colorFilter: isActive
              ? ColorFilter.mode(AppColors.white, BlendMode.srcIn)
              : null,
          height: 16,
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 38,
          width: 38,
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              userImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: screenWidth,
            padding: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: AppColors.primaryDark,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // User Info Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userName,
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          timeAgo,
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          child: const Icon(
                            Icons.more_horiz,
                            color: AppColors.white,
                            size: 14,
                          ),
                          onTap: () {
                            showCustomModalBottomSheet(
                              context: context,
                              titles: [
                                'Copy link',
                                'Share',
                                // 'Mute',
                              ],
                              icons: [
                                'assets/images/icons/link-white.svg',
                                'assets/images/icons/share-white.svg',
                                // 'assets/images/icons/notification-bell-muted.svg',
                              ],
                              actions: [
                                () async {
                                  await Clipboard.setData(
                                      ClipboardData(text: redirectUrl));
                                  print(
                                      "Link copied: $redirectUrl"); // Optional: Print confirmation
                                },
                                () {
                                  Share.share(redirectUrl); // Share the link
                                  print(
                                      "Link shared: $redirectUrl"); // Optional: Print confirmation
                                },
                                // () => print('Muted'),
                              ],
                            );
                          },
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: AppColors.white,
                              size: 12,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              location,
                              style: const TextStyle(
                                color: AppColors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  postText,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 10),
                // Post Image
                Container(
                  width: screenWidth,
                  height: screenWidth / 1.5,
                  decoration: BoxDecoration(
                    // color: AppColors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      postImages[0],
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                // Likes, Comments, Share Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 16,
                              width: 16,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset(
                                  userImage,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "$userName and $likesCount others",
                              style: const TextStyle(
                                color: AppColors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            _buildIconWithText("assets/images/icons/like.svg",
                                likesCount.toString(), false),
                            const SizedBox(width: 10),
                            _buildIconWithText("assets/images/icons/unlike.svg",
                                likesCount.toString(), true),
                            const SizedBox(width: 10),
                            _buildIconWithText(
                                "assets/images/icons/comment.svg",
                                commentsCount.toString(),
                                false),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Text(
                              coinsCount.toString(),
                              style: const TextStyle(
                                color: AppColors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(width: 3),
                            SvgPicture.asset(
                              "assets/images/icons/zheeta-coin.svg",
                              height: 10,
                              colorFilter: const ColorFilter.mode(
                                  AppColors.white, BlendMode.srcIn),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
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
                                      SizedBox(height: 10),
                                      Center(
                                        child: Container(
                                          width: 50,
                                          height: 4,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(2),
                                            color: Color(0xffDADADA),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(20.0),
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
                                                      BorderRadius.circular(
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
                          child: SvgPicture.asset(
                            "assets/images/icons/gift-coin-feed-button.svg",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
