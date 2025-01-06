import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/gifts/presentation/bloc/gift/gift_cubit.dart';
import 'package:zheeta/gifts/presentation/views/user_gifts/redeem_gift_sucess_screen.dart';
import 'package:zheeta/widgets/loader.dart';
import 'package:zheeta/widgets/primary_button.dart';
import 'package:zheeta/widgets/reusable_container.dart';
import 'package:zheeta/widgets/text_row.dart';

@RoutePage()
class RedeemGiftDetailScreen extends StatelessWidget {
  final double totalAmount;
  final String giftId;

  const RedeemGiftDetailScreen(
      {super.key, required this.totalAmount, required this.giftId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GiftCubit, GiftState>(
      builder: (context, state) {
        if (state.status == GiftsStatus.loading) {
          return Scaffold(body: LoadingIndicator());
        } else if (state.status == GiftsStatus.redeemedGift) {
          return RedeemGiftSuccessScreen();
        } else {
          GiftCubit giftsCubit = locator<GiftCubit>();
          return Scaffold(
            backgroundColor: AppColors.secondaryLight,
            appBar: AppBar(
              backgroundColor: AppColors.secondaryLight,
              elevation: 0.0,
              leading: GestureDetector(
                onTap: () => context.router.back(),
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
                    child:
                        Icon(Icons.arrow_back_ios_new, color: AppColors.grey),
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
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
              child: Column(
                children: [
                  ReusableCustomContainer(
                    child: Column(
                      children: [
                        TextRow(
                          leftText: 'Amount of money:',
                          rightText: '${totalAmount}0',
                        ),
                        TextRow(
                          leftText: 'Transaction fee:',
                          rightText: 'Free',
                        ),
                        TextRow(
                          leftText: 'Total:',
                          rightText: '${totalAmount}0',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  PrimaryButton(
                    title: 'Confirm',
                    state: state.status == GiftsStatus.loading,
                    action: () {
                      giftsCubit.redeemGiftCubit(giftId);
                    },
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
