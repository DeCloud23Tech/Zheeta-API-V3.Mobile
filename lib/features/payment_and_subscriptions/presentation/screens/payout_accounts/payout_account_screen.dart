import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/utils/notify.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/models/payment_account_model.dart';
import 'package:zheeta/features/payment_and_subscriptions/presentation/cubits/payout_cubit/payout_cubit.dart';
import 'package:zheeta/router/app_router.gr.dart';
import 'package:zheeta/shared/bottom_sheets/reusable_bottom_sheet.dart';
import 'package:zheeta/shared/widgets/back_button.dart';
import 'package:zheeta/shared/widgets/loader.dart';
import 'package:zheeta/shared/widgets/primary_button.dart';

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
        leading: const AppBackButton(
          iconColor: AppColors.black,
        ),
        title: const Text(
          'Payout Accounts',
          style: TextStyle(
            color: AppColors.grayscale,
            fontSize: 22,
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

            return SafeArea(
              top: false,
              child: Column(
                children: [
                  Expanded(
                    child: accounts.isEmpty
                        ? const Center(
                            child: Text(
                              'No payout accounts found.',
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.fromLTRB(8, 14, 8, 12),
                            itemCount: accounts.length,
                            itemBuilder: (context, index) {
                              final account = accounts[index];
                              return _PayoutAccountCard(
                                account: account,
                                onMoreTap: () {
                                  showCustomModalBottomSheet(
                                    context: context,
                                    titles: ['Edit', 'Delete'],
                                    icons: [
                                      'assets/images/icons/manage.svg',
                                      'assets/images/icons/delete.svg',
                                    ],
                                    actions: [
                                      () {
                                        NotifyUser.showSnackBar(
                                          'Edit payout account is not available yet',
                                        );
                                      },
                                      () async =>
                                          await payoutCubit.deleteAccount(
                                        account.id,
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 8, 10, 24),
                    child: PrimaryButton(
                      title: 'Add new Account',
                      action: () {
                        context.router.push(const PayoutCreateAccount());
                      },
                      height: 56,
                      borderRadius: 12,
                    ),
                  ),
                ],
              ),
            );
          } else if (state is PayoutError) {
            return SafeArea(
              top: false,
              child: Column(
                children: [
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Error loading payout accounts.',
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 8, 10, 24),
                    child: PrimaryButton(
                      title: 'Add new Account',
                      action: () {
                        context.router.push(const PayoutCreateAccount());
                      },
                      height: 56,
                      borderRadius: 12,
                    ),
                  ),
                ],
              ),
            );
          }

          return SafeArea(
            top: false,
            child: Column(
              children: [
                const Expanded(
                  child: Center(
                    child: Text(
                      'No data available.',
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 8, 10, 24),
                  child: PrimaryButton(
                    title: 'Add new Account',
                    action: () {
                      context.router.push(const PayoutCreateAccount());
                    },
                    height: 56,
                    borderRadius: 12,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _PayoutAccountCard extends StatelessWidget {
  final PaymentAccount account;
  final VoidCallback onMoreTap;

  const _PayoutAccountCard({
    required this.account,
    required this.onMoreTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
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
          GestureDetector(
            onTap: onMoreTap,
            child: const Padding(
              padding: EdgeInsets.only(left: 12, top: 4),
              child: Icon(
                Icons.more_horiz,
                size: 24,
                color: AppColors.grayscale,
              ),
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
