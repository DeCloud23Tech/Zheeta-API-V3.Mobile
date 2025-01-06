import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/app/pagination_controller.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/discover/data/model/nearby_model.dart';
import 'package:zheeta/discover/presentation/bloc/nearby_bloc/nearby_cubit.dart';
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
  late PaginatedListController<NearbyDataModel, NearbyCubit, NearbyState>
      _nearbyPaginatedController;

  final ScrollController _scrollController = ScrollController();

  NearbyCubit nearbyCubit = locator<NearbyCubit>();

  @override
  void initState() {
    super.initState();

    nearbyCubit.fetchNearbySettings();
    // Initialize the PaginatedListController
    _nearbyPaginatedController =
        PaginatedListController<NearbyDataModel, NearbyCubit, NearbyState>(
      fetchItems: (param) => nearbyCubit.fetchNearbyProfiles(param),
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
      successCondition: (state) => state.status == NearbyStatus.success,
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
    nearbyCubit.fetchNearbySettings();
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
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<NearbyCubit, NearbyState>(
        builder: (context, state) {
          if (state.status == NearbyStatus.loading &&
              _nearbyPaginatedController.items.isEmpty) {
            return LoadingIndicator();
          } else if (state.status == NearbyStatus.success &&
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
                        nearbyData.profilePhotoURL,
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
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(16.0)),
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
                                    icon: nearbyData.gender == 'Male' ? Icons.male : Icons.female,
                                  ),
                                  SizedBox(width: 4),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: nearbyData.gender == 'Male' ? Colors.green : AppColors.primaryDark,
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
