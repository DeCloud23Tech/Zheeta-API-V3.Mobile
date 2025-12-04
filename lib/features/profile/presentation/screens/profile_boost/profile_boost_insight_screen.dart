import 'package:auto_route/annotations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/utils/notify.dart';
import 'package:zheeta/core/utils/token_utils.dart';
import 'package:zheeta/features/profile/presentation/cubits/profile_boost_cubit/profile_boost_cubit.dart';
import 'package:zheeta/shared/widgets/back_button.dart';
import 'package:zheeta/shared/widgets/loader.dart';

@RoutePage()
class ProfileBoostInsightScreen extends StatefulWidget {
  final String userName;

  const ProfileBoostInsightScreen({super.key, required this.userName});

  @override
  State<ProfileBoostInsightScreen> createState() =>
      _ProfileBoostInsightScreenState();
}

class _ProfileBoostInsightScreenState extends State<ProfileBoostInsightScreen> {
  @override
  void initState() {
    super.initState();
    _fetchBoostInsight(); // load boost data on screen open
  }

  Future<void> _fetchBoostInsight() async {
    final userId = await TokenUtil.getUserId();
    if (!mounted) return;
    context.read<ProfileBoostCubit>().getProfileBoostInsightCubit(userId!);
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
          'Boost insights',
          style: TextStyle(
            color: AppColors.grayscale,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: BlocConsumer<ProfileBoostCubit, ProfileBoostState>(
            listener: (context, state) {
              if (state is ProfileBoostError) {
                NotifyUser.showSnackBar(state.message);
              }
            },
            builder: (context, state) {
              if (state is ProfileBoostLoading) {
                return loadingIndicator();
              } else if (state is ProfileBoostInsightLoaded) {
                final insight = state.boostInsight;
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: CachedNetworkImage(
                            imageUrl: insight.photoUrlForAds,
                            height: 207,
                            width: 135,
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                                Center(child: loadingIndicator()),
                            errorWidget: (context, url, error) => Icon(
                                Icons.image_not_supported,
                                size: 50,
                                color: Colors.grey),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: Text(
                          '@${widget.userName}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Center(
                        child: Text(
                          'Duration (days): ${insight.duration}',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.grey,
                          ),
                        ),
                      ),
                      Divider(color: AppColors.grey.withValues(alpha: 0.5)),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Overview',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryDark,
                              ),
                            ),
                            SizedBox(height: 15),
                            _buildInfoRow('Caption:', insight.caption),
                            _buildInfoRow(
                                'Target Country:', insight.targetCountry),
                            _buildInfoRow('Target City:', insight.targetCity),
                            _buildInfoRow(
                                'Target Gender:', insight.targetGender),
                            _buildInfoRow('Age Range:',
                                '${insight.minAge} - ${insight.maxAge}'),
                            _buildInfoRow('Target Users:',
                                insight.targetUsersNumber.toString()),
                            _buildInfoRow('Users Reached:',
                                insight.targetUsersReached.toString()),
                            _buildInfoRow(
                                'Ad Cost:', insight.adsCost.toString()),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
              return Center(
                child: Text(
                  'No Boost Available',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryDark,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.grey,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.grayscale,
            ),
          ),
        ],
      ),
    );
  }
}
