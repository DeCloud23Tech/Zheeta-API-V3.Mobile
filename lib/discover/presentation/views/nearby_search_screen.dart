import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/discover/data/model/nearby_model.dart';

import '../../../app/injection/di.dart';
import '../../../widgets/loading_screen.dart';
import '../bloc/nearby_bloc/nearby_cubit.dart';
import '../widgets/pill_container.dart';

@RoutePage()
class NearbySearchScreen extends StatefulWidget {
  const NearbySearchScreen({super.key});

  @override
  State<NearbySearchScreen> createState() => _NearbySearchScreenState();
}

class _NearbySearchScreenState extends State<NearbySearchScreen> {
  late NearbyCubit nearbyCubit;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    nearbyCubit = locator<NearbyCubit>();
    nearbyCubit.fetchNearbyProfiles();
    nearbyCubit.fetchNearbySettings();
    nearbyCubit.resetHasReachedMax();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom && !nearbyCubit.state.hasReachedMax) {
      // Only fetch next page if it's not already fetching
      if (!nearbyCubit.state.isFetching) {
        nearbyCubit.fetchNearbyProfiles(
            currentPage: nearbyCubit.state.currentPage + 1);
      }
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  Future<void> _onRefresh() async {
    nearbyCubit.reset();
    nearbyCubit.fetchNearbyProfiles();
    nearbyCubit.fetchNearbySettings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryLight,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () => context.router.pop(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(5),
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Icon(Icons.arrow_back_ios_new, color: AppColors.grey),
            ),
          ),
        ),
        title: Text(
          'Zheetas nearby',
          style: TextStyle(
            color: AppColors.grayscale,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<NearbyCubit, NearbyState>(
        builder: (context, state) {
          if (state.status == NearbyStatus.loading) {
            return LoadingScreen(
              backgroundColor: AppColors.secondaryLight,
              indicatorColor: AppColors.primaryDark,
            );
          } else if (state.status == NearbyStatus.error) {
            return Center(child: Text('Error: ${state.errorMessage}'));
          } else if (state.status == NearbyStatus.success ||
              state.status == NearbyStatus.settingsLoaded) {
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
                          text: 'People closer to your location ',
                          style: TextStyle(
                            color: AppColors.darkText,
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        TextSpan(
                          text:
                              '(${state.settingsData?.radiusInKm ?? '0'} Km radius)',
                          style: TextStyle(
                            color: AppColors.primaryDark,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Expanded(
                    child: GridBox(
                      data: state.nearbyProfiles,
                      scrollController: _scrollController,
                      onRefresh: _onRefresh,
                    ),
                  ),
                ],
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}

class GridBox extends StatelessWidget {
  final List<NearbyDataModel> data;
  final ScrollController scrollController;
  final Future<void> Function() onRefresh;

  const GridBox({
    required this.data,
    required this.scrollController,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      color: AppColors.primaryLight,
      child: Padding(
        padding: EdgeInsets.only(left: 18.0),
        child: GridView.builder(
          controller: scrollController,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 18.0,
            crossAxisSpacing: 18.0,
            childAspectRatio: 0.65,
          ),
          itemCount: data.length,
          itemBuilder: (context, index) {
            final nearbyData = data[index];
            return GestureDetector(
              onTap: () {
                context.router.push(ProfileViewRoute(profileId: nearbyData.id));
              },
              child: Stack(
                children: [
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
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
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
                  Positioned(
                    bottom: -2,
                    left: 6,
                    right: 0,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '@${nearbyData.username}',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        PillContainer(
                                          text: '${nearbyData.age}',
                                          backgroundColor: AppColors.white,
                                          textColor: AppColors.primaryDark,
                                          icon: nearbyData.gender == 'Male'
                                              ? Icons.male
                                              : Icons.female,
                                        ),
                                        SizedBox(width: 4),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 6,
                                            vertical: 2,
                                          ),
                                          decoration: BoxDecoration(
                                            color: nearbyData.gender == 'Male'
                                                ? Colors.green
                                                : AppColors.primaryDark,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8)),
                                          ),
                                          child: Text(
                                            nearbyData.gender == 'Male'
                                                ? 'M'
                                                : 'F',
                                            style: TextStyle(
                                              color: AppColors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SvgPicture.asset(
                                        'assets/images/icons/add-nearby.svg'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 6.0,
                    right: 6.0,
                    child: PillContainer(
                      text: '${nearbyData.distance.toInt()}KM',
                      backgroundColor: AppColors.white,
                      textColor: AppColors.primaryDark,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
