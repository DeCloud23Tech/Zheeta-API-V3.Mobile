import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zheeta/common/constants/color.dart';
import 'package:zheeta/features/buddy_events/presentation/widgets/bullet_points.dart';
import 'package:zheeta/utils/format_utils.dart';

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
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildImageSlider(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildEventTitle(),
                  _buildParticipationCost(),
                  _buildEventDetails(),
                  _buildSectionTitle('About event'),
                  _buildDescription(),
                  const SizedBox(height: 20),
                  _buildEventTags(widget.event.selectedTags),
                  if (widget.event.itemsToBring!.first.isNotEmpty)
                    _buildEventItems(widget.event.itemsToBring),
                  if (widget.event.guidelines!.first.isNotEmpty)
                    _buildEventGuidelines(widget.event.guidelines),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildImageSlider() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .26,
      child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .25,
            child: PageView.builder(
              itemCount: widget.event.selectedMedia.length,
              onPageChanged: _onPageChanged,
              itemBuilder: (context, index) {
                return Image.file(
                  widget.event.selectedMedia[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.18,
                );
              },
            ),
          ),
          Positioned(
            bottom: 25,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                  List.generate(widget.event.selectedMedia.length, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: _currentIndex == index ? 8 : 6,
                  width: 8,
                  decoration: BoxDecoration(
                    color:
                        _currentIndex == index ? Colors.white : AppColors.grey,
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventTitle() {
    return Text(
      widget.event.title,
      style: const TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.white),
    );
  }

  Widget _buildParticipationCost() {
    return Row(
      children: [
        const Text('Event price: ',
            style: TextStyle(
                color: AppColors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold)),
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
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildEventDetails() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        // Added padding to the entire container
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row for event location
            Row(
              children: [
                const Icon(Icons.location_on_outlined,
                    color: AppColors.grayscale, size: 18),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    widget.event.eventLocationAddress,
                    style: const TextStyle(
                        color: AppColors.grayscaleBody,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            Row(
              children: [
                const Icon(Icons.calendar_month_outlined,
                    color: AppColors.grayscale, size: 18),
                const SizedBox(width: 8),
                Text(
                  formatEventDate(widget.event.startDate.toString()),
                  style: const TextStyle(
                      color: AppColors.grayscaleBody,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.white),
      ),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(title),
        BulletPoint(
          items: items ?? [],
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
  final int noOfBuddiesJoined;
  final int noOfBuddiesWanted;
  final double eventParticipationCost;
  final String category;
  final List<String>? guidelines;
  final List<String>? itemsToBring;
  final List<String> selectedTags;
  final List<File> selectedMedia;

  EventPreview({
    required this.startDate,
    required this.title,
    required this.description,
    required this.eventLocationAddress,
    required this.noOfBuddiesJoined,
    required this.noOfBuddiesWanted,
    required this.eventParticipationCost,
    required this.category,
    required this.guidelines,
    required this.itemsToBring,
    required this.selectedTags,
    required this.selectedMedia,
  });
}
