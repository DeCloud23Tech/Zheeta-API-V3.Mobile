import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/constants/debouncer.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/profile/domain/usecases/user_search_usecases.dart';
import 'package:zheeta/features/profile/presentation/cubits/profile_search_cubit/profile_search_cubit.dart';
import 'package:zheeta/features/profile/presentation/widgets/search_field.dart';
import 'package:zheeta/router/app_router.gr.dart';
import 'package:zheeta/shared/widgets/back_button.dart';
import 'package:zheeta/shared/widgets/network_image.dart';
import 'package:zheeta/shared/widgets/primary_button.dart';

@RoutePage()
class UserFinderScreen extends StatelessWidget {
  const UserFinderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileSearchCubit = locator<ProfileSearchCubit>();
    profileSearchCubit.resetSearch();
    final TextEditingController searchController = TextEditingController();
    final Debouncer debouncer = Debouncer(milliseconds: 400);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
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
                      return ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 8),
                        leading: ClipRRect(
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
                            height: 45,
                            width: 45,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          '@${user.username}',
                          style: Theme.of(context).textTheme.bodyMedium,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxHeight: 30,
                            maxWidth: 130,
                          ),
                          child: PrimaryButton(
                            title: 'View Profile',
                            fontSize: 12,
                            action: () {
                              context.router.push(
                                ProfileViewRoute(
                                  profileId: user.userId!,
                                ),
                              );
                            },
                          ),
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
