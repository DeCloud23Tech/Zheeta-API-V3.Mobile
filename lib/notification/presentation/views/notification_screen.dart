import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/notification/presentation/views/widgets/notification_filter_bottomsheet.dart';
import 'package:zheeta/widgets/back_button.dart';

@RoutePage()
class NotificationScreen extends ConsumerStatefulWidget {
  const NotificationScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends ConsumerState<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.secondaryLight,
        surfaceTintColor: AppColors.secondaryLight,
        scrolledUnderElevation: 0.5,
        shadowColor: Colors.grey,
        leadingWidth: MediaQuery.of(context).size.width * 0.2,
        leading: Row(
          children: [
            AppBackButton(),
          ],
        ),
        title: Text(
          'Notifications',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        actions: [
          SvgPicture.asset('assets/images/icons/notification_tick.svg'),
          SizedBox(width: 24),
          GestureDetector(
            onTap: () {
              notificationFilterBottomSheet(context);
            },
            child: SvgPicture.asset('assets/images/icons/filter_mark.svg'),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              NotificationCard(),
              NotificationCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/notification_avatar.png', width: 40, height: 40),
                SizedBox(width: 14),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.55,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: '@Khareem23 ',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                          children: [
                            TextSpan(
                              text: 'sent you a friend request',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '4 Jan at 03:18',
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: Color(0xff8FF187),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    'Friend request',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColors.red,
                  ),
                )
              ],
            ),
          ],
        ),
        SizedBox(height: 8),
        Divider(
          color: Color(0xffD9DBE9),
          thickness: 1,
          height: 1,
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
