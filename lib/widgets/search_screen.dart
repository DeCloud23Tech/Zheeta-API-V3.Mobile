import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_search_usecases.dart';
import 'package:zheeta/profile/presentation/bloc/profile_cubit/profile_cubit.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/input_field.dart';
import 'package:zheeta/widgets/loader.dart';

class SearchUserScreen extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  context.read<ProfileCubit>().searchUserByCustomerCubit(
                        UserSearchByEmailParam(
                          email: value,
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
              child: BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  if (state is ProfileLoadingCompositeState) {
                    return LoadingIndicator();
                  }

                  final searchedUsers = (state as ProfileCompositeState)
                      .searchedUsersList; // Get the searched users list

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
                          backgroundImage:
                              NetworkImage(user.profileDisplayURL ?? ''),
                        ),
                        title: Text(user.username ?? 'Unknown'),
                        // subtitle: Text(
                        //   user.isFullyVerified == true
                        //       ? 'Verified'
                        //       : 'Not Verified',
                        // ),
                        onTap: () {
                          // Return the selected username to the previous screen
                          Navigator.pop(context, {
                            'username': user.username,
                            'userId': user.userId,
                          });
                        },
                      );
                    },
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
