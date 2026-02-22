import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/utils/extensions/string_extension.dart';
import 'package:zheeta/core/utils/notify.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/buddy_events/data/models/buddy_event_id.dart';
import 'package:zheeta/features/buddy_events/presentation/cubits/event_details_cubit/event_details_cubit.dart';
import 'package:zheeta/features/buddy_events/presentation/widgets/bullet_points.dart';
import 'package:zheeta/router/app_router.gr.dart';
import 'package:zheeta/shared/widgets/back_button.dart';
import 'package:zheeta/shared/widgets/error_page.dart';
import 'package:zheeta/shared/widgets/primary_button.dart';
import 'package:zheeta/shared/bottom_sheets/reusable_bottom_sheet.dart';
import 'package:zheeta/shared/widgets/stacked_avatars.dart';

@RoutePage()
class EventDetailsScreen extends StatefulWidget {
  final String? id;
  final String? creatorId;

  const EventDetailsScreen({
    super.key,
    required this.id,
    required this.creatorId,
  });

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  late final EventDetailsCubit _eventDetailsCubit;

  int _selectedAdminTabIndex = 0;
  // TODO: Replace this with the actual ID from your authentication service/cubit
  final String _currentUserId = "c4eb5953-6250-41c1-9e17-b46342ae1229";
  // c4eb5953-6250-41c1-9e17-b46342ae1229

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _eventDetailsCubit = locator<EventDetailsCubit>();
    _eventDetailsCubit.fetchEventDetails(
      eventId: widget.id!,
      creatorId: widget.creatorId!,
    );
  }

  void _onPageChanged(int index) => setState(() => _currentIndex = index);

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
            color: AppColors.white,
          ),
        ),
      ),
      body: BlocBuilder<EventDetailsCubit, EventDetailsState>(
        bloc: _eventDetailsCubit,
        buildWhen: (previous, current) =>
            previous.status != current.status ||
            previous.event != current.event,
        builder: (context, state) {
          switch (state.status) {
            case EventDetailsStatus.loading:
              return const Center(child: CircularProgressIndicator());

            case EventDetailsStatus.error:
              return ErrorPage(
                onTryAgain: () => _eventDetailsCubit.fetchEventDetails(
                  eventId: widget.id!,
                  creatorId: widget.creatorId!,
                ),
              );

            case EventDetailsStatus.loaded:
              if (state.event == null) {
                return const Center(
                  child: Text(
                    "Event details not found",
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }
              return _buildEventDetails(state);

            case EventDetailsStatus.initial:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  /// ---------------- Event UI Builders ----------------
  Widget _buildCreatorAdminPanel() {
    // Helper function to build each tab item
    Widget buildTabItem(String title, int index) {
      final bool isActive = _selectedAdminTabIndex == index;
      return Expanded(
        child: GestureDetector(
          onTap: () => setState(() => _selectedAdminTabIndex = index),
          child: Container(
            color: Colors.transparent, // Makes the whole area tappable
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(), // Pushes content to center vertically
                Text(
                  title,
                  style: TextStyle(
                    color: isActive
                        ? const Color(0xFFE94F85)
                        : const Color(0xFF6E7191),
                    fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 4,
                  color:
                      isActive ? const Color(0xFFE94F85) : Colors.transparent,
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          // ++ CHANGE THIS LINE ++
          color: AppColors.white, // Changed from primaryLightBackground
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildTabItem('Event details', 0),
            buildTabItem('Participants', 1),
            buildTabItem('Join requests', 2),
          ],
        ),
      ),
    );
  }

  Widget _buildEventDetails(EventDetailsState state) {
    final event = state.event!;
    final bool isCreator = _currentUserId == event.creatorId;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildEventImages(event),
          if (isCreator) _buildCreatorAdminPanel(),
          if (isCreator)
            _buildAdminContentSection(event)
          else
            _buildEventInfo(event),
          _buildEventActions(event),
        ],
      ),
    );
  }

  Widget _buildEventImages(BuddyEventId event) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .35,
      child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .30,
            child: PageView.builder(
              itemCount: event.eventOtherPhotosUrl.length,
              onPageChanged: _onPageChanged,
              itemBuilder: (context, index) {
                return Image.network(
                  event.eventOtherPhotosUrl[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                      child: Icon(
                        Icons.broken_image,
                        size: 50,
                        color: Colors.grey,
                      ),
                    );
                  },
                );
              },
            ),
          ),
          _buildDotIndicators(event),
          _buildBottomContainer(event),
        ],
      ),
    );
  }

  Widget _buildDotIndicators(BuddyEventId event) {
    return Positioned(
      bottom: 75,
      left: MediaQuery.of(context).size.width / 2 -
          (event.eventOtherPhotosUrl.length * 12) / 2,
      child: Row(
        children: List.generate(event.eventOtherPhotosUrl.length, (index) {
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

  Widget _buildBottomContainer(BuddyEventId event) {
    return Positioned(
      bottom: 10,
      left: 0,
      right: 0,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25),
        height: 52,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(0, 4),
              blurRadius: 6,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: StackedAvatars(avatarUrls: [
                    event.creatorProfilePhotoUrl,
                    event.creatorProfilePhotoUrl,
                    event.creatorProfilePhotoUrl,
                  ]),
                ),
                Text(
                  '${event.noOfBuddiesJoined}/${event.noOfBuddiesWanted} needed',
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.primaryDark,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: SizedBox(
                width: 117,
                height: 36,
                child: PrimaryButton(
                  invert: false,
                  title: 'Invite',
                  action: () => _showInviteBottomSheet(context, event),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showInviteBottomSheet(BuildContext context, BuddyEventId event) {
    showCustomModalBottomSheet(
      context: context,
      titles: ['Share invite link', 'Share to your friends'],
      icons: [
        'assets/images/icons/share-white.svg',
        'assets/images/icons/link-white.svg'
      ],
      actions: [
        () async {
          await Clipboard.setData(ClipboardData(text: event.shareLink));
          NotifyUser.showSnackBar('Invite link copied to clipboard!');
        },
        // () => context.router.push(const ShareRoute()),
      ],
    );
  }

  Widget _buildEventInfo(BuddyEventId event) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            event.title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 8),
          _buildEventCost(event),
          const SizedBox(height: 16),
          _buildEventDetailsContainer(event),
          const SizedBox(height: 16),
          _buildEventDescription(event),
          if (event.eventItems?.isNotEmpty ?? false) _buildEventItems(event),
          if (event.eventGuidelines?.isNotEmpty ?? false)
            _buildEventGuidelines(event),
          _buildEventTags(event),
        ],
      ),
    );
  }

  Widget _buildEventCost(BuddyEventId event) {
    return Row(
      children: [
        const Text(
          'Participation cost: ',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (event.eventFee != null)
          SvgPicture.asset(
            "assets/images/icons/zheeta-coin-bold.svg",
            height: 12,
            colorFilter:
                const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
          ),
        Text(
          event.eventFee?.toString() ?? "Free",
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildEventDetailsContainer(BuddyEventId event) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(12.0),
      margin: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLocation(event),
          const SizedBox(height: 10),
          _buildEventDate(event),
          const Divider(thickness: 1, color: AppColors.primaryDark),
          _buildCreatorInfo(event),
        ],
      ),
    );
  }

  Widget _buildAdminContentSection(BuddyEventId event) {
    switch (_selectedAdminTabIndex) {
      case 0:
        return _buildEventInfo(event); // Event Details
      case 1:
        return _buildParticipantsList(event); // Participants
      case 2:
        return _buildJoinRequestsList(event); // Join Requests
      default:
        return _buildEventInfo(event);
    }
  }

  Widget _buildParticipantsList(BuddyEventId event) {
    // TODO: Replace this with your actual list of participants from the event model.
    final participants = [
      {'name': 'Dianne Russell', 'avatar': 'https://i.pravatar.cc/150?img=1'},
      {'name': 'john.smith', 'avatar': 'https://i.pravatar.cc/150?img=2'},
      {'name': 'sara.c', 'avatar': 'https://i.pravatar.cc/150?img=4'},
    ];

    if (participants.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(40.0),
          child: Text('No one has joined your event yet.',
              style: TextStyle(color: AppColors.white)),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Active Participants',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.white),
          ),
          const SizedBox(height: 16),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: participants.length,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              final participant = participants[index];
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Avatar and Name Section
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          participant['avatar']!,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        participant['name']!,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  // Action Buttons Section
                  Row(
                    children: [
                      // Invite Button
                      SizedBox(
                        width: 106,
                        height: 29,
                        child: ElevatedButton(
                          onPressed: () {
                            // TODO: Handle invite action
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                          ),
                          child: const Text(
                            'Invite',
                            style: TextStyle(
                              color: AppColors.primaryDark,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      // More Options Button
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.more_horiz,
                            color: AppColors.white,
                            size: 24,
                          ),
                          onPressed: () {
                            // TODO: Show options for this participant (e.g., remove)
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLocation(BuddyEventId event) {
    return Row(
      children: [
        const Icon(Icons.location_on_outlined,
            color: AppColors.primaryDark, size: 18),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            event.eventLocationAddress,
            style: const TextStyle(
              color: AppColors.primaryDark,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildJoinRequestsList(BuddyEventId event) {
    // TODO: Replace this with your actual list of join requests from the event model.
    final requests = [
      {
        'fullName': 'Christine Doe',
        'username': '@khareem23',
        'avatar': 'https://i.pravatar.cc/150?img=3',
        'age': 23,
        'gender': 'Female',
        'points': 2,
      },
      {
        'fullName': 'Mark P.',
        'username': '@markp',
        'avatar': 'https://i.pravatar.cc/150?img=5',
        'age': 28,
        'gender': 'Male',
        'points': 5,
      },
    ];

    if (requests.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(40.0),
          child: Text('You have no new join requests.',
              style: TextStyle(color: AppColors.white)),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Join Requests',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.white),
          ),
          const SizedBox(height: 16),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: requests.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final request = requests[index];

              // ++ THIS IS THE NEWLY REFACTORED REQUEST CARD ++
              return Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.primaryLightBackground,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    // User Info Section
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              NetworkImage(request['avatar'] as String),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Username and Points
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    request['username'] as String,
                                    style: const TextStyle(
                                        color: Color(0xFF6E7191), fontSize: 12),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.star,
                                          color: Color(0xFFFF8960), size: 16),
                                      const SizedBox(width: 4),
                                      Text(
                                        '${request['points']}zc',
                                        style: const TextStyle(
                                            color: Color(0xFFFF8960),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              // Full Name and Tags
                              Row(
                                children: [
                                  Text(
                                    request['fullName'] as String,
                                    style: const TextStyle(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  ),
                                  const SizedBox(width: 8),
                                  _buildGenderAgeTag(
                                      gender: request['gender'] as String,
                                      age: request['age'] as int),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Action Buttons Section
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 32,
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                backgroundColor: const Color(0xFFF6B9CE),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text(
                                'Reject',
                                style: TextStyle(
                                    color: Color(0xFF4E4B66), fontSize: 14),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: SizedBox(
                            height: 32,
                            child: PrimaryButton(
                              title: 'Accept',
                              action: () {},
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildGenderAgeTag({required String gender, required int age}) {
    final isFemale = gender.toLowerCase() == 'female';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isFemale
              ? [const Color(0xFFE52C6D), const Color(0xFFFF62A5)]
              : [
                  const Color(0xFF00A3FF),
                  const Color(0xFF00A3FF)
                ], // Example for male
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Icon(
            isFemale ? Icons.female_rounded : Icons.male_rounded,
            color: Colors.white,
            size: 12,
          ),
          const SizedBox(width: 2),
          Text(
            age.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventDate(BuddyEventId event) {
    return Row(
      children: [
        const Icon(Icons.calendar_month_outlined,
            color: AppColors.primaryDark, size: 18),
        const SizedBox(width: 8),
        Text(
          formatEventDate(event.startDate),
          style: const TextStyle(
            color: AppColors.primaryDark,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildCreatorInfo(BuddyEventId event) {
    return Row(
      children: [
        CircleAvatar(
          radius: 15,
          backgroundImage: NetworkImage(event.creatorProfilePhotoUrl),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: InkWell(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.creatorUsername.toLowerCase(),
                  style: const TextStyle(
                    color: AppColors.primaryDark,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const Text(
                  'Event creator',
                  style: TextStyle(
                    color: AppColors.primaryDark,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEventDescription(BuddyEventId event) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'About event',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          event.description,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.white,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildEventItems(BuddyEventId event) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Things to Bring',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
        const SizedBox(height: 8),
        BulletPoint(
          items: event.eventItems ?? [],
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.white,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildEventGuidelines(BuddyEventId event) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Event Guidelines',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
        const SizedBox(height: 8),
        BulletPoint(
          items: event.eventGuidelines ?? [],
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.white,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildEventTags(BuddyEventId event) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Event tags',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
        Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          children: event.tagList.map((tag) {
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

  Widget _buildEventActions(BuddyEventId event) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 30.0),
      child: Row(
        children: [
          Expanded(
            child: PrimaryButton(
              invert: true,
              title:
                  'Request to join ${event.eventFee == null ? '' : '(ƵC ${event.eventFee})'}',
              action: () {
                // TODO: handle join action
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
