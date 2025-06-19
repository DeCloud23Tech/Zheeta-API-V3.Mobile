import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/common/constants/color.dart';
import 'package:zheeta/common/enums/others.dart';
import 'package:zheeta/common/param/pagination_param.dart';
import 'package:zheeta/core/injection/di.dart';
import 'package:zheeta/core/router/app_router.gr.dart';
import 'package:zheeta/features/wallet_and_transactions/data/model/transaction_model.dart';
import 'package:zheeta/features/wallet_and_transactions/data/model/wallet_counters_model.dart';
import 'package:zheeta/features/wallet_and_transactions/presentation/bloc/transaction/transaction_cubit.dart';
import 'package:zheeta/features/wallet_and_transactions/presentation/bloc/wallet/wallet_cubit.dart';
import 'package:zheeta/features/wallet_and_transactions/presentation/widgets/balance_card.dart';
import 'package:zheeta/features/wallet_and_transactions/presentation/widgets/custom_wallet_button.dart';
import 'package:zheeta/features/wallet_and_transactions/presentation/widgets/transactions_listview.dart';
import 'package:zheeta/utils/token_utils.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/drawer.dart';
import 'package:zheeta/widgets/error_page.dart';
import 'package:zheeta/widgets/loader.dart';
import 'package:zheeta/widgets/top_nav.dart';

@RoutePage()
class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final TransactionCubit transactionCubit = locator<TransactionCubit>();
  final WalletCubit walletCubit = locator<WalletCubit>();

  String? userId;
  late ValueNotifier<PaginationParam> paginationParams;

  @override
  void initState() {
    super.initState();
    walletCubit.fetchWalletCounters();
    _initializeUserId();
  }

  Future<void> _initializeUserId() async {
    final fetchedUserId = await TokenUtil.getUserId();
    if (fetchedUserId == null) return;

    userId = fetchedUserId;
    paginationParams = ValueNotifier(
      PaginationParam(pageNo: 1, pageSize: 5, userId: userId!),
    );

    transactionCubit.fetchTransactionsCubit(paginationParams.value);
    if (mounted) setState(() {});
  }

  void _fetchTransactions() {
    if (userId != null) {
      transactionCubit.fetchTransactionsCubit(paginationParams.value);
    }
  }

  List<double> _calculateProgress(WalletCounters counters) {
    final total = (counters.regularCount + counters.silverCount + counters.goldCount).toDouble();
    return total == 0 ? [0.0, 0.0] : [counters.silverCount / total, counters.goldCount / total];
  }

  @override
  void dispose() {
    paginationParams.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: const SideDrawer(),
      backgroundColor: AppColors.primaryDark,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: RefreshIndicator(
          onRefresh: () async {
            await walletCubit.fetchWalletCounters();
            _fetchTransactions();
          },
          child: ListView(
            children: [
              _buildWalletBalance(),
              const SizedBox(height: 25),
              _buildWalletActions(),
              const SizedBox(height: 25),
              _buildTransactionSection(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
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
            children: const [
              TopNavBtn(iconType: IconType.menu, color: AppColors.primaryLightBackground),
              TopNavBtn(iconType: IconType.bell, color: AppColors.primaryLightBackground),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildWalletBalance() {
    return BlocBuilder<WalletCubit, WalletState>(
      builder: (context, state) {
        if (state is WalletLoading) {
          return _walletBalancePlaceholder();
        } else if (state is WalletLoaded) {
          return BalanceCard(
            balance: state.walletCounters.balance,
            silverCount: state.walletCounters.silverCount.toString(),
            goldCount: state.walletCounters.goldCount.toString(),
            progressValues: _calculateProgress(state.walletCounters),
            progressColors: [Colors.greenAccent, Colors.orange],
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget _walletBalancePlaceholder() {
    return const BalanceCard(
      balance: 0,
      silverCount: '0',
      goldCount: '0',
      progressValues: [0.0, 0.0],
      progressColors: [Colors.greenAccent, Colors.orange],
    );
  }

  Widget _buildWalletActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _walletActionButton(Icons.add_card_outlined, 'Add Funds', PaymentTypesRoute()),
        _walletActionButton(Icons.wallet, 'Send Coins', SendCoinRoute()),
        _walletActionButton(Icons.account_balance_wallet_outlined, 'Payout Accounts', PayoutMenuRoute()),
        _walletActionButton(Icons.account_balance, 'Withdraw', WithdrawalPayoutAccountRoute()),
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
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        if (state is TransactionLoading) {
          return loadingIndicator();
        } else if (state is TransactionLoaded) {
          return _buildTransactionList(state.transactions);
        } else {
          return const ErrorPage();
        }
      },
    );
  }

  Widget _buildTransactionList(List<TransactionModel> transactions) {
    return Column(
      children: [
        _buildTransactionHeader(),
        const SizedBox(height: 10),
        _buildTransactionNavigation(),
        const SizedBox(height: 16),
        _buildTransactionListView(transactions),
      ],
    );
  }

  Widget _buildTransactionHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Recent Transactions',
            style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          GestureDetector(
            onTap: () => context.router.push(TransactionRoute(userId: userId)),
            child: const Text(
              'View all',
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionNavigation() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: [
          _paginationButton('Prev', Icons.arrow_circle_left_rounded, decrement: true),
          const Spacer(),
          _paginationButton('Next', Icons.arrow_circle_right_rounded, decrement: false),
        ],
      ),
    );
  }

  Widget _paginationButton(String text, IconData icon, {required bool decrement}) {
    return buildButton(
      text: text,
      icon: icon,
      onTap: () {
        if (decrement && paginationParams.value.pageNo > 1) {
          paginationParams.value = paginationParams.value.copyWith(page: paginationParams.value.pageNo - 1);
          _fetchTransactions();
        } else if (!decrement) {
          paginationParams.value = paginationParams.value.copyWith(page: paginationParams.value.pageNo + 1);
          _fetchTransactions();
        }
      },
    );
  }

  Widget _buildTransactionListView(List<TransactionModel> transactions) {
    final displayedTransactions = transactions.reversed.toList().take(5).toList();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      height: MediaQuery.of(context).size.height * 0.45,
      child: displayedTransactions.isNotEmpty
          ? TransactionListView(transactions: displayedTransactions)
          : const Center(
        child: Text(
          "No transactions available",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
