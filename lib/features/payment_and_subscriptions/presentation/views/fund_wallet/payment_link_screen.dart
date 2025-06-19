import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zheeta/common/constants/color.dart';
import 'package:zheeta/common/extensions/string_extension.dart';
import 'package:zheeta/common/notify/notify_user.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/model/generate_payment_link_model.dart';
import 'package:zheeta/utils/format_utils.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/primary_button.dart';

class PaymentLinkScreen extends StatelessWidget {
  final GeneratePaymentLinkData? paymentLinkData;

  const PaymentLinkScreen({super.key, required this.paymentLinkData});

  @override
  Widget build(BuildContext context) {
    final paymentLink =
        paymentLinkData?.paymentGenerationData.paymentLink ?? '';
    final currency =
        paymentLinkData?.paymentGenerationData.currencyToPay ?? 'N/A';
    final amount =
        paymentLinkData?.paymentGenerationData.amountToPay.toString() ?? '0';
    final zheetaCoins = paymentLinkData
            ?.paymentGenerationData.amountOfZheetaCoins
            .toStringAsFixed(2) ??
        '0.00';

    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryLight,
        elevation: 0.0,
        leading: AppBackButton(),
        title: const Text(
          'Payment Details',
          style: TextStyle(
            color: AppColors.grayscale,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        // Wrap with SingleChildScrollView
        padding: const EdgeInsets.all(16.0),
        child: Center(
          // Center the content
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Use a Card for a cleaner look
              Card(
                color: AppColors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoRow('Currency:', currency),
                      _buildInfoRow(
                          'Amount to Pay:', formatCurrency(amount.toDouble)),
                      _buildInfoRow('Zheeta Coins:',
                          formatCurrency(zheetaCoins.toDouble)),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),
              const Text(
                'Payment Link:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // Make the link look more like a button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      if (await canLaunchUrl(Uri.parse(paymentLink))) {
                        await launchUrl(Uri.parse(paymentLink),
                            mode: LaunchMode.externalApplication);
                      } else {
                        NotifyUser.showSnackBar('Could not open the link');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryDark,
                      foregroundColor: AppColors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text('Open Payment Link'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: paymentLink));
                      NotifyUser.showSnackBar('Link copied to clipboard');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.white,
                      foregroundColor: AppColors.primaryDark,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text('Copy Link'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    final isZheetaCoins = label.contains('Zheeta Coins');
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              '$label ',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 2,
            child: RichText(
              text: TextSpan(
                children: isZheetaCoins
                    ? [
                  WidgetSpan(
                    alignment: PlaceholderAlignment.top,
                    child: SvgPicture.asset(
                      "assets/images/icons/zheeta-coin.svg",
                      height: 13,
                    ),
                  ),
                  TextSpan(
                    text: ' $value',
                    style: TextStyle(
                      color: AppColors.darkText,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ]
                    : [
                  TextSpan(
                    text: value,
                    style: TextStyle(
                      color: AppColors.darkText,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
