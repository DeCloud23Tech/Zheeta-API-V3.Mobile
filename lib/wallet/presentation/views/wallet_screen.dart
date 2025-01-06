import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/common/enums/others.dart';
import 'package:zheeta/app/common/param/pagination_param.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/wallet/presentation/views/wallet_transactions_screen.dart';
import 'package:zheeta/wallet/presentation/widgets/bullet_point_text.dart';
import 'package:zheeta/wallet/presentation/widgets/custom_wallet_button.dart';
import 'package:zheeta/wallet/presentation/widgets/linear_progress_indicator.dart';
import 'package:zheeta/wallet/presentation/widgets/recent_transactions.dart';
import 'package:zheeta/wallet/presentation/widgets/transactions_listview.dart';
import 'package:zheeta/widgets/drawer.dart';
import 'package:zheeta/widgets/top_nav.dart';

import '../bloc/transaction/transaction_cubit.dart';

@RoutePage()
class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final transactionCubit = context.read<TransactionCubit>();

    // Pagination state
    final paginationParams = ValueNotifier<PaginationParam>(
      PaginationParam(pageNo: 1, pageSize: 5, userId: 'c4eb5953-6250-41c1-9e17-b46342ae1229'),
    );

    void fetchTransactions() {
      transactionCubit.fetchTransactions(paginationParams.value);
    }

    // Fetch initial transactions
    WidgetsBinding.instance.addPostFrameCallback((_) => fetchTransactions());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryDark,
        elevation: 0.0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20, top: 10),
          child: Text(
            'Wallet',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 32,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Row(
              children: [
                TopNavBtn(
                    iconType: IconType.menu,
                    color: AppColors.primaryLightBackground),
                TopNavBtn(
                    iconType: IconType.bell,
                    color: AppColors.primaryLightBackground),
              ],
            ),
          )
        ],
      ),
      drawer: const SideDrawer(),
      backgroundColor: AppColors.primaryDark,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: BlocBuilder<TransactionCubit, TransactionState>(
          builder: (context, state) {
            if (state is TransactionLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TransactionError) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            } else if (state is TransactionLoaded) {
              return Column(
                children: [
                  Expanded(
                    child: RecentTransactionsWidget(
                      transactions: state.transactions,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Handle previous page navigation
                          if (paginationParams.value.pageNo > 1) {
                            final updatedParams = paginationParams.value
                                .copyWith(page: paginationParams.value.pageNo - 1);
                            paginationParams.value = updatedParams;
                            fetchTransactions();
                          }
                        },
                        child: const Text('Prev'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Handle next page navigation
                          final updatedParams = paginationParams.value
                              .copyWith(page: paginationParams.value.pageNo + 1);
                          paginationParams.value = updatedParams;
                          fetchTransactions();
                        },
                        child: const Text('Next'),
                      ),
                    ],
                  ),
                ],
              );
            }
            return const Center(
              child: Text('No transactions available.'),
            );
          },
        ),
      ),
    );
  }
}
