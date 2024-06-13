import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/discover/data/model/nearby_model.dart';

import '../../../app/injection/di.dart';
import '../bloc/nearby_bloc/nearby_cubit.dart';
import '../viewmodel/nearby_viewmodel.dart';
import '../widgets/pill_container.dart';

@RoutePage()
class NearbySearchScreen extends StatefulWidget {
  const NearbySearchScreen({super.key});

  @override
  State<NearbySearchScreen> createState() => _NearbySearchScreenState();
}

class _NearbySearchScreenState extends State<NearbySearchScreen> {
  late NearbyViewModel nearbyViewModel;

  @override
  void initState() {
    nearbyViewModel = locator<NearbyViewModel>();
    nearbyViewModel.fetchProfiles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryLight,
        elevation: 0.0,
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
          'Zheetas nearby',
          style: TextStyle(
              color: AppColors.grayscale,
              fontSize: 24,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        // actions: [
        //   GestureDetector(
        //     onTap: () {
        //       notificationFilterBottomSheet(context);
        //     },
        //     child: SvgPicture.asset('assets/images/icons/filter_mark.svg'),
        //   ),
        //   SizedBox(width: 24),
        // ],
      ),
      body: StreamBuilder<NearbyState>(
        stream: nearbyViewModel.stateStream,
        builder: (context, snapshot) {
          final state = snapshot.data;
          if (state is NearbyLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is NearbyError) {
            return Center(child: Text('Error: ${state.errorMessage}'));
          } else if (state is NearbySuccess) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              'People closer to your location${state.data.data[0].age} ',
                          style: TextStyle(
                              color: AppColors.darkText,
                              fontSize: 14,
                              fontWeight: FontWeight.w300),
                        ),
                        TextSpan(
                          text: '(30Km radius)',
                          style: TextStyle(
                              color: AppColors.primaryDark,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Expanded(
                    child: GridBox(data: state.data.data),
                  ),
                ],
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class GridBox extends StatelessWidget {
  final List<NearbyDataModel> data;

  GridBox({required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 18.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 18.0,
          crossAxisSpacing: 18.0,
          childAspectRatio: 0.65,
        ),
        itemCount: data.length, // Use the length of the data list
        itemBuilder: (context, index) {
          final nearbyData =
              data[index]; // Access the data at the current index
          return GestureDetector(
            onTap: () {
              router.push(ProfileRoute(profileId: data[index].id));
            },
            child: Stack(
              children: [
                // Background image
                Container(
                  width: 180,
                  height: 267,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.network(
                      nearbyData.profilePhotoURL,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                // Gradient overlay towards bottom
                Positioned(
                  bottom: 5,
                  child: Container(
                    width: 177,
                    height: 155,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          AppColors.primaryDark,
                        ],
                      ),
                    ),
                  ),
                ),
                // Overlay at the bottom
                Positioned(
                  bottom: 8,
                  left: 8,
                  right: 0,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '@${nearbyData.username}',
                              // Display the username from the data
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Row(
                                children: [
                                  PillContainer(
                                    text: '${nearbyData.age}',
                                    backgroundColor: AppColors.white,
                                    textColor: AppColors.primaryDark,
                                    icon: nearbyData.gender == 'Male' ? Icons.male : Icons.female,
                                  ),
                                  SizedBox(width: 4),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                    ),
                                    child: Text(
                                      nearbyData.gender == 'Male' ? 'M' : "F",
                                      style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SvgPicture.asset(
                            'assets/images/icons/add-nearby.svg'),
                      ],
                    ),
                  ),
                ),
                // Text on top of image
                Positioned(
                  top: 8.0,
                  right: 10.0,
                  child: PillContainer(
                    text: '${nearbyData.distance}KM',
                    // Display the distance from the data
                    backgroundColor: AppColors.white,
                    textColor: AppColors.primaryDark,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
