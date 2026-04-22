import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/constants/utility.dart';
import 'package:zheeta/core/utils/extensions/string_extension.dart';
import 'package:zheeta/features/wallet_and_transactions/data/models/transaction_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransactionListView extends StatelessWidget {
  final List<TransactionModel> transactions;

  const TransactionListView({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: transactions.length,
      separatorBuilder: (_, __) => const Divider(
        // color: AppColors.grayscale,
        color: Colors.transparent,
        height: 1,
      ),
      itemBuilder: (context, index) {
        final transaction = transactions[index];
        final isCredit = transaction.transactionType == 'Credit';
        final amountColor = isCredit ? AppColors.greenAccent : AppColors.orange;
        final statusColor = Utility.getStatus(transaction.status);
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Row(
            children: [
              // Icon
              Center(
                child: SvgPicture.asset(
                  'assets/images/icons/Group 1016.svg',
                ),
              ),

              const SizedBox(width: 12),

              // Transaction info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.title.capitalizeFirstOfEach,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Text(
                          '@${transaction.fromUsername}',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade400,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(transaction.status.toUpperCase(),
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: statusColor)),
                        )
                      ],
                    ),
                  ],
                ),
              ),

              // Amount and date
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${isCredit ? '+' : '-'}\$${transaction.amount.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: amountColor,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    DateFormat('MMM d').format(
                      DateTime.parse(transaction.createdDate.toString()),
                    ),
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

// class TransactionListView extends StatelessWidget {
//   final List<TransactionModel> transactions;
//
//   const TransactionListView({super.key, required this.transactions});
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       physics: NeverScrollableScrollPhysics(),
//       itemCount: transactions.length,
//       itemBuilder: (context, index) {
//         TransactionModel transaction = transactions[index];
//         return ListTile(
//           contentPadding: EdgeInsets.symmetric(vertical: 8),
//           leading: SvgPicture.asset(
//             'assets/images/icons/Group 1016.svg',
//           ),
//           title: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 transaction.title,
//                 style: TextStyle(
//                     fontSize: 14.5,
//                     color: AppColors.white,
//                     fontWeight: FontWeight.w600),
//               ),
//               Text(
//                 '@${transaction.fromUsername}',
//                 style: TextStyle(
//                     fontSize: 13,
//                     color: AppColors.grey,
//                     fontWeight: FontWeight.w500),
//               ),
//             ],
//           ),
//           trailing: Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Text(
//                 '${transaction.transactionType == 'Credit' ? '+' : '-'}\$${transaction.amount.toStringAsFixed(2)}',
//                 style: TextStyle(
//                     fontWeight: FontWeight.w600,
//                     fontSize: 16,
//                     color: transaction.transactionType == 'Credit'
//                         ? AppColors.greenAccent
//                         : AppColors.orange),
//               ),
//               Text(
//                 DateFormat('MMM d')
//                     .format(DateTime.parse(transaction.createdDate.toString())),
//                 style: TextStyle(
//                     fontSize: 13,
//                     color: AppColors.grey,
//                     fontWeight: FontWeight.w500),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
