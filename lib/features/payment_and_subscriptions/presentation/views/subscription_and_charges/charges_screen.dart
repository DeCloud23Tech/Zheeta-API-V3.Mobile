import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zheeta/common/constants/color.dart';
import 'package:zheeta/core/injection/di.dart';
import 'package:zheeta/features/payment_and_subscriptions/presentation/bloc/charges/charges_cubit.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/error_page.dart';
import 'package:zheeta/widgets/loader.dart';

@RoutePage()
class ChargeListScreen extends StatefulWidget {
  const ChargeListScreen({super.key});

  @override
  State<ChargeListScreen> createState() => _ChargeListScreenState();
}

class _ChargeListScreenState extends State<ChargeListScreen> {
  final ChargesCubit _chargesCubit = locator<ChargesCubit>();

  @override
  void initState() {
    _chargesCubit.getAllChargesCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      appBar: AppBar(
        backgroundColor: AppColors.primaryDark,
        elevation: 0.0,
        leading: AppBackButton(),
        title: Text(
          'Zheeta Charges',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocBuilder<ChargesCubit, ChargesState>(
            builder: (context, state) {
              if (state is ChargesLoading) {
                return loadingIndicator();
              } else if (state is ChargesError) {
                return ErrorPage();
              } else if (state is ChargesSuccess) {
                final charges = state.charges;
                return Column(
                  children: [
                    Text(
                      'Learn about the costs of using different features in the Zheeta app.',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        itemCount: charges.data.length + 1,
                        itemBuilder: (context, index) {
                          if (index < charges.data.length) {
                            final charge = charges.data[index];
                            return Container(
                              padding: EdgeInsets.all(4),
                              margin: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: ListTile(
                                title: Text(
                                  charge.title,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: AppColors.grayscaleBody),
                                ),
                                subtitle: Row(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/images/icons/zheeta-coin-bold.svg",
                                      height: 13.5,
                                      colorFilter: const ColorFilter.mode(
                                          AppColors.grayscale, BlendMode.srcIn),
                                    ),
                                    Text(
                                      ' ${charge.amount}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: AppColors.grayscale),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          } else {
                            // Footer at the end
                            return Column(
                              children: const [
                                Divider(),
                                Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Text(
                                    'All charges are inclusive of applicable taxes and may change',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }
                        },
                      ),
                    ),
                  ],
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
