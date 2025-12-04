import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/utils/pagination_controller.dart';
import 'package:zheeta/core/utils/token_utils.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/discover/data/models/nearby_model.dart';
import 'package:zheeta/features/discover/data/requests/nearby_update_request.dart';
import 'package:zheeta/features/discover/presentation/cubits/nearby_profiles_cubit/nearby_profile_cubit.dart';
import 'package:zheeta/features/discover/presentation/cubits/nearby_settings_cubit/nearby_settings_cubit.dart';
import 'package:zheeta/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:zheeta/router/app_router.gr.dart';
import 'package:zheeta/shared/bottom_sheets/nearby_filter_bottom_sheet.dart';
import 'package:zheeta/shared/widgets/back_button.dart';
import 'package:zheeta/shared/widgets/loader.dart';
import 'package:zheeta/shared/widgets/pill_container.dart';

@RoutePage()
class NearbySearchScreen extends StatefulWidget {
  const NearbySearchScreen({super.key});

  @override
  State<NearbySearchScreen> createState() => _NearbySearchScreenState();
}

class _NearbySearchScreenState extends State<NearbySearchScreen> {
  final ProfileCubit profileCubit = locator<ProfileCubit>();

  late final NearbyProfilesCubit _nearbyCubit;
  late final NearbySettingsCubit _settingsCubit;
  final ScrollController _scrollController = ScrollController();

  NearbyFilter? currentFilter;

  @override
  void initState() {
    super.initState();
    _nearbyCubit = locator<NearbyProfilesCubit>();
    _settingsCubit = locator<NearbySettingsCubit>();

    // Load settings
    _settingsCubit.loadSettings(
      profileCubit.state.profile?.data?.profile?.id ?? '',
    );

    _scrollController.addListener(() {
      if (_isBottom && !_nearbyCubit.state.isLoading) {
        _nearbyCubit.loadNextPage();
      }
    });
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    return _scrollController.position.pixels >=
        (_scrollController.position.maxScrollExtent * 0.9);
  }

