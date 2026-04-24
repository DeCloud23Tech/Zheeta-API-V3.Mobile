import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/utils/extensions/double_extension.dart';
import 'package:zheeta/features/wallet_and_transactions/presentation/widgets/linear_progress_indicator.dart';

class BalanceCard extends StatelessWidget {
  final double balance;
  // final String silverCount;
  // final String goldCount;
  final List<double> progressValues;
  final List<Color> progressColors;

  const BalanceCard({
    super.key,
    required this.balance,
    required this.progressValues,
    required this.progressColors,
    // required this.silverCount,
    // required this.goldCount,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
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
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: const Text('About Zheeta Credit'),
                          content: const Text(
                            'Zheeta credit is intended solely for use within '
                            'physical events organized through our app as part '
                            'of the Buddy Event feature. It cannot be used for '
                            'digital purchases or services outside of this context.',
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
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: SvgPicture.asset(
                            'assets/images/icons/zheeta-coin.svg',
                          ),
                        ),
                      ),
                      TextSpan(
                        text: balance.toFormattedCurrency(),
                        style: const TextStyle(
                          color: AppColors.grayscale,
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Center(
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
    );
  }
}
