import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../app/common/color.dart';

class Transaction {
  final String iconPath;
  final String title;
  final String description;
  final double amount;
  final String date;
  final String status;

  Transaction({
    required this.iconPath,
    required this.title,
    required this.description,
    required this.amount,
    required this.date,
    required this.status,
  });
}

class TransactionListView extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionListView({required this.transactions});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        Transaction transaction = transactions[index];
        return ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 8),
          leading: SvgPicture.asset(
            transaction.iconPath,
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
                transaction.description,
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
                '\$${transaction.amount.toStringAsFixed(2)}',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: transaction.status == 'incoming'
                        ? AppColors.greenAccent
                        : AppColors.orange),
              ),
              Text(
                transaction.date,
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
