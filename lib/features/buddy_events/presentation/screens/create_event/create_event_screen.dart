import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/features/buddy_events/presentation/screens/create_event/steps/event_info_screen.dart';
import 'package:zheeta/shared/widgets/back_button.dart';

@RoutePage()
class CreateEventScreen extends StatelessWidget {
  const CreateEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const EventInfoScreen();
  }
}

// Shared app bar for all screens
AppBar buildAppBar(BuildContext context, int currentStep) {
  final totalSteps = 4;
  final formSections = [
    'Event details',
    'Date, time & location',
    'Guidelines & Items',
    'Target insights & review'
  ];

  return AppBar(
    backgroundColor: AppColors.secondaryLight,
    elevation: 0.0,
    leading: GestureDetector(
      onTap: () {
        context.router.back();
      },
      child: const AppBackButton(),
    ),
    title: const Text(
      'Create event',
      style: TextStyle(
        color: AppColors.grayscale,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),
    centerTitle: true,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(25),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Step $currentStep/$totalSteps',
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  formSections[currentStep - 1],
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            LinearProgressIndicator(
              value: currentStep / totalSteps,
              minHeight: 3,
              backgroundColor: AppColors.secondarySwirl,
              color: AppColors.primaryDark,
            ),
          ],
        ),
      ),
    ),
  );
}
