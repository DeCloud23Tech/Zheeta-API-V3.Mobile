import 'package:flutter/material.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/wallet/data/model/transaction_model.dart';
import 'package:zheeta/wallet/presentation/widgets/transactions_listview.dart';

import '../views/wallet_transactions_screen.dart';

class RecentTransactionsWidget extends StatelessWidget {
  final List<TransactionModel> transactions;

  const RecentTransactionsWidget({Key? key, required this.transactions}) : super(key: key);

  Widget buildButton({required String text, required IconData icon}) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryDark,
        textStyle: TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Transactions',
                style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => TransactionListPage(),
                  //   ),
                  // );
                },
                child: Text(
                  'View all',
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                  color: AppColors.secondaryLight,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Text(
                  'Earning History',
                  style: TextStyle(
                    color: AppColors.primaryDark,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Row(
                  children: [
                    buildButton(
                      text: 'Prev',
                      icon: Icons.arrow_circle_left_rounded,
                    ),
                    Spacer(),
                    buildButton(
                      text: 'Next',
                      icon: Icons.arrow_circle_right_rounded,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 4),
          height: MediaQuery.of(context).size.height * 0.6, // Adjust this value as needed
          child: TransactionListView(
            transactions: transactions,
          ),
        ),
      ],
    );
  }
}


