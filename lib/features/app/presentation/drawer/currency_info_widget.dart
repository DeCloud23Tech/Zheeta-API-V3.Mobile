import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/features/wallet_and_transactions/presentation/cubits/withdrawal_cubit/withdrawal_cubit.dart';

Widget buildCurrencyInfo(String countryName) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Zheeta Credit Rate in my local Currency",
          style: TextStyle(
            color: AppColors.darkText,
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.secondaryLight,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "1 ",
                      style: TextStyle(
                        color: AppColors.darkText,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.top,
                      child: SvgPicture.asset(
                        "assets/images/icons/zheeta-coin-bold.svg",
                        height: 13, // Adjust height as needed
                      ),
                    ),
                    const TextSpan(
                      text: " (1 USD)",
                      style: TextStyle(
                        color: AppColors.darkText,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                "=",
                style: TextStyle(
                  color: AppColors.darkText,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: AppColors.primaryDark,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: BlocBuilder<WithdrawalCubit, WithdrawalState>(
                  builder: (context, state) {
                    if (state is WithdrawalRateLoaded) {
                      return Text(
                        "$countryName (${state.currentRate?.toStringAsFixed(2)})",
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      );
                    }
                    return const Text(
                      "0.00",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
