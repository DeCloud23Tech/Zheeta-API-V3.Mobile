import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/events/presentation/bloc/multi_step_form_cubit/multi_step_form_cubit.dart';
import 'package:zheeta/events/presentation/views/create_event/create_event_screen.dart';
import 'package:zheeta/widgets/primary_button.dart';

import 'multi_step_form_body.dart';

class MultiStepForm extends StatelessWidget {
  final int totalSteps = 4;
  final List<String> formSection = [
    'Event details',
    'Date, time & location',
    'Guidelines & Items',
    'Target insights & review'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Step Indicator
        BlocBuilder<MultiStepFormCubit, int>(
          builder: (context, currentStep) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      formSection[currentStep - 1],
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                LinearProgressIndicator(
                  minHeight: 3,
                  value: currentStep / totalSteps,
                  backgroundColor: AppColors.secondarySwirl,
                  color: AppColors.primaryDark,
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 20),
        //Current Step Form
        Expanded(
          child: BlocBuilder<MultiStepFormCubit, int>(
            builder: (context, currentStep) {
              return StepForm(currentStep: currentStep);
            },
          ),
        ), //Navigation Buttons
      ],
    );
  }
}
