import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/services/inapp_purchase_service.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/shared/widgets/loader.dart';

class SubscriptionPlans extends StatefulWidget {
  final String subscription;
  final ValueChanged<ProductDetails> onPlanSelected;
  final ValueChanged<String> onDurationSelected;

  const SubscriptionPlans({
    super.key,
    required this.subscription,
    required this.onPlanSelected,
    required this.onDurationSelected,
  });

  @override
  State<SubscriptionPlans> createState() => _SubscriptionPlansState();
}

class _SubscriptionPlansState extends State<SubscriptionPlans> {
  // Use locator to get the instance of InAppPurchaseService
  final InAppPurchaseService _purchaseService = locator<InAppPurchaseService>();
  List<Map<String, dynamic>> plans = [];
  int _selectedIndex = 0;
  bool _isLoading = true;
  String? _errorMessage;

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.6);
    _loadPlans();
  }

  Future<void> _loadPlans() async {
    try {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });

      final productsWithMetadata =
          await _purchaseService.loadProducts(widget.subscription);

      if (productsWithMetadata.isNotEmpty) {
        setState(() {
          plans = productsWithMetadata;
          _selectedIndex = 0;
        });
        widget.onPlanSelected(
            productsWithMetadata[0]['product'] as ProductDetails);
        widget
            .onDurationSelected(productsWithMetadata[0]['duration'] as String);
      } else {
        setState(() {
          _errorMessage = "No subscription plans available";
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = "Failed to load plans: ${e.toString()}";
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select a billing plan',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
        const SizedBox(height: 10),
        if (_isLoading)
          loadingIndicator()
        else if (_errorMessage != null)
          Center(
            child: Text(
              _errorMessage!,
              style: const TextStyle(color: AppColors.white),
            ),
          )
        else
          SizedBox(
            height: 220,
            child: PageView.builder(
              controller: _pageController,
              itemCount: plans.length,
              onPageChanged: (index) {
                setState(() => _selectedIndex = index);
                widget
                    .onPlanSelected(plans[index]['product'] as ProductDetails);
                widget.onDurationSelected(plans[index]['duration'] as String);
              },
              itemBuilder: (context, index) {
                final plan = plans[index];
                final isSelected = index == _selectedIndex;
                final isMostPopular =
                    index == 1; // Mark second plan as most popular
                // final monthlyPrice = _getMonthlyPrice(plan);
                // final duration = _getDuration(plan.id);
                final product = plan['product'] as ProductDetails;
                final duration = plan['duration'] as String;
                final displayPrice = plan['price'] as String;
                final discount = plan['discount'] as String?;

                return GestureDetector(
                  onTap: () {
                    _pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.primaryDark,
                      border: Border.all(
                        color: isSelected
                            ? AppColors.white
                            : AppColors.white.withValues(alpha: 0.5),
                        width: isSelected ? 2.0 : 0.8,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          duration,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          displayPrice,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white,
                          ),
                        ),
                        if (discount != null) ...[
                          const SizedBox(height: 4),
                          Text(
                            "$discount OFF",
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.grey,
                            ),
                          ),
                        ],

                        // Text(
                        //   duration,
                        //   style: const TextStyle(
                        //     fontSize: 16,
                        //     fontWeight: FontWeight.bold,
                        //     color: AppColors.white,
                        //   ),
                        // ),
                        const SizedBox(height: 8),
                        // Text(
                        //   plan.price,
                        //   style: const TextStyle(
                        //     fontSize: 18,
                        //     fontWeight: FontWeight.w600,
                        //     color: AppColors.white,
                        //   ),
                        // ),
                        const SizedBox(height: 4),
                        // Text(
                        //   monthlyPrice,
                        //   style: const TextStyle(
                        //     fontSize: 14,
                        //     color: AppColors.grey,
                        //   ),
                        // ),
                        if (isMostPopular) ...[
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Text(
                              "MOST POPULAR",
                              style: TextStyle(
                                color: AppColors.primaryDark,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        const SizedBox(height: 12),
        if (!_isLoading && _errorMessage == null)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              plans.length,
              (i) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: i == _selectedIndex ? 22 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: i == _selectedIndex
                      ? AppColors.white
                      : AppColors.white.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
