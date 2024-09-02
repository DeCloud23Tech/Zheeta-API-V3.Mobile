import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../activity/data/models/activity_model.dart';
import '../../../app/common/color.dart';
import '../../../widgets/media_container.dart';
import '../bloc/profile_cubit/profile_cubit.dart';

class PostsWidget extends StatelessWidget {
  const PostsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoadingCompositeState && state.currentPage == 1) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryDark,
                strokeWidth: 2,
              ),
            );
          } else if (state is ProfileCompositeState) {
            final List<ActivityModel>? medias = state.recentActivities?.data;
            if (medias == null) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryDark,
                  strokeWidth: 2,
                ),
              );
            }
            if (medias.isEmpty) {
              return Center(child: Text('No posts available.'));
            }
            return LayoutBuilder(
              builder: (context, constraints) {
                return Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    width: double.infinity,
                    child: Wrap(
                      runSpacing: 10,
                      spacing: 2,
                      alignment: WrapAlignment.spaceBetween,
                      runAlignment: WrapAlignment.spaceBetween,
                      children: medias
                          .where((e) =>
                              e.mediaCollectionURL != null &&
                              e.mediaCollectionURL.isNotEmpty)
                          .map((e) => SizedBox(
                                width: constraints.maxWidth / 3.2,
                                child: MediaContainer(
                                    mediaPath: e.mediaCollectionURL[0]),
                              ))
                          .toList(),
                    ),
                  ),
                );
              },
            );
          } else if (state is ProfileErrorState) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
