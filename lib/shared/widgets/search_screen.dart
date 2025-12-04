import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/constants/debouncer.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/profile/domain/usecases/user_search_usecases.dart';
import 'package:zheeta/features/profile/presentation/cubits/profile_search_cubit/profile_search_cubit.dart';
import 'package:zheeta/shared/widgets/back_button.dart';
import 'package:zheeta/shared/widgets/input_field.dart';
import 'package:zheeta/shared/widgets/loader.dart';

class SearchUserScreen extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();
  final Debouncer _debouncer = Debouncer(milliseconds: 400);

  SearchUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileSearchCubit = locator<ProfileSearchCubit>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondaryLight,
        elevation: 0.0,
        leading: const AppBackButton(),
        title: const Text(
          'Search',
          style: TextStyle(
            color: AppColors.grayscale,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Debounced search input
            InputField(
              controller: _searchController,
              hintText: 'Enter username',
              onChanged: (value) {
                _debouncer.run(() {
                  if (value.isNotEmpty) {
                    profileSearchCubit.searchUserByCustomerCubit(
                      UserSearchByEmailParam(
                        userName: value,
                        pageNo: 1,
                        pageSize: 20,
                      ),
                    );
                  }
                });
              },
            ),
            const SizedBox(height: 16.0),

            Expanded(
              child: BlocBuilder<ProfileSearchCubit, ProfileSearchState>(
                builder: (context, state) {
                  if (state is ProfileSearchLoading) {
                    return loadingIndicator();
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
                      itemCount: searchedUsers.length,
                      itemBuilder: (context, index) {
                        final user = searchedUsers[index];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: (user.profileDisplayURL != null &&
                                    user.profileDisplayURL!.isNotEmpty)
                                ? NetworkImage(user.profileDisplayURL!)
                                : null,
                            child: (user.profileDisplayURL == null ||
                                    user.profileDisplayURL!.isEmpty)
                                ? const Icon(Icons.person)
                                : null,
                          ),
                          title: Text(user.username ?? 'Unknown'),
                          onTap: () {
                            Navigator.pop(context, {
                              'username': user.username,
                              'userId': user.userId,
                            });
                            profileSearchCubit.resetSearch();
                          },
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
      ),
    );
  }
}
