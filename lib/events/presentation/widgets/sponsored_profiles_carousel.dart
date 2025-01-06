import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/events/presentation/bloc/sponsored_boost_cubit/sponsored_boost_cubit.dart';

class SponsoredProfilesCarousel extends StatelessWidget {
  const SponsoredProfilesCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    const textStyle = TextStyle(
      color: AppColors.white,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    );

    return BlocBuilder<SponsoredBoostCubit, SponsoredBoostState>(
      builder: (context, state) {
        if (state is SponsoredBoostLoadedState) {
          return state.boosts.data.isNotEmpty
              ? Container(
                  color: AppColors.primaryLightBackground,
                  width: screenWidth,
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Sponsored Profiles",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: screenWidth,
                        height: screenWidth * 0.74,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.boosts.data.length,
                          itemBuilder: (context, index) {
                            var boostItem = state.boosts.data[index];
                            return GestureDetector(
                              onTap: () {
                                context.router.push(
                                    ProfileBoostViewRoute(profile: boostItem, profiles: state.boosts.data));
                              },
                              child: Container(
                                width: screenWidth * 0.65,
                                margin: const EdgeInsets.only(right: 15),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryDark,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 20,
                                          width: 20,
                                          padding: const EdgeInsets.all(1),
                                          decoration: BoxDecoration(
                                            color: AppColors.white,
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            child: Image.asset(
                                              "assets/images/User.png",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Expanded(
                                          child: Text(
                                            boostItem.fullName,
                                            style: const TextStyle(
                                              color: AppColors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                     Text(
                                      boostItem.caption ?? '',
                                      style: textStyle,
                                    ),
                                    const SizedBox(height: 10),
                                    // Post Image
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          boostItem.profileUrlForAds,
                                          fit: BoxFit.cover,
                                          width: screenWidth * 0.65,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      // const SizedBox(height: 10),
                      // // Add dot indicator here if needed
                      // // Example placeholder
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: List.generate(
                      //     6,
                      //         (index) => Container(
                      //       margin: const EdgeInsets.symmetric(horizontal: 2),
                      //       width: 8,
                      //       height: 8,
                      //       decoration: BoxDecoration(
                      //         color: index == 0 ? AppColors.primaryDark : AppColors.white,
                      //         shape: BoxShape.circle,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                )
              : const SizedBox.shrink();
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
