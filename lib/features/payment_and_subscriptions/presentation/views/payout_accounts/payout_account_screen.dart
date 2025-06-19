import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/common/constants/color.dart';
import 'package:zheeta/common/notify/notify_user.dart';
import 'package:zheeta/core/injection/di.dart';
import 'package:zheeta/features/payment_and_subscriptions/presentation/bloc/payout/payout_cubit.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/loader.dart';
import 'package:zheeta/widgets/reusable_bottom_sheet.dart';

@RoutePage()
class PayoutAccountScreen extends StatelessWidget {
  const PayoutAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PayoutCubit payoutCubit = locator<PayoutCubit>();
    payoutCubit.fetchAllAccounts();
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryLight,
        elevation: 0.0,
        leading: AppBackButton(),
        title: Text(
          'Payout Accounts',
          style: TextStyle(
            color: AppColors.grayscale,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<PayoutCubit, PayoutState>(
        listener: (context, state) {
          if (state is PayoutSuccess) {
            NotifyUser.showSnackBar(state.message);
          } else if (state is PayoutError) {
            NotifyUser.showSnackBar(state.message);
          }
        },
        builder: (context, state) {
          if (state is PayoutLoading) {
            return loadingIndicator();
          } else if (state is PayoutAccountsLoaded) {
            final accounts = state.accounts;

            if (accounts.isEmpty) {
              return Center(
                child: Text(
                  'No payout accounts found.',
                  style: TextStyle(color: AppColors.primaryDark),
                ),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              itemCount: accounts.length,
              itemBuilder: (context, index) {
                final account = accounts[index];
                return Card(
                  color: AppColors.white,
                  margin: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                account.bankName ?? '',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Wrap(
                                spacing: 8,
                                runSpacing: 4,
                                children: [
                                  Text(
                                    account.accountNumber ?? '',
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    '${account.lastName} ${account.firstName}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showCustomModalBottomSheet(
                              context: context,
                              titles: ['Delete'],
                              icons: ['assets/images/icons/delete.svg'],
                              actions: [
                                () async =>
                                    await payoutCubit.deleteAccount(account.id),
                              ],
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: const Icon(
                              Icons.more_horiz,
                              size: 28,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (state is PayoutError) {
            return Center(
              child: Text(
                'Error loading payout accounts.',
                style: TextStyle(
                  color: AppColors.grayscale,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }

          return Center(
            child: Text(
              'No data available.',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        },
      ),
    );
  }
}
