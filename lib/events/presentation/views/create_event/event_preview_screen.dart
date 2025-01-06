import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/widgets/primary_button.dart';

@RoutePage()
class EventPreviewScreen extends StatefulWidget {
  final Event event;

  const EventPreviewScreen({required this.event});

  @override
  State<EventPreviewScreen> createState() => _EventPreviewScreenState();
}

class _EventPreviewScreenState extends State<EventPreviewScreen> {
  final List<String> images = [
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
  ];
  int _currentIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    String eventDescription = "This is a sample event description";
    String eventLocation = "New York, USA";
    String creatorName = "John Doe";
    DateTime eventDate = DateTime.now();

    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      appBar: AppBar(
        backgroundColor: AppColors.primaryDark,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Event preview',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .3,
              child: Stack(
                children: [
                  // PageView for images
                  Container(
                    height: MediaQuery.of(context).size.height * .25,
                    child: PageView.builder(
                      itemCount: images.length,
                      onPageChanged: _onPageChanged,
                      itemBuilder: (context, index) {
                        return Image.network(
                          images[index],
                          fit: BoxFit.cover,
                          height: MediaQuery.of(context).size.height * .25,
                          width: double.infinity,
                        );
                      },
                    ),
                  ),

                  // Dot indicators
                  Positioned(
                    bottom: 75,
                    left: MediaQuery.of(context).size.width / 2 -
                        (images.length * 12) / 2, // Center the dots
                    child: Row(
                      children: List.generate(images.length, (index) {
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
                      margin: EdgeInsets.symmetric(horizontal: 20),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              '3/12  needed',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
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
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Weekend Hiking Adventure',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    'Event price: \$120',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    height: 150,
                    decoration: BoxDecoration(
                      color: AppColors.primaryLightBackground,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0), // Added padding to the entire container
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Row for event location
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on_outlined,
                                color: AppColors.hintText,
                                size: 18,
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  'eventLocationAddress',
                                  style: const TextStyle(
                                    color: AppColors.hintText,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10), // Adjusted spacing

                          // Row for buddies information
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.groups_outlined,
                                    color: AppColors.hintText,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'noOfBuddiesJoined/noOfBuddiesWanted needed',
                                    style: const TextStyle(
                                      color: AppColors.hintText,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          const SizedBox(height: 10), // Spacing before the divider

                          // Divider for separation
                          Divider(
                            thickness: 1,
                            color: AppColors.hintText.withOpacity(0.5), // Slight transparency for subtle styling
                          ),

                          const SizedBox(height: 10), // Spacing after the divider

                          // Row for creator information
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage: NetworkImage(
                                    'https://via.placeholder.com/100'), // Replace with creator's image
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  'Creator: $creatorName',
                                  style: const TextStyle(
                                    fontSize: 14, // Slightly reduced for better alignment
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.white, // Assuming default text color
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  Text(
                    'About event',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),

                  Text(
                    'Join us for a refreshing hike in the beautiful Green Hill Trails! This event is perfect for anyone who loves nature, fitness, and making new friends. We’ll cover about 8 miles, starting with a gentle ascent to the top, where we’ll enjoy a scenic picnic and take some great photos. This hike is beginner-friendly, and we encourage everyone to bring snacks, water, and comfortable shoes.',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Event {
  final String eventMainPhotoUrl;
  final DateTime startDate;
  final String title;
  final String description;
  final String eventLocationAddress;
  final int noOfBuddiesJoined;
  final int noOfBuddiesWanted;
  final double eventParticipationCost;
  final String category;

  Event({
    required this.eventMainPhotoUrl,
    required this.startDate,
    required this.title,
    required this.description,
    required this.eventLocationAddress,
    required this.noOfBuddiesJoined,
    required this.noOfBuddiesWanted,
    required this.eventParticipationCost,
    required this.category,
  });
}
