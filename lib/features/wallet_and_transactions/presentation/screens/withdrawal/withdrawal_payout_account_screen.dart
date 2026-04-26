import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/utils/notify.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/models/payment_account_model.dart';
import 'package:zheeta/features/payment_and_subscriptions/presentation/cubits/payout_cubit/payout_cubit.dart';
import 'package:zheeta/features/wallet_and_transactions/presentation/widgets/create_payout_account_prompt.dart';
import 'package:zheeta/router/app_router.gr.dart';
import 'package:zheeta/shared/widgets/back_button.dart';
import 'package:zheeta/shared/widgets/loader.dart';

@RoutePage()
class WithdrawalPayoutAccountScreen extends StatelessWidget {
  const WithdrawalPayoutAccountScreen({super.key});

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
          'Existing Payout Accounts',
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

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    itemCount: accounts.length,
                    itemBuilder: (context, index) {
                      final account = accounts[index];
                      return InkWell(
                        onTap: () {
                          context.router.push(
                            WithdrawalRoute(
                              account: account.id,
                              accountNumber: account.accountNumber ?? '',
                            ),
                          );
                        },
                        child: _WithdrawalPayoutAccountCard(account: account),
                      );
                    },
                  ),
                ),
                CreateAccountPrompt(
                  onClick: () {
                    context.router.push(const PayoutCreateAccount());
                  },
                ),
                SizedBox(height: 30),
              ],
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

class _WithdrawalPayoutAccountCard extends StatelessWidget {
  final PaymentAccount account;

  const _WithdrawalPayoutAccountCard({required this.account});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    Text(
                      _displayName(account),
                      style: const TextStyle(
                        color: AppColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF4F5F8),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Text(
                        _accountType(account),
                        style: const TextStyle(
                          color: AppColors.black,
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  _detailsLine(account),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 12, top: 6),
            child: Icon(
              Icons.keyboard_arrow_right,
              size: 24,
              color: AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }

  String _displayName(PaymentAccount account) {
    return account.bankName ??
        account.cryptoCoinName ??
        _accountType(account);
  }

  String _accountType(PaymentAccount account) {
    final value = account.payOutType.trim();
    if (value.isEmpty) return 'Account';
    final spaced = value
        .replaceAllMapped(RegExp(r'([a-z])([A-Z])'), (m) => '${m[1]} ${m[2]}')
        .replaceAll('-', ' ')
        .trim();
    if (spaced.isEmpty) return 'Account';
    return spaced[0].toUpperCase() + spaced.substring(1).toLowerCase();
  }

  String _detailsLine(PaymentAccount account) {
    final primaryValue = account.accountNumber ??
        account.mobileMoneyAccount ??
        account.paypalAddress ??
        account.cryptoCoinAddress ??
        '';
    final name = '${account.firstName} ${account.lastName}'.trim();
    if (primaryValue.isEmpty) return name;
    if (name.isEmpty) return primaryValue;
    return '$primaryValue   $name';
  }
}
