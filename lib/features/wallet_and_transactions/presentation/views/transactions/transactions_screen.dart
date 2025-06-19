import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/common/constants/color.dart';
import 'package:zheeta/core/injection/di.dart';
import 'package:zheeta/features/wallet_and_transactions/data/model/transaction_model.dart';
import 'package:zheeta/features/wallet_and_transactions/presentation/bloc/transaction/transaction_cubit.dart';
import 'package:zheeta/features/wallet_and_transactions/presentation/widgets/custom_wallet_button.dart';
import 'package:zheeta/features/wallet_and_transactions/presentation/widgets/transactions_listview.dart';
import 'package:zheeta/utils/pagination_controller.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/loader.dart';

@RoutePage()
class TransactionScreen extends StatefulWidget {
  final String? userId;

  const TransactionScreen({super.key, this.userId});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  late PaginatedListController<TransactionModel, TransactionCubit,
      TransactionState> _transactionPaginatedController;
  final ScrollController _scrollController = ScrollController();
  final TransactionCubit _transactionCubit = locator<TransactionCubit>();

  String? _filterType; // Filter state: 'Credit', 'Debit', or null for all

  @override
  void initState() {
    super.initState();

    // Initialize PaginatedListController
    _transactionPaginatedController = PaginatedListController<TransactionModel,
        TransactionCubit, TransactionState>(
      fetchItems: (params) => _transactionCubit
          .fetchTransactionsCubit(params.copyWith(userId: widget.userId)),
      cubit: _transactionCubit,
      pageSize: 30,
    );

    // Load the initial page of transactions
    _loadTransactionsPage();

    // Add scroll listener for pagination
    _scrollController.addListener(_scrollListener);
  }

  void _loadTransactionsPage() {
    _transactionPaginatedController.loadNextPage(
      successCondition: (state) => state is TransactionLoaded,
      extractItems: (state) => (state as TransactionLoaded).transactions,
      isError: (state) => state is TransactionError,
    );
  }

  void _scrollListener() {
    if (_isBottom) {
      _loadTransactionsPage();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    return currentScroll >= (maxScroll * 0.5);
  }

  void _applyFilter(String? type) {
    setState(() {
      _filterType = type; // Update filter type
    });
  }

  List<TransactionModel> _filterTransactions(
      List<TransactionModel> transactions) {
    if (_filterType == null) return transactions; // No filter, return all
    return transactions
        .where((transaction) => transaction.transactionType == _filterType)
        .toList();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      appBar: AppBar(
        backgroundColor: AppColors.primaryDark,
        elevation: 0,
        leading: const AppBackButton(),
        title: const Text(
          'Transactions',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<TransactionCubit, TransactionState>(
        builder: (context, state) {
          if (state is TransactionLoading &&
              _transactionPaginatedController.items.isEmpty) {
            return loadingIndicator();
          } else if (state is TransactionError &&
              _transactionPaginatedController.items.isEmpty) {
            return Center(
              child: Text(
                'Failed to load transactions. Please try again later.',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                ),
              ),
            );
          } else if (state is TransactionLoaded &&
              _transactionPaginatedController.items.isEmpty) {
            return Center(
              child: Text(
                'No transactions found.',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                ),
              ),
            );
          }

          // Filter transactions
          final displayList = _filterTransactions(
              _transactionPaginatedController.items);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  'Recent Transactions',
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => _applyFilter(null),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        decoration: BoxDecoration(
                          color: AppColors.secondaryLight,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        child: Text(
                          'All',
                          style: TextStyle(
                            color: AppColors.primaryDark,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        buildButton(
                          text: 'Income',
                          icon: Icons.arrow_circle_down,
                          onTap: () => _applyFilter('Credit'),
                        ),
                        const SizedBox(width: 8),
                        buildButton(
                          text: 'Outcome',
                          icon: Icons.arrow_circle_up,
                          onTap: () => _applyFilter('Debit'),
                        ),

                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Flexible(
                child: displayList.isEmpty
                    ? Center(
                  child: Text(
                    'No transactions found.',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),
                )
                    : ListView.builder(
                  controller: _scrollController,
                  itemCount: displayList.length + 1,
                  physics: displayList.length < 5
                      ? const NeverScrollableScrollPhysics()
                      : const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    if (index == displayList.length) {
                      return _transactionPaginatedController.hasMoreItems
                          ? loadingIndicator()
                          : const SizedBox.shrink();
                    }

                    return Container(
                      height: MediaQuery.of(context).size.height * .085,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TransactionListView(
                        transactions: [displayList[index]],
                      ),
                    );
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
