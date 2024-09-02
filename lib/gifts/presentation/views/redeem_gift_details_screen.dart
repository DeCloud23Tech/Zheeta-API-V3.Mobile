import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/widgets/primary_button.dart';
import 'package:zheeta/widgets/reusable_container.dart';
import '../../../app/router/app_router.gr.dart';
import '../../../widgets/text_row.dart';
import '../bloc/gift/gift_cubit.dart'; // Adjust the import according to your project structure

@RoutePage()
class RedeemGiftDetailScreen extends StatelessWidget {
  final double totalAmount;
  final String giftId;

  const RedeemGiftDetailScreen(
      {super.key, required this.totalAmount, required this.giftId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryLight,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () => context.router.pop(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(5),
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Icon(Icons.arrow_back_ios_new, color: AppColors.grey),
            ),
          ),
        ),
        title: Text(
          'Transaction Details',
          style: TextStyle(
            color: AppColors.grayscale,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      // body: SafeArea(
      //   child: BlocListener<GiftCubit, GiftState>(
      //     listener: (context, state) {
      //       if (state is GiftRedeemed) {
      //         context.router.push(RedeemGiftSuccessRoute());
      //       } else if (state is GiftsError) {
      //         ScaffoldMessenger.of(context).showSnackBar(
      //           SnackBar(content: Text(state.errorMessage)),
      //         );
      //       }
      //     },
      //     child: Padding(
      //       padding:
      //           const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      //       child: Column(
      //         children: [
      //           ReusableCustomContainer(
      //             child: Column(
      //               children: [
      //                 TextRow(
      //                   leftText: 'Amount of money:',
      //                   rightText: 'N${totalAmount}0',
      //                 ),
      //                 TextRow(
      //                   leftText: 'Transaction fee:',
      //                   rightText: 'Free',
      //                 ),
      //                 TextRow(
      //                   leftText: 'Total:',
      //                   rightText: 'N${totalAmount}0',
      //                 ),
      //               ],
      //             ),
      //           ),
      //           SizedBox(height: 20),
      //           PrimaryButton(
      //             title: 'Confirm',
      //             action: () {
      //               final giftCubit = context.read<GiftCubit>();
      //               giftCubit.redeemGiftCubit(giftId);
      //             },
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
