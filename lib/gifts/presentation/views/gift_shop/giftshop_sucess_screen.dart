import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/gifts/presentation/bloc/gift/gift_cubit.dart';
import 'package:zheeta/widgets/primary_button.dart';

class GiftShopSuccessScreen extends StatefulWidget {
  const GiftShopSuccessScreen({super.key});

  @override
  _GiftShopSuccessScreenState createState() => _GiftShopSuccessScreenState();
}

class _GiftShopSuccessScreenState extends State<GiftShopSuccessScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Spacer(),
              Text(
                'Successful',
                style: TextStyle(
                  color: AppColors.primaryDark,
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Gift has been sent successfully',
                style: TextStyle(
                  color: AppColors.grayscale,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 25),
              ScaleTransition(
                scale: _animation,
                child: Image.asset('assets/images/gift-success.png'),
              ),
              Spacer(
                flex: 2,
              ),
              PrimaryButton(
                title: 'Go to Gift Store',
                action: () {
                  context.read<GiftCubit>().resetGiftCubit(); // Reset cubit
                  context.router.back();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
