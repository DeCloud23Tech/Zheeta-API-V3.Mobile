import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/events/data/model/buddy_events_feed.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/bulllet_point.dart';
import 'package:zheeta/widgets/primary_button.dart';
import 'package:zheeta/widgets/reusable_bottom_sheet.dart';

@RoutePage()
class EventDetailsScreen extends StatefulWidget {
  final BuddyEvent event;

  const EventDetailsScreen({required this.event});

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  int _currentIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.primaryDark,
        surfaceTintColor: AppColors.primaryDark,
        scrolledUnderElevation: 0.5,
        shadowColor: Colors.grey,
        leadingWidth: MediaQuery.of(context).size.width * 0.2,
        leading: Row(
          children: [
            AppBackButton(),
          ],
        ),
        title: Text(
          'Event Details',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Event Main Photo
            Container(
              height: MediaQuery.of(context).size.height * .35,
              child: Stack(
                children: [
                  // PageView for images
                  Container(
                    height: MediaQuery.of(context).size.height * .30,
                    child: PageView.builder(
                      itemCount: 1,
                      onPageChanged: _onPageChanged,
                      itemBuilder: (context, index) {
                        return Image.network(
                          // widget.event.eventMainPhotoUrl[index],
                          widget.event.eventMainPhotoUrl,
                          fit: BoxFit.cover,
                          height: MediaQuery.of(context).size.height * .35,
                          width: double.infinity,
                        );
                      },
                    ),
                  ),

                  // Dot indicators
                  Positioned(
                    bottom: 75,
                    // left: MediaQuery.of(context).size.width / 2 -
                    //     (images.length * 12) / 2, // Center the dots
                    child: Row(
                      children: List.generate(2, (index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          height: _currentIndex == index ? 8 : 6,
                          width: 8,
                          decoration: BoxDecoration(
                            color: _currentIndex == index
                                ? AppColors.primaryDark
                                : AppColors.grey,
                            shape: BoxShape.circle,
                          ),
                        );
                      }),
                    ),
                  ),

                  // Bottom container with elevation and rounded corners
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 25),
                      height: 52,
                      decoration: BoxDecoration(
                        color: AppColors.primaryLightBackground,
                        borderRadius: BorderRadius.circular(8),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.black.withOpacity(0.2),
                        //     offset: Offset(0, 4),
                        //     blurRadius: 6,
                        //   ),
                        // ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: StackedAvatars(
                              avatarUrls: [
                                'https://via.placeholder.com/100',
                                'https://via.placeholder.com/100',
                                'https://via.placeholder.com/100',
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              '3/12  needed',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: SizedBox(
                                width: 117,
                                height: 36,
                                child: PrimaryButton(
                                  invert: true,
                                  title: 'Invite',
                                  action: () {},
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding:
                  const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Event Title
                  Text(
                    widget.event.title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  // Event Participation Cost
                  Row(
                    children: [
                      Text(
                        'Event price: ',
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SvgPicture.asset(
                        "assets/images/icons/zheeta-coin-bold.svg",
                        height: 12,
                        colorFilter: const ColorFilter.mode(
                          AppColors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                      // const SizedBox(width: 5),
                      Text(
                        (widget.event.eventParticipationCost ?? 20).toString(),
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  // Event Details Container
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryLightBackground,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(12.0),
                    margin: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Location
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: AppColors.hintText,
                              size: 18,
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                widget.event.eventLocationAddress,
                                style: TextStyle(
                                  color: AppColors.hintText,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        // Buddies Joined / Needed
                        Row(
                          children: [
                            Icon(
                              Icons.groups_outlined,
                              color: AppColors.hintText,
                              size: 18,
                            ),
                            SizedBox(width: 8),
                            Text(
                              '${widget.event.noOfBuddiesJoined}/${widget.event.noOfBuddiesWanted} needed',
                              style: TextStyle(
                                color: AppColors.hintText,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 1,
                          color: AppColors.hintText.withOpacity(0.5),
                        ),
                        // Creator Info
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 15,
                              backgroundImage: NetworkImage(
                                'https://via.placeholder.com/100', // Replace with creator's image
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'John Doe',
                                    // Replace with actual creator name
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    'Event creator',
                                    // Replace with actual creator name
                                    style: TextStyle(
                                      color: AppColors.hintText,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_right,
                              color: AppColors.hintText,
                              size: 18,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  // About Event
                  Text(
                    'About event',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    widget.event.description,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: 20),

                  Text(
                    'Things to Bring',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  BulletPoint(
                    text: 'This is a simple bullet point.',
                    textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Event Guidelines',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  BulletPoint(
                    text: 'This is a simple bullet point.',
                    textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                    ),
                  ),

                  SizedBox(height: 20),

                  Text(
                    'Event tags',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                  Chip(
                    color: WidgetStateProperty.all<Color>(
                        AppColors.primaryLightBackground),
                    side: BorderSide(color: AppColors.primaryLightBackground),
                    padding: EdgeInsets.zero,
                    label: Text(
                      'tagbbb',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  // Wrap(
                  //   spacing: 5.0,
                  //   runSpacing: 0.0,
                  //   children: selectedTags
                  //       .map(
                  //         (tag) => Chip(
                  //       color:  WidgetStateProperty.all<Color>(AppColors.secondarySwirl),
                  //       label: Text(tag),
                  //       deleteIcon: const Icon(Icons.close),
                  //       onDeleted: () => _removeTag(tag),
                  //     ),
                  //   )
                  //       .toList(),
                  // ),
                  SizedBox(height: 20),
                  // Action Button
                  Row(
                    children: [
                      Expanded(
                        child: PrimaryButton(
                          invert: true,
                          title: 'Request to join (',
                          action: () {
                            // Action for joining the event
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: GestureDetector(
                            onTap: () {
                              showCustomModalBottomSheet(
                                context: context,
                                titles: [
                                  'Manage profile',
                                  'Manage interests',
                                  'Boost insights',
                                  'Manage access'
                                ],
                                icons: [
                                  'assets/images/icons/user-profile.svg',
                                  'assets/images/icons/interests-outline-rounded.svg',
                                  'assets/images/icons/boost-insight.svg',
                                  'assets/images/icons/user-access.svg'
                                ],
                                actions: [
                                  // () => context.router
                                  //     .push(ProfileEditRoute(activeTab: 1)),
                                  // () => context.router
                                  //     .push(ProfileEditRoute(activeTab: 2)),
                                  // () => context.router
                                  //     .push(ProfileBoostInsightRoute()),
                                  // () => context.router
                                  //     .push(ProfileAccessManagementRoute()),
                                ],
                              );
                            },
                            child: Icon(
                              Icons.more_horiz,
                              color: AppColors.black,
                            )),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class StackedAvatars extends StatelessWidget {
  final List<String> avatarUrls;

  const StackedAvatars({required this.avatarUrls, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70, // Adjust width to fit avatars
      child: Stack(
        children: List.generate(avatarUrls.length, (index) {
          return Positioned(
            top: 0,
            bottom: 0,
            left: index * 16.0, // Adjust spacing between avatars
            child: CircleAvatar(
              radius: 15, // Adjust size of each avatar
              backgroundImage: NetworkImage(avatarUrls[index]),
              backgroundColor: Colors.grey, // Placeholder color
            ),
          );
        }),
      ),
    );
  }
}
