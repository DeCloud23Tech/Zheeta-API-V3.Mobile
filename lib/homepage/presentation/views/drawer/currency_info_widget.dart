import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/payment_and_subscriptions/presentation/bloc/charges/charges_cubit.dart';
import 'package:zheeta/profile/presentation/bloc/profile_cubit/profile_cubit.dart';
import 'package:zheeta/wallet/presentation/bloc/withdrawal/withdrawal_cubit.dart';

import '../../../../app/router/app_router.gr.dart';

Widget buildCurrencyInfo() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Zheeta Coin Rate in my local Currency",
          style: TextStyle(
            color: AppColors.darkText,
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.secondaryLight,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Placeholder(),
          //Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       RichText(
        //         text: TextSpan(
        //           children: [
        //             const TextSpan(
        //               text: "1 ",
        //               style: TextStyle(
        //                 color: AppColors.darkText,
        //                 fontSize: 16,
        //                 fontWeight: FontWeight.w700,
        //               ),
        //             ),
        //             WidgetSpan(
        //               alignment: PlaceholderAlignment.top,
        //               child: SvgPicture.asset(
        //                 "assets/images/icons/zheeta-coin-bold.svg",
        //                 height: 13, // Adjust height as needed
        //               ),
        //             ),
        //             const TextSpan(
        //               text: " (1 USD)",
        //               style: TextStyle(
        //                 color: AppColors.darkText,
        //                 fontSize: 16,
        //                 fontWeight: FontWeight.w700,
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //       Text(
        //         "=",
        //         style: TextStyle(
        //           color: AppColors.darkText,
        //           fontSize: 16,
        //           fontWeight: FontWeight.w700,
        //         ),
        //       ),
        //       Container(
        //         padding: EdgeInsets.all(5),
        //         decoration: BoxDecoration(
        //           color: AppColors.primaryDark,
        //           borderRadius: BorderRadius.circular(4),
        //         ),
        //         child: BlocBuilder<ProfileCubit, ProfileState>(
        //           builder: (context, state) {
        //             if (state is ProfileCompositeState) {
        //               final data = state.userProfile!.data;
        //               final countryName = data?.residentialAddress!.country;
        //               // Fetch rate by country
        //               context
        //                   .read<WithdrawalCubit>()
        //                   .getRateByCountryCubit(countryName);
        //
        //               return BlocBuilder<WithdrawalCubit, WithdrawalState>(
        //                 builder: (context, state) {
        //                   if (state is WithdrawalRate) {
        //                     // Access the fetched rate for the country
        //                     final rate = state.rate;
        //
        //                     return Text(
        //                       '$countryName (${rate.toString()}0)',
        //                       style: TextStyle(
        //                         color: AppColors.white,
        //                         fontSize: 16,
        //                         fontWeight: FontWeight.w700,
        //                       ),
        //                     );
        //                   } else {
        //                     return Text(
        //                       "0.00",
        //                       style: TextStyle(
        //                         color: AppColors.white,
        //                         fontSize: 16,
        //                         fontWeight: FontWeight.w700,
        //                       ),
        //                     );
        //                   }
        //                 },
        //               );
        //             } else {
        //               return SizedBox.shrink();
        //             }
        //           },
        //         ),
        //       ),
        //     ],
        //   ),
        ),
      ],
    ),
  );
}
