import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/common/constants/color.dart';
import 'package:zheeta/common/notify/notify_user.dart';
import 'package:zheeta/core/injection/di.dart';
import 'package:zheeta/core/router/app_router.gr.dart';
import 'package:zheeta/features/discover/data/model/nearby_model.dart';
import 'package:zheeta/features/discover/data/request/nearby_update_request.dart';
import 'package:zheeta/features/discover/presentation/bloc/nearby_bloc/nearby_cubit.dart';
import 'package:zheeta/features/discover/presentation/widgets/nearby_filter_bottom_sheet.dart';
import 'package:zheeta/features/profile/presentation/bloc/profile_cubit/profile_cubit.dart';
import 'package:zheeta/utils/pagination_controller.dart';
import 'package:zheeta/utils/token_utils.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/loader.dart';
import 'package:zheeta/widgets/pill_container.dart';

@RoutePage()
class NearbySearchScreen extends StatefulWidget {
  const NearbySearchScreen({super.key});

  @override
  State<NearbySearchScreen> createState() => _NearbySearchScreenState();
}

class _NearbySearchScreenState extends State<NearbySearchScreen> {
  ProfileCubit profileCubit = locator<ProfileCubit>();
  NearbyCubit nearbyCubit = locator<NearbyCubit>();
  final ScrollController _scrollController = ScrollController();
  late PaginatedListController<NearbyDataModel, NearbyCubit, NearbyState>
      _nearbyPaginatedController;

  NearbyFilter? currentFilter;

  @override
  void initState() {
    super.initState();

    nearbyCubit.fetchNearbySettingsCubit(
        userId: profileCubit.state.profile?.data?.profile?.id);

    // Initialize the PaginatedListController
    _nearbyPaginatedController =
        PaginatedListController<NearbyDataModel, NearbyCubit, NearbyState>(
      fetchItems: (param) => nearbyCubit.fetchNearbyProfilesCubit(param),
      cubit: nearbyCubit,
    );

    // Add scroll listener to load more items when reaching the bottom
    _scrollController.addListener(_scrollListener);

    // Load the initial page of nearby profiles
    _loadNearbyPage();
  }

  void _loadNearbyPage() {
    // Load the next page of nearby profiles

    _nearbyPaginatedController.loadNextPage(
      successCondition: (state) =>
          state.status == NearbyStatus.success &&
          state.nearbyProfiles.data.isNotEmpty,
      extractItems: (state) => state.nearbyProfiles.data,
      isError: (state) => state.status == NearbyStatus.error,
    );
  }

  void _scrollListener() {
    if (_isBottom) {
      _loadNearbyPage();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    return currentScroll >=
        (maxScroll * 0.9); // Trigger loading when 90% scrolled
  }

  Future<void> _onRefresh() async {
    _nearbyPaginatedController.reset();
    _loadNearbyPage();
    nearbyCubit.fetchNearbySettingsCubit(
        userId: profileCubit.state.profile?.data?.profile?.id);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryLight,
        elevation: 0.0,
        leading: AppBackButton(),
        title: Text(
          'Zheetas nearby',
          style: TextStyle(
            color: AppColors.grayscale,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          BlocConsumer<NearbyCubit, NearbyState>(
            listener: (context, state) {
              if (state.status == NearbyStatus.settingsUpdated) {
                _onRefresh();
              } else if (state.status == NearbyStatus.error) {
                NotifyUser.showSnackBar(state.errorMessage);
              }
            },
            builder: (BuildContext context, state) {
              return GestureDetector(
                onTap: () async {
                  // Open the bottom sheet with the current filter values
                  final nearbyFilter = await nearbyFilterBottomSheetView(
                    context,
                    initialFilter: currentFilter,
                  );

                  final userId = await TokenUtil.getUserId();

                  if (nearbyFilter != null) {
                    currentFilter = nearbyFilter;

                    final int radiusInKm = int.parse(currentFilter!
                        .selectedDistance
                        .replaceAll('km', '')
                        .trim());

                    //TODO Fix this

                    print(state.settingsData);
                    nearbyCubit.updateNearbySettingsCubit(NearbyUpdateRequest(
                      id: state.settingsData!.id.toString(),
                      userId: userId ?? '',
                      radiusInKm: radiusInKm,
                      longitude: currentFilter!.longitude!,
                      latitude: currentFilter!.latitude!,
                      gender: currentFilter!.selectedGender,
                    ));

                    print('Latitude: ${currentFilter?.latitude}');
                    print('Longitude: ${currentFilter?.longitude}');
                    print('Selected Gender: ${currentFilter?.selectedGender}');
                    print('Selected Distance: $radiusInKm');
                  }
                },
                child: SvgPicture.asset(
                  'assets/images/icons/filter_mark.svg',
                  colorFilter:
                      ColorFilter.mode(AppColors.black, BlendMode.srcIn),
                ),
              );
            },
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: BlocBuilder<NearbyCubit, NearbyState>(
        builder: (context, state) {
          if (state.status == NearbyStatus.loading &&
              _nearbyPaginatedController.items.isEmpty) {
            return loadingIndicator();
          } else if ((state.status == NearbyStatus.success ||
              state.status == NearbyStatus.settingsLoaded) &&
              _nearbyPaginatedController.items.isEmpty) {
            return Center(
              child: Text(
                'No nearby profiles found.',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryDark,
                ),
              ),
            );
          }

          return Column(
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
                  data: _nearbyPaginatedController.items,
                  scrollController: _scrollController,
                  onRefresh: _onRefresh,
                ),
              ),
            ],
          );
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
    super.key,
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
        padding: EdgeInsets.only(left: 18.0, right: 18.0, bottom: 18.0),
        child: GridView.builder(
          controller: scrollController,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 14.0,
            crossAxisSpacing: 14.0,
            childAspectRatio: 0.67,
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
                  // Profile Image Container
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.network(
                        nearbyData.profilePhotoURL?? '',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  //Gradient Overlay
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 155,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(16.0)),
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
                  // Profile Info
                  Positioned(
                    bottom: 5,
                    left: 8,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '@${nearbyData.username}',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
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
                                        horizontal: 6, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: nearbyData.gender == 'Male'
                                          ? Colors.green
                                          : AppColors.primaryDark,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      nearbyData.gender == 'Male' ? 'M' : 'F',
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SvgPicture.asset('assets/images/icons/add-nearby.svg'),
                      ],
                    ),
                  ),
                  // Distance Badge
                  Positioned(
                    top: 6.0,
                    right: 6.0,
                    child: PillContainer(
                      text: '${nearbyData.distance.toInt()} KM',
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
