import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:zheeta/common/constants/color.dart';
import 'package:zheeta/features/wallet_and_transactions/data/model/transaction_model.dart';

class TransactionListView extends StatelessWidget {
  final List<TransactionModel> transactions;

  const TransactionListView({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        TransactionModel transaction = transactions[index];
        return ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 8),
          leading: SvgPicture.asset(
            'assets/images/icons/Group 1016.svg',
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.title,
                style: TextStyle(
                    fontSize: 14.5,
                    color: AppColors.white,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                '@${transaction.fromUsername}',
                style: TextStyle(
                    fontSize: 13,
                    color: AppColors.grey,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${transaction.transactionType == 'Credit' ? '+' : '-'}\$${transaction.amount.toStringAsFixed(2)}',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: transaction.transactionType == 'Credit'
                        ? AppColors.greenAccent
                        : AppColors.orange),
              ),
              Text(
                DateFormat('MMM d')
                    .format(DateTime.parse(transaction.createdDate.toString())),
                style: TextStyle(
                    fontSize: 13,
                    color: AppColors.grey,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        );
      },
    );
  }
}
