import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/utils/extensions/double_extension.dart';
import 'package:zheeta/features/wallet_and_transactions/presentation/widgets/linear_progress_indicator.dart';

import 'bullet_point_text.dart';

class BalanceCard extends StatelessWidget {
  final double balance;
  final String silverCount;
  final String goldCount;
  final List<double> progressValues;
  final List<Color> progressColors;

  const BalanceCard({
    super.key,
    required this.balance,
    required this.progressValues,
    required this.progressColors,
    required this.silverCount,
    required this.goldCount,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 248,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Background Container
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                height: 248,
                decoration: BoxDecoration(
                  color: AppColors.secondaryLight,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      spreadRadius: 0,
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: BulletPointRow(
                        text: 'Silver Downlines',
                        value: silverCount,
                        iconColor: AppColors.orange,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Bottom Right Container
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 248,
                decoration: BoxDecoration(
                  color: AppColors.primaryLightBackground,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: BulletPointRow(
                        text: 'Gold Downlines',
                        value: goldCount,
                        iconColor: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Top Container with Balance and Progress
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColors.secondaryLight,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      spreadRadius: 0,
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// About Zheeta Credit (with info icon)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: const Text("About Zheeta Credit"),
                                  content: const Text(
                                    "Zheeta credit is intended solely for use within "
                                    "physical events organized through our app as part "
                                    "of the Buddy Event feature. It cannot be used for "
                                    "digital purchases or services outside of this context.",
                                  ),
                                ),
                              );
                            },
                            child: Icon(
                              Icons.info_outline,
                              size: 16,
                              color: AppColors.grayscale,
                            ),
                          ),
                          const SizedBox(width: 6),
                          const Text(
                            'About Zheeta Credit',
                            style: TextStyle(
                              color: AppColors.grayscale,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4.0),
                                  child: SvgPicture.asset(
                                    "assets/images/icons/zheeta-coin.svg",
                                  ),
                                ),
                              ),
                              TextSpan(
                                text: balance.toFormattedCurrency(),
                                style: TextStyle(
                                  color: AppColors.grayscale,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Available balance',
                          style: TextStyle(
                            color: AppColors.grayscale,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      LinearProgressTracking(
                        values: progressValues,
                        colors: progressColors,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Your Affiliate Earning Strength',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
