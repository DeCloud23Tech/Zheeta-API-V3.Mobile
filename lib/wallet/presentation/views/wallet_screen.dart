import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/wallet/presentation/views/wallet_transactions_screen.dart';

import '../../../../../../app/common/enums/others.dart';
import '../../../../../../app/router/app_router.dart';
import '../../../../../../widgets/top_nav.dart';
import '../widgets/bullet_point_text.dart';
import '../widgets/custom_wallet_button.dart';
import '../widgets/linear_progress_indicator.dart';
import '../widgets/transactions_listview.dart';


@RoutePage()
class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryDark,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: GestureDetector(
            onTap: () => router.pop(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  padding: EdgeInsets.all(5),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(100)),
                  child: Icon(Icons.arrow_back_ios_new, color: AppColors.grey)),
            ),
          ),
        ),
        leadingWidth: 75,
        title: Text(
          'Wallet',
          style: TextStyle(
              color: AppColors.white,
              fontSize: 24,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Row(
              children: [
                TopNavBtn(iconType: IconType.menu),
                TopNavBtn(iconType: IconType.bell),
              ],
            ),
          )
        ],
      ),
      backgroundColor: AppColors.primaryDark,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  height: 248,
                  width: double.infinity,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
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
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 0,
                                blurRadius: 10,
                                offset:
                                    Offset(0, 2), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              BulletPointRow(
                                text: 'Silver Downlines',
                                value: '300',
                                iconColor: AppColors.orange,
                              ),
                              SizedBox(height: 27),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        // left: 160,
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: 145,
                          decoration: BoxDecoration(
                            color: AppColors.primaryDark,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 40),
                              BulletPointRow(
                                text: 'Gold Downlines',
                                value: '10',
                                iconColor: AppColors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        left: 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 157,
                          decoration: BoxDecoration(
                            color: AppColors.secondaryLight,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 0,
                                blurRadius: 10,
                                offset:
                                    Offset(0, 2), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        WidgetSpan(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 4.0),
                                            child: SvgPicture.asset(
                                              "assets/images/icons/zheeta-coin.svg",
                                            ),
                                          ),
                                        ),
                                        TextSpan(
                                          text: '21,500.',
                                          style: TextStyle(
                                            color: AppColors.grayscale,
                                            fontSize: 32,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '00',
                                          style: TextStyle(
                                            color: AppColors.grayscale,
                                            fontSize: 24,
                                            fontWeight: FontWeight.w500,
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
                                SizedBox(height: 20),
                                LinearProgressTracking(
                                  values: [0.6, 0.5],
                                  colors: [
                                    AppColors.greenAccent,
                                    AppColors.orange
                                  ],
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Your Affiliate Earning Strenght',
                                  style: TextStyle(
                                    color: AppColors.grayscale,
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
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomIconButton(
                    iconPath: 'assets/images/icons/wallet-outgoing.svg',
                    text: 'Add Funds',
                    onPressed: () {},
                  ),
                  CustomIconButton(
                    iconPath: 'assets/images/icons/wallet-outgoing.svg',
                    text: 'Send Coins',
                    onPressed: () {},
                  ),
                  CustomIconButton(
                    iconPath: 'assets/images/icons/wallet-incoming.svg',
                    text: 'Withdraw\nto bank',
                    onPressed: () {},
                  )
                ],
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recent Transactions',
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TransactionListPage(),
                          ),
                        );
                      },
                      child: Text(
                        'View all',
                        style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      decoration: BoxDecoration(
                        color: AppColors.secondaryLight,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
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
                    SizedBox(width: 4),
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
              )
,
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4),
                height: MediaQuery.of(context).size.height *
                    0.6, // Adjust this value as needed
                child: TransactionListView(
                  transactions: [
                    Transaction(
                      iconPath: 'assets/images/icons/af-payment.svg',
                      title: 'Monthly AFFILIATE PAY',
                      description: 'Withdraw to bank',
                      amount: 150.0,
                      date: 'Nov 01',
                      status: 'incoming',
                    ),
                    Transaction(
                      iconPath: 'assets/images/icons/subscriptions.svg',
                      title: 'Monthly AFFILIATE PAY',
                      description: 'Withdraw to bank',
                      amount: 150.0,
                      date: 'Nov 01',
                      status: 'incoming',
                    ),
                    Transaction(
                      iconPath: 'assets/images/icons/payment.svg',
                      title: 'Monthly AFFILIATE PAY',
                      description: 'Withdraw to bank',
                      amount: 150.0,
                      date: 'Nov 01',
                      status: 'outgoing',
                    ),
                    Transaction(
                      iconPath: 'assets/images/icons/subscriptions.svg',
                      title: 'Monthly AFFILIATE PAY',
                      description: 'Withdraw to bank',
                      amount: 150.0,
                      date: 'Nov 01',
                      status: 'incoming',
                    ),
                    Transaction(
                      iconPath: 'assets/images/icons/gift.svg',
                      title: 'Monthly AFFILIATE PAY',
                      description: 'Withdraw to bank',
                      amount: 150.0,
                      date: 'Nov 01',
                      status: 'outgoing',
                    ),
                    Transaction(
                      iconPath: 'assets/images/icons/gift.svg',
                      title: 'Monthly AFFILIATE PAY',
                      description: 'Withdraw to bank',
                      amount: 150.0,
                      date: 'Nov 01',
                      status: 'outgoing',
                    ),
                    Transaction(
                      iconPath: 'assets/images/icons/subscriptions.svg',
                      title: 'Monthly AFFILIATE PAY',
                      description: 'Withdraw to bank',
                      amount: 150.0,
                      date: 'Nov 01',
                      status: 'incoming',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