  Future<void> _onRefresh() async {
    await _nearbyCubit.refreshProfiles();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _nearbyCubit),
        BlocProvider.value(value: _settingsCubit),
      ],
      child: Scaffold(
        backgroundColor: AppColors.secondaryLight,
        appBar: AppBar(
          backgroundColor: AppColors.secondaryLight,
          elevation: 0,
          leading: const AppBackButton(),
          title: const Text(
            'Zheetas Nearby',
            style: TextStyle(
              color: AppColors.grayscale,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          actions: [
            BlocConsumer<NearbySettingsCubit, NearbySettingsState>(
              listener: (context, settingsState) async {
                if (!settingsState.isUpdating &&
                    settingsState.errorMessage == null &&
                    settingsState.settings != null) {
                  final settings = settingsState.settings!;

                  // ✅ Save as current filter
                  setState(() {
                    currentFilter = NearbyFilter(
                      latitude: 0.0,
                      longitude: 0.0,
                      selectedGender: 'Male',
                      selectedDistance: '${settings.radiusInKm}km',
                    );
                  });

                  _nearbyCubit.refreshProfiles();
                }
              },
              builder: (context, settingsState) {
                return IconButton(
                  onPressed: () async {
                    final updatedFilter = await nearbyFilterBottomSheetView(
                      context,
                      initialFilter: currentFilter,
                    );

                    if (updatedFilter == null) return;

                    setState(() => currentFilter = updatedFilter);

                    final userId = await TokenUtil.getUserId();
                    final radiusInKm = int.tryParse(
                          updatedFilter.selectedDistance
                              .replaceAll('km', '')
                              .trim(),
                        ) ??
                        10;

                    if (!context.mounted) return;

                    context.read<NearbySettingsCubit>().updateSettings(
                          NearbyUpdateRequest(
                            id: settingsState.settings?.id.toString() ?? '',
                            userId: userId ?? '',
                            radiusInKm: radiusInKm,
                            longitude: updatedFilter.longitude!,
                            latitude: updatedFilter.latitude!,
                            gender: updatedFilter.selectedGender.toLowerCase(),
                          ),
                        );
                  },
                  icon: SvgPicture.asset(
                    'assets/images/icons/filter_mark.svg',
                    colorFilter: const ColorFilter.mode(
                        AppColors.black, BlendMode.srcIn),
                  ),
                );
              },
            ),
          ],
        ),
        body:
            BlocBuilder<NearbyProfilesCubit, PaginationState<NearbyDataModel>>(
          bloc: _nearbyCubit,
          builder: (context, state) {
            if (state.isLoading && state.items.isEmpty) {
              return loadingIndicator();
            }

            if (state.error != null && state.items.isEmpty) {
              return Center(
                child: Text(
                  state.error!,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: RefreshIndicator(
                onRefresh: _onRefresh,
                color: AppColors.primaryLight,
                child: state.items.isEmpty
                    ? ListView(
                        children: [
                          SizedBox(
                              height: MediaQuery.of(context).size.height * .4),
                          const Center(
                            child: Text(
                              'No nearby profiles found.',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryDark,
                              ),
                            ),
                          ),
                        ],
                      )
                    : GridView.builder(
                        controller: _scrollController,
                        padding: const EdgeInsets.all(18),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 14,
                          crossAxisSpacing: 14,
                          childAspectRatio: 0.65,
                        ),
                        itemCount: state.hasMore
                            ? state.items.length + 1
                            : state.items.length,
                        itemBuilder: (context, index) {
                          if (index >= state.items.length) {
                            return const Center(
                              child: SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  color: AppColors.primaryLight,
                                ),
                              ),
                            );
                          }

                          final nearby = state.items[index];

                          return GestureDetector(
                            onTap: () {
                              context.router
                                  .push(ProfileViewRoute(profileId: nearby.id));
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Stack(
                                children: [
                                  // Profile Image
                                  Positioned.fill(
                                    child: (nearby
                                                .profilePhotoURL?.isNotEmpty ??
                                            false)
                                        ? Image.network(
                                            nearby.profilePhotoURL!,
                                            fit: BoxFit.cover,
                                            errorBuilder: (_, __, ___) =>
                                                Container(
                                              color: AppColors.secondaryLight,
                                              child: const Icon(
                                                Icons.person,
                                                size: 48,
                                                color: AppColors.grayscale,
                                              ),
                                            ),
                                          )
                                        : Container(
                                            color: AppColors.secondaryLight,
                                            child: const Icon(
                                              Icons.person,
                                              size: 48,
                                              color: AppColors.grayscale,
                                            ),
                                          ),
                                  ),

                                  // Bottom Gradient
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    height: 155,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            const BorderRadius.vertical(
                                          bottom: Radius.circular(16),
                                        ),
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.transparent,
                                            AppColors.primaryDark
                                                .withValues(alpha: 0.9),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),

                                  // Info
                                  Positioned(
                                    bottom: 8,
                                    left: 8,
                                    right: 8,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '@${nearby.username}',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          children: [
                                            PillContainer(
                                              text: '${nearby.age}',
                                              backgroundColor: AppColors.white,
                                              textColor: AppColors.primaryDark,
                                              icon:
                                                  nearby.gender.toLowerCase() ==
                                                          'male'
                                                      ? Icons.male
                                                      : Icons.female,
                                            ),
                                            const SizedBox(width: 4),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 6,
                                                vertical: 2,
                                              ),
                                              decoration: BoxDecoration(
                                                color: nearby.gender
                                                            .toLowerCase() ==
                                                        'male'
                                                    ? Colors.green
                                                    : AppColors.primaryDark,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Text(
                                                nearby.gender.toLowerCase() ==
                                                        'male'
                                                    ? 'M'
                                                    : 'F',
                                                style: const TextStyle(
                                                  color: Colors.white,
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

                                  // Distance Badge
                                  Positioned(
                                    top: 6,
                                    right: 6,
                                    child: PillContainer(
                                      text: '${nearby.distance.toInt()} KM',
                                      backgroundColor: AppColors.white,
                                      textColor: AppColors.primaryDark,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            );
          },
        ),
      ),
    );
  }
}
