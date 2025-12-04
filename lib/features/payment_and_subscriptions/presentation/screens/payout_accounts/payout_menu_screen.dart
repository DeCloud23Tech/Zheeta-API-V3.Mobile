import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zheeta/router/app_router.gr.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/shared/widgets/back_button.dart';
import 'package:zheeta/shared/widgets/reusable_container.dart';

@RoutePage()
class PayoutMenuScreen extends StatelessWidget {
  const PayoutMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryLight,
        elevation: 0.0,
        leading: const AppBackButton(),
        title: const Text(
          'Withdrawal Accounts',
          style: TextStyle(
            color: AppColors.grayscale,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildMenuItem(
              context,
              icon: Icons.account_balance_wallet_outlined,
              title: 'Manage Existing Accounts',
              subtitle: 'All your previously saved accounts',
              route: const PayoutAccountRoute(),
            ),
            const SizedBox(height: 16),
            buildMenuItem(
              context,
              icon: Icons.add,
              title: 'Add New Account',
              subtitle: 'Add a new account to use',
              route: const PayoutCreateAccount(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required PageRouteInfo route,
  }) {
    return ReusableCustomContainer(
      child: InkWell(
        onTap: () => context.router.push(route),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          child: Row(
            children: [
              Icon(icon, size: 28, color: AppColors.primaryDark),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      subtitle,
                      style:
                          const TextStyle(fontSize: 14, color: AppColors.grey),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios,
                  size: 16, color: AppColors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
