import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zheeta/common/constants/color.dart';
import 'package:zheeta/common/notify/notify_user.dart';
import 'package:zheeta/core/injection/di.dart';
import 'package:zheeta/core/router/app_router.gr.dart';
import 'package:zheeta/features/buddy_events/presentation/bloc/event_cubit/event_cubit.dart';
import 'package:zheeta/features/buddy_events/presentation/widgets/bullet_points.dart';
import 'package:zheeta/utils/format_utils.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/error_page.dart';
import 'package:zheeta/widgets/loader.dart';
import 'package:zheeta/widgets/primary_button.dart';
import 'package:zheeta/widgets/reusable_bottom_sheet.dart';
import 'package:zheeta/widgets/stacked_avatars.dart';

@RoutePage()
class EventDetailsScreen extends StatefulWidget {
  final String? id;
  final String? creatorId;

  const EventDetailsScreen(
      {super.key, required this.id, required this.creatorId});

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  final EventCubit eventsCubit = locator<EventCubit>();
  int _currentIndex = 0;

  @override
  void initState() {
    eventsCubit.fetchEventDetailsCubit(widget.id!, widget.creatorId!);
    super.initState();
  }

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
        leadingWidth: MediaQuery.of(context).size.width * 0.2,
        leading: const Row(children: [AppBackButton()]),
        title: const Text(
          'Event Details',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.white),
        ),
      ),
      body: BlocBuilder<EventCubit, EventState>(
        builder: (context, state) {
          if (state.status == EventsStatus.loading) {
            return Center(child: loadingIndicator());
          } else if (state.status == EventsStatus.error) {
            return ErrorPage(
              onTryAgain: () => eventsCubit.fetchEventDetailsCubit(
                  widget.id!, widget.creatorId!),
            );
          } else if (state.status == EventsStatus.success) {
            return _buildEventDetails(state);
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  Widget _buildEventDetails(EventState state) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildEventImages(state),
          _buildEventInfo(state),
          _buildEventActions(state),
        ],
      ),
    );
  }

  Widget _buildEventImages(EventState state) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .35,
      child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .30,
            child: PageView.builder(
              itemCount: state.buddyEventDetail!.eventOtherPhotosUrl.length,
              onPageChanged: _onPageChanged,
              itemBuilder: (context, index) {
                return Image.network(
                  state.buddyEventDetail!.eventOtherPhotosUrl[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                );
              },
            ),
          ),
          _buildDotIndicators(state),
          _buildBottomContainer(state),
        ],
      ),
    );
  }

  Widget _buildDotIndicators(EventState state) {
    return Positioned(
      bottom: 75,
      left: MediaQuery.of(context).size.width / 2 -
          (state.buddyEventDetail?.eventOtherPhotosUrl.length ?? 1 * 12) / 2,
      child: Row(
        children: List.generate(
            state.buddyEventDetail?.eventOtherPhotosUrl.length ?? 1, (index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
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
    );
  }

  Widget _buildBottomContainer(EventState state) {
    return Positioned(
      bottom: 10,
      left: 0,
      right: 0,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25),
        height: 52,
        decoration: BoxDecoration(
          color: AppColors.primaryLightBackground,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(0, 4),
                blurRadius: 6)
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: StackedAvatars(avatarUrls: [
                      state.buddyEventDetail!.creatorProfilePhotoUrl,
                      state.buddyEventDetail!.creatorProfilePhotoUrl,
                      state.buddyEventDetail!.creatorProfilePhotoUrl,
                    ])),
                Text(
                  '${state.buddyEventDetail?.noOfBuddiesJoined}/${state.buddyEventDetail?.noOfBuddiesWanted} needed',
                  style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: SizedBox(
                  width: 117,
                  height: 36,
                  child: PrimaryButton(
                    invert: true,
                    title: 'Invite',
                    action: () => _showInviteBottomSheet(context, state),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showInviteBottomSheet(BuildContext context, EventState state) {
    showCustomModalBottomSheet(
      context: context,
      titles: ['Share invite link', 'Share to your friends'],
      icons: [
        'assets/images/icons/share-white.svg',
        'assets/images/icons/link-white.svg'
      ],
      actions: [
        () async {
          await Clipboard.setData(
              ClipboardData(text: state.buddyEventDetail!.shareLink));
          NotifyUser.showSnackBar('Invite link copied to clipboard!');
        },
        () => context.router.push(const ShareRoute()),
      ],
    );
  }

  Widget _buildEventInfo(EventState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            state.buddyEventDetail!.title,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.white),
          ),
          const SizedBox(height: 8),
          _buildEventCost(state),
          const SizedBox(height: 16),
          _buildEventDetailsContainer(state),
          const SizedBox(height: 16),
          _buildEventDescription(state),
          if (state.buddyEventDetail!.eventItems?[0] != null)
          _buildEventItems(state),
          if (state.buddyEventDetail!.eventGuidelines?[0] != null)
            _buildEventGuidelines(state),
          _buildEventTags(state),
        ],
      ),
    );
  }

  Widget _buildEventCost(EventState state) {
    return Row(
      children: [
        const Text(
          'Participation cost: ',
          style: TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        if (state.buddyEventDetail?.eventFee != null)
          SvgPicture.asset(
            "assets/images/icons/zheeta-coin-bold.svg",
            height: 12,
            colorFilter:
                const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
          ),
        Text(
          state.buddyEventDetail?.eventFee != null
              ? state.buddyEventDetail!.eventFee.toString()
              : "Free",
          style: const TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildEventDetailsContainer(EventState state) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryLightBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(12.0),
      margin: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLocation(state),
          const SizedBox(height: 10),
          _buildEventDate(state),
          const Divider(thickness: 1, color: AppColors.white),
          _buildCreatorInfo(state),
        ],
      ),
    );
  }

  Widget _buildLocation(EventState state) {
    return Row(
      children: [
        const Icon(Icons.location_on_outlined,
            color: AppColors.white, size: 18),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            state.buddyEventDetail!.eventLocationAddress,
            style: const TextStyle(
                color: AppColors.white,
                fontSize: 12,
                fontWeight: FontWeight.w400),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildEventDate(EventState state) {
    return Row(
      children: [
        const Icon(Icons.calendar_month_outlined,
            color: AppColors.white, size: 18),
        const SizedBox(width: 8),
        Text(
          formatEventDate(state.buddyEventDetail!.startDate),
          style: const TextStyle(
              color: AppColors.white,
              fontSize: 12,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  Widget _buildCreatorInfo(EventState state) {
    return Row(
      children: [
        CircleAvatar(
          radius: 15,
          backgroundImage:
              NetworkImage(state.buddyEventDetail!.creatorProfilePhotoUrl),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: InkWell(
            // onTap: () => context.router.push(
            //     ProfileViewRoute(profileId: state.buddyEventDetail!.creatorId)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.buddyEventDetail!.creatorUsername.toLowerCase(),
                  style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                  overflow: TextOverflow.ellipsis,
                ),
                const Text(
                  'Event creator',
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
        // const Icon(Icons.keyboard_arrow_right,
        //     color: AppColors.white, size: 18),
      ],
    );
  }

  Widget _buildEventDescription(EventState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'About event',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.white),
        ),
        const SizedBox(height: 8),
        Text(
          state.buddyEventDetail!.description,
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.white),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildEventItems(EventState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Things to Bring',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.white),
        ),
        const SizedBox(height: 8),
        BulletPoint(
          items: state.buddyEventDetail!.eventItems
                  ?.where((item) => item != null) // Remove null values
                  .map((item) => item!) // Cast non-null values
                  .toList() ??
              [''],
          textStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.white),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildEventGuidelines(EventState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Event Guidelines',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.white),
        ),
        const SizedBox(height: 8),
        BulletPoint(
          items: state.buddyEventDetail!.eventGuidelines
              ?.where((item) => item != null) // Remove null values
              .map((item) => item!) // Cast non-null values
              .toList()
              ?? [''],

          textStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.white),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildEventTags(EventState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Event tags',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.white),
        ),
        Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          children:
          state.buddyEventDetail!.tagList.map<Widget>((tag) {
            return Chip(
              backgroundColor: AppColors.primaryLightBackground,
              side: const BorderSide(color: AppColors.primaryLightBackground),
              padding: EdgeInsets.zero,
              label: Text(
                tag.trim(),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white,
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildEventActions(EventState state) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 30.0),
      child: Row(
        children: [
          Expanded(
            child: PrimaryButton(
              invert: true,
              title:
                  'Request to join ${state.buddyEventDetail?.eventFee == null ? '' : '(ƵC ${state.buddyEventDetail?.eventFee})'}',
              action: () {
                // Action for joining the event
              },
            ),
          ),
          const SizedBox(width: 16),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: GestureDetector(
              onTap: () => _showMoreOptionsBottomSheet(context),
              child: const Icon(Icons.more_horiz, color: AppColors.black),
            ),
          ),
        ],
      ),
    );
  }

  void _showMoreOptionsBottomSheet(BuildContext context) {
    showCustomModalBottomSheet(
      context: context,
      titles: ['Review event', 'Report event'],
      icons: [
        'assets/images/icons/review.svg',
        'assets/images/icons/report.svg'
      ],
      actions: [
        () => context.router.push(ProfileEditRoute(activeTab: 1)),
        () => context.router.push(ProfileEditRoute(activeTab: 2)),
      ],
    );
  }
}
