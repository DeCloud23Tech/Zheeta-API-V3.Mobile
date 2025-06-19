import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/common/constants/color.dart';
import 'package:zheeta/core/injection/di.dart';
import 'package:zheeta/features/profile/data/model/search_user_by_customer_model.dart';
import 'package:zheeta/features/profile/domain/usecase/user_search_usecases.dart';
import 'package:zheeta/features/profile/presentation/bloc/profile_cubit/profile_cubit.dart';
import 'package:zheeta/features/profile/presentation/bloc/profile_search_cubit/profile_search_cubit.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/input_field.dart';
import 'package:zheeta/widgets/loader.dart';

class SearchUserScreen extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  SearchUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileSearchCubit profileSearchCubit = locator<ProfileSearchCubit>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondaryLight,
        elevation: 0.0,
        leading: AppBackButton(),

        title: Text(
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
            // Input field
            InputField(
              controller: _searchController,
              hintText: 'Enter username',
              onChanged: (value) {
                if (value.isNotEmpty) {
                  profileSearchCubit.searchUserByCustomerCubit(
                        UserSearchByEmailParam(
                          userName: value,
                          pageNo: 1,
                          pageSize: 20,
                        ),
                      );
                }
              },
            ),
            const SizedBox(height: 16.0),

            // Search results
            Expanded(
              child: BlocBuilder<ProfileSearchCubit, ProfileSearchState>(
                builder: (context, state) {
                  if (state is ProfileSearchLoading) {
                    return loadingIndicator();
                  }

                  if (state is ProfileSearchSuccess) {
                    final List<SearchUserByCustomer> searchedUsers = state.searchResults.data!;

                    if (searchedUsers.isEmpty) {
                      return const Center(
                        child: Text('No users found'),
                      );
                    }

                    return ListView.builder(
                      itemCount: searchedUsers.length,
                      itemBuilder: (context, index) {
                        final user = searchedUsers[index];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(user.profileDisplayURL ?? ''),
                          ),
                          title: Text(user.username ?? 'Unknown'),
                          onTap: () {
                            Navigator.pop(context, {
                              'username': user.username,
                              'userId': user.userId,
                            });
                          },
                        );
                      },
                    );
                  }

                  // Handle other states (e.g., initial, error)
                  return const Center(child: Text('Start searching for users...'));
                },
              ),

            ),
          ],
        ),
      ),
    );
  }
}
