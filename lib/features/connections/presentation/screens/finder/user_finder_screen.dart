import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/constants/debouncer.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/app/presentation/widgets/general_footer_nav.dart';
import 'package:zheeta/features/profile/domain/usecases/user_search_usecases.dart';
import 'package:zheeta/features/profile/presentation/cubits/profile_search_cubit/profile_search_cubit.dart';
import 'package:zheeta/features/profile/presentation/widgets/search_field.dart';
import 'package:zheeta/router/app_router.gr.dart';
import 'package:zheeta/shared/widgets/back_button.dart';
import 'package:zheeta/shared/widgets/gender_age.dart';
import 'package:zheeta/shared/widgets/gender_indicator.dart';
import 'package:zheeta/shared/widgets/network_image.dart';
import 'package:zheeta/shared/widgets/primary_button.dart';

@RoutePage()
class UserFinderScreen extends StatelessWidget {
  const UserFinderScreen({super.key});

  String _formatGender(String? gender) {
    if (gender == null || gender.trim().isEmpty) return '';

    final normalizedGender = gender.trim().toLowerCase();
    if (normalizedGender == '1' || normalizedGender == 'm') return 'M';
    if (normalizedGender == '2' || normalizedGender == 'f') return 'F';
    if (normalizedGender == 'male') return 'M';
    if (normalizedGender == 'female') return 'F';

    return gender.trim();
  }

  @override
  Widget build(BuildContext context) {
    final profileSearchCubit = locator<ProfileSearchCubit>();
    profileSearchCubit.resetSearch();
    final TextEditingController searchController = TextEditingController();
    final Debouncer debouncer = Debouncer(milliseconds: 400);

    return Scaffold(
      backgroundColor: AppColors.inputField,
      extendBody: true,
      bottomNavigationBar: buildGeneralFooterNav(context),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.inputField,
        surfaceTintColor: AppColors.inputField,
        leading: const AppBackButton(),
        title: const Text('User Finder'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Replace old TextField with SearchField
          SearchField(
            searchController: searchController,
            containerColor: AppColors.white,
            iconColor: AppColors.black,
            textColor: Colors.blueGrey,
            onChanged: (value) {
              debouncer.run(() {
                if (value.isNotEmpty) {
                  profileSearchCubit.searchUserByCustomerCubit(
                    UserSearchByEmailParam(
                      userName: value,
                      pageNo: 1,
                      pageSize: 20,
                    ),
                  );
                } else {
                  profileSearchCubit.resetSearch();
                }
              });
            },
          ),

          const SizedBox(height: 8),

          // Results section
          Expanded(
            child: BlocBuilder<ProfileSearchCubit, ProfileSearchState>(
              builder: (context, state) {
                if (state is ProfileSearchLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is ProfileSearchError) {
                  return Center(
                    child: Text(
                      state.errorMessage,
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                }

                if (state is ProfileSearchSuccess) {
                  final searchedUsers = state.searchResults.data ?? [];

                  if (searchedUsers.isEmpty) {
                    return const Center(child: Text('No users found'));
                  }

                  return ListView.builder(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    itemCount: searchedUsers.length,
                    itemBuilder: (context, index) {
                      final user = searchedUsers[index];
                      final formattedGender = _formatGender(user.gender);

                      return Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 8,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: CustomNetworkImage(
                                imageUrl: (user.profileDisplayURL != null &&
                                        user.profileDisplayURL!.isNotEmpty)
                                    ? user.profileDisplayURL!
                                    : null,
                                errorWidget: (user.profileDisplayURL == null ||
                                        user.profileDisplayURL!.isEmpty)
                                    ? const Icon(Icons.person, size: 40)
                                    : null,
                                height: 52,
                                width: 52,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '@${user.username ?? ''}',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  if ((user.fullName ?? '').trim().isNotEmpty ||
                                      (user.isFullyVerified ?? false) ||
                                      (formattedGender.isNotEmpty &&
                                          user.age != null))
                                    Padding(
                                      padding: const EdgeInsets.only(top: 2),
                                      child: Row(
                                        children: [
                                          if ((user.fullName ?? '')
                                              .trim()
                                              .isNotEmpty)
                                            Flexible(
                                              child: Text(
                                                user.fullName!.trim(),
                                                style: const TextStyle(
                                                  color: AppColors.grayscale,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          if ((user.fullName ?? '')
                                                  .trim()
                                                  .isNotEmpty &&
                                              ((user.isFullyVerified ??
                                                      false) ||
                                                  (formattedGender.isNotEmpty &&
                                                      user.age != null)))
                                            const SizedBox(width: 6),
                                          if (user.isFullyVerified ??
                                              false) ...[
                                            Image.asset(
                                              'assets/images/badge.png',
                                              width: 19,
                                              height: 19,
                                            ),
                                            const SizedBox(width: 6),
                                          ],
                                          if (formattedGender.isNotEmpty &&
                                              user.age != null) ...[
                                            GenderAgeWidget(
                                              gender: formattedGender,
                                              age: user.age!,
                                            ),
                                            const SizedBox(width: 6),
                                            GenderIndicator(
                                              gender: formattedGender,
                                            ),
                                          ],
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            SizedBox(
                              width: 100,
                              height: 30,
                              child: PrimaryButton(
                                title: 'View Profile',
                                fontSize: 10.5,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                action: user.userId == null
                                    ? null
                                    : () {
                                        context.router.push(
                                          ProfileViewRoute(
                                            profileId: user.userId!,
                                          ),
                                        );
                                      },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }

                return const Center(
                  child: Text('Start searching for users...'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
