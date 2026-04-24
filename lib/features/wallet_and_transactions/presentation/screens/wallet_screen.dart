import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/utils/notify.dart';
import 'package:zheeta/core/utils/pagination_controller.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/app/presentation/widgets/general_footer_nav.dart';
import 'package:zheeta/features/wallet_and_transactions/data/models/transaction_model.dart';
import 'package:zheeta/features/wallet_and_transactions/presentation/cubits/transactions_cubit/transactions_cubit.dart';
import 'package:zheeta/features/wallet_and_transactions/presentation/cubits/wallet_cubit/wallet_cubit.dart';
import 'package:zheeta/features/wallet_and_transactions/presentation/widgets/balance_card.dart';
import 'package:zheeta/features/wallet_and_transactions/presentation/widgets/custom_wallet_button.dart';
import 'package:zheeta/features/wallet_and_transactions/presentation/widgets/transactions_listview.dart';
import 'package:zheeta/router/app_router.gr.dart';
import 'package:zheeta/shared/enums/icon_type_enum.dart';
import 'package:zheeta/shared/widgets/back_button.dart';
import 'package:zheeta/shared/widgets/drawer.dart';
import 'package:zheeta/shared/widgets/top_nav.dart';

@RoutePage()
class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final TransactionsCubit transactionsCubit = locator<TransactionsCubit>();
  final WalletCubit walletCubit = locator<WalletCubit>();

  @override
  void initState() {
    super.initState();
    walletCubit.fetchWalletCounters();

    // Initialize transactions cubit after getting user ID
    transactionsCubit.initWithUserId();
  }

  // Progress is currently design-driven rather than counter-driven.
  static const List<double> _walletProgressValues = [0.38, 0.22];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: const SideDrawer(),
      backgroundColor: AppColors.primaryDark,
      extendBody: true,
      bottomNavigationBar: buildGeneralFooterNav(context),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: RefreshIndicator(
          onRefresh: () async {
            await walletCubit.fetchWalletCounters();
            await transactionsCubit.refreshTransactions();
          },
          child: ListView(
            children: [
              _buildWalletBalance(),
              const SizedBox(height: 20),
              _buildWalletActions(),
              const SizedBox(height: 25),
              _buildTransactionSection(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() => AppBar(
        backgroundColor: AppColors.primaryDark,
        elevation: 0.0,
        leading: const AppBackButton(),
        title: const Text(
          'Wallet',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Row(
              children: [
                TopNavBtn(
                  iconType: IconType.menu,
                  color: AppColors.primaryLightBackground,
                ),
                TopNavBtn(
                  iconType: IconType.bell,
                  color: AppColors.primaryLightBackground,
                ),
              ],
            ),
          ),
        ],
      );

  Widget _buildWalletBalance() {
    return BlocBuilder<WalletCubit, WalletState>(
      builder: (context, state) {
        if (state is WalletLoading) {
          return const BalanceCard(
            balance: 0,
            // silverCount: '0',
            // goldCount: '0',
            progressValues: _walletProgressValues,
            progressColors: [
              Color(0xFF4CE5B1),
              Color(0xFFFF8900),
            ],
          );
        } else if (state is WalletLoaded) {
          return BalanceCard(
            balance: state.walletCounters.balance,
            // silverCount: state.walletCounters.silverCount.toString(),
            // goldCount: state.walletCounters.goldCount.toString(),
            progressValues: _walletProgressValues,
            progressColors: [
              Color(0xFF4CE5B1),
              Color(0xFFFF8900),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildWalletActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _walletActionButton(
            Icons.add_card_outlined, 'Add Funds', PaymentTypeRoute()),
        _walletActionButton(Icons.wallet, 'Send Coins', SendCoinRoute()),
        _walletActionButton(Icons.account_balance_wallet_outlined,
            'Payout Accounts', WithdrawalPayoutAccountRoute()),
        _walletActionButton(
            Icons.account_balance, 'Withdraw', WithdrawalPayoutAccountRoute()),
      ],
    );
  }

  Widget _walletActionButton(IconData icon, String text, PageRouteInfo route) {
    return CustomIconButton(
      icon: icon,
      text: text,
      onPressed: () => context.router.push(route),
    );
  }

  Widget _buildTransactionSection() {
    return BlocBuilder<TransactionsCubit, PaginationState<TransactionModel>>(
      bloc: transactionsCubit,
      builder: (context, state) {
        final transactions = state.items;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTransactionHeader(),
            const SizedBox(height: 10),
            _buildTransactionNavigation(state),
            const SizedBox(height: 16),
            if (state.isLoading && transactions.isEmpty)
              const Center(child: CircularProgressIndicator())
            else if (transactions.isEmpty)
              const Center(
                child: Text(
                  "No transactions available",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            else
              TransactionListView(transactions: transactions),
            if (state.isLoading && transactions.isNotEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Center(child: CircularProgressIndicator()),
              ),
          ],
        );
      },
    );
  }

  Widget _buildTransactionHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: const Text(
        'Transactions',
        style: TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _buildTransactionNavigation(PaginationState<TransactionModel> state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildButton(
            text: 'History',
            icon: Icons.history,
            onTap: () =>
                NotifyUser.showSnackBar('History will be available soon'),
          ),
          Row(
            children: [
              ElevatedButton.icon(
                onPressed: state.currentPage > 1
                    ? () {
                        final prevPage = state.currentPage - 1;
                        transactionsCubit.jumpToPageDirect(prevPage);
                      }
                    : null,
                icon: const Icon(Icons.arrow_circle_left_rounded),
                label: const Text('Prev'),
              ),
              const SizedBox(width: 10),
              ElevatedButton.icon(
                onPressed: state.hasMore
                    ? () {
                        final nextPage = state.currentPage + 1;
                        transactionsCubit.jumpToPageDirect(nextPage);
                      }
                    : null,
                icon: const Icon(Icons.arrow_circle_right_rounded),
                label: const Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
