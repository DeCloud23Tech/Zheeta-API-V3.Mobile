import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/utils/extensions/string_extension.dart';
import 'package:zheeta/features/buddy_events/presentation/widgets/bullet_points.dart';
import 'package:zheeta/shared/widgets/primary_button.dart';
import 'package:zheeta/shared/widgets/stacked_avatars.dart';

@RoutePage()
class EventPreviewScreen extends StatefulWidget {
  final EventPreview event;

  const EventPreviewScreen({super.key, required this.event});

  @override
  State<EventPreviewScreen> createState() => _EventPreviewScreenState();
}

class _EventPreviewScreenState extends State<EventPreviewScreen> {
  int _currentIndex = 0;

  void _onPageChanged(int index) {
    if (_currentIndex != index) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      appBar: AppBar(
        backgroundColor: AppColors.primaryDark,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Event Preview',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildEventImages(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildEventTitle(),
                  const SizedBox(height: 8),
                  _buildParticipationCost(),
                  const SizedBox(height: 16),
                  _buildEventDetailsContainer(),
                  const SizedBox(height: 16),
                  _buildSectionTitle('About event'),
                  const SizedBox(height: 8),
                  _buildDescription(),
                  const SizedBox(height: 20),
                  if (widget.event.itemsToBring?.isNotEmpty ?? false)
                    _buildEventItems(widget.event.itemsToBring),
                  if (widget.event.guidelines?.isNotEmpty ?? false)
                    _buildEventGuidelines(widget.event.guidelines),
                  _buildEventTags(widget.event.selectedTags),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildEventImages() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .35,
      child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .30,
            child: PageView.builder(
              itemCount: widget.event.selectedMedia.length,
              onPageChanged: _onPageChanged,
              itemBuilder: (context, index) {
                return Image.file(
                  widget.event.selectedMedia[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                );
              },
            ),
          ),
          _buildDotIndicators(),
          _buildBottomContainer(),
        ],
      ),
    );
  }

  Widget _buildDotIndicators() {
    return Positioned(
      bottom: 75,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(widget.event.selectedMedia.length, (index) {
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

  Widget _buildBottomContainer() {
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
                  // Use StackedAvatars like in event details screen
                  child: StackedAvatars(avatarUrls: [
                    widget.event.creatorProfilePhotoUrl,
                    widget.event.creatorProfilePhotoUrl,
                    widget.event.creatorProfilePhotoUrl,
                  ]),
                ),
                const SizedBox(width: 8),
                Text(
                  '0/${widget.event.noOfBuddiesWanted} needed',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.pink,
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
                  color: AppColors.primaryLightBackground,
                  title: 'Invite',
                  invert: false,
                  action: () {
                    // Show preview message since this is just a preview
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Invite friends after creating the event'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventTitle() {
    return Text(
      widget.event.title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
      ),
    );
  }

  Widget _buildParticipationCost() {
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
        if (widget.event.category != 'Free')
          SvgPicture.asset(
            "assets/images/icons/zheeta-coin-bold.svg",
            height: 12,
            colorFilter:
            const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
          ),
        Text(
          widget.event.category != 'Free'
              ? widget.event.eventParticipationCost.toString()
              : "Free",
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildEventDetailsContainer() {
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
          _buildLocation(),
          const SizedBox(height: 10),
          _buildEventDate(),
          const Divider(thickness: 1, color: AppColors.greyscaleLight),
          _buildCreatorInfo(),
        ],
      ),
    );
  }

  Widget _buildLocation() {
    return Row(
      children: [
        const Icon(Icons.location_on_outlined, color: AppColors.grayscale, size: 18),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            widget.event.eventLocationAddress,
            style: const TextStyle(
              color: AppColors.grayscale,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildEventDate() {
    return Row(
      children: [
        const Icon(Icons.calendar_month_outlined, color: AppColors.grayscale, size: 18),
        const SizedBox(width: 8),
        Text(
          formatEventDate(widget.event.startDate.toString()),
          style: const TextStyle(
            color: AppColors.grayscale,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildCreatorInfo() {
    return Row(
      children: [
        CircleAvatar(
          radius: 15,
          backgroundImage: NetworkImage(widget.event.creatorProfilePhotoUrl),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: InkWell(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.event.creatorUsername.toLowerCase(),
                  style: const TextStyle(
                    color: AppColors.grayscaleBody,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const Text(
                  'Event creator',
                  style: TextStyle(
                    color: AppColors.grayscale,
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

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.white),
    );
  }

  Widget _buildDescription() {
    return Text(
      widget.event.description,
      style: const TextStyle(
          fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.white),
    );
  }

  Widget _buildEventItems(List<String>? eventItems) {
    return _buildBulletPoints('Things to Bring', eventItems);
  }

  Widget _buildEventGuidelines(List<String>? eventGuidelines) {
    return _buildBulletPoints('Event Guidelines', eventGuidelines);
  }

  Widget _buildBulletPoints(String title, List<String>? items) {
    if (items == null || items.isEmpty || items.first.isEmpty) {
      return const SizedBox.shrink();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(title),
        const SizedBox(height: 8),
        BulletPoint(
          items: items,
          textStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.white),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildEventTags(List<String> tagList) {
    if (tagList.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Event tags'),
        Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          children: tagList.map<Widget>((tag) {
            return Chip(
              backgroundColor: AppColors.primaryLightBackground,
              side: const BorderSide(color: AppColors.primaryLightBackground),
              padding: EdgeInsets.zero,
              label: Text(tag.trim(),
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white)),
            );
          }).toList(),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class EventPreview {
  final DateTime startDate;
  final String title;
  final String description;
  final String eventLocationAddress;
  final int noOfBuddiesWanted;
  final int noOfBuddiesJoined;
  final double eventParticipationCost;
  final String category;
  final List<String>? guidelines;
  final List<String>? itemsToBring;
  final List<String> selectedTags;
  final List<File> selectedMedia;
  final String creatorUsername;
  final String creatorProfilePhotoUrl;

  EventPreview({
    required this.startDate,
    required this.title,
    required this.description,
    required this.eventLocationAddress,
    required this.noOfBuddiesWanted,
    required this.noOfBuddiesJoined,
    required this.eventParticipationCost,
    required this.category,
    required this.guidelines,
    required this.itemsToBring,
    required this.selectedTags,
    required this.selectedMedia,
    required this.creatorUsername,
    required this.creatorProfilePhotoUrl,
  });
}