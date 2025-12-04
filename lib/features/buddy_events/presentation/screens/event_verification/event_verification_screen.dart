import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/mixin/validation_mixin.dart';
import 'package:zheeta/features/buddy_events/presentation/widgets/verification_guidelines.dart';
import 'package:zheeta/shared/widgets/back_button.dart';
import 'package:zheeta/shared/widgets/input_field.dart';
import 'package:zheeta/shared/widgets/media_picker.dart';
import 'package:zheeta/shared/widgets/primary_button.dart';

@RoutePage()
class EventVerificationScreen extends StatefulWidget {
  const EventVerificationScreen({super.key});

  @override
  State<EventVerificationScreen> createState() =>
      _EventVerificationScreenState();
}

class _EventVerificationScreenState extends State<EventVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Placeholder();

    //   BlocProvider(
    //   create: (context) => MultiStepFormCubit(totalSteps: 3),
    //   child: MultiStepFormScreen(),
    // );
  }
}

// MultiStepFormScreen
class MultiStepFormScreen extends StatelessWidget {
  static const List<String> formSections = [
    'Proof of Address',
    'Proof of Identity',
    'Proof of Facial Look'
  ];

  const MultiStepFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final cubit = context.read<MultiStepFormCubit>();

    final totalSteps = 3;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondaryLight,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const AppBackButton(),
        ),
        title: Text(
          'KYC Verification',
          style: TextStyle(
            color: AppColors.grayscale,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // BlocBuilder<MultiStepFormCubit, MultiStepFormState>(
              //   buildWhen: (previous, current) => previous.step != current.step,
              //   builder: (context, state) {
              //     return Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Text(
              //               'Step ${state.step}/$totalSteps',
              //               style: const TextStyle(
              //                   fontSize: 10, fontWeight: FontWeight.w500),
              //             ),
              //             Text(
              //               formSections[state.step - 1],
              //               style: const TextStyle(
              //                   fontSize: 10, fontWeight: FontWeight.w500),
              //             ),
              //           ],
              //         ),
              //         const SizedBox(height: 4),
              //         LinearProgressIndicator(
              //           minHeight: 3,
              //           value: state.step / totalSteps,
              //           backgroundColor: AppColors.secondarySwirl,
              //           color: AppColors.primaryDark,
              //         ),
              //       ],
              //     );
              //   },
              // ),
              // const SizedBox(height: 20),
              // Expanded(
              //   child: BlocBuilder<MultiStepFormCubit, MultiStepFormState>(
              //     buildWhen: (previous, current) =>
              //         previous.step != current.step,
              //     builder: (context, state) {
              //       return StepForm(currentStep: state.step);
              //     },
              //   ),
              // ),
              // BlocBuilder<MultiStepFormCubit, MultiStepFormState>(
              //   builder: (context, state) {
              //     return Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         if (state.step == 2) ...[
              //           Expanded(
              //             child: PrimaryButton(
              //               title: 'Previous',
              //               action: cubit.previousStep,
              //             ),
              //           ),
              //           const SizedBox(width: 20),
              //         ],
              //         if (state.step == 1 || state.step == 2) ...[
              //           Expanded(
              //             child: PrimaryButton(
              //               title: 'Next',
              //               action: cubit.nextStep,
              //             ),
              //           ),
              //         ],
              //         if (state.step == 3) ...[
              //           Expanded(
              //             child: PrimaryButton(
              //               title: 'I\'m ready',
              //               action: () {
              //                 // open front camera to take video of users face for kyc
              //               },
              //             ),
              //           ),
              //         ],
              //       ],
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

// StepForm
class StepForm extends StatefulWidget {
  final int currentStep;

  const StepForm({required this.currentStep, super.key});

  @override
  State<StepForm> createState() => _StepFormState();
}

class _StepFormState extends State<StepForm> with Validator {
  List<File> selectedMediaStep1 = [];
  List<File> selectedMediaStep2 = [];

  // Text controllers for inputs
  final TextEditingController documentNumberController =
      TextEditingController();
  String? selectedDocumentType;

  // Dropdown items for Identity Verification
  final List<String> identityDocumentTypes = [
    'National ID',
    'Passport',
    'Driver’s License',
    'Voter’s Card'
  ];

  @override
  Widget build(BuildContext context) {
    switch (widget.currentStep) {
      case 1:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Step 1: Proof of Address',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Text(
                'Upload documents to verify your address. Accepted documents include utility bills, bank statements, or government-issued letters. They must show your address. Upload 1 to 3 documents for faster approval'),
            const SizedBox(height: 10),
            Text(
              'Upload documents',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            MediaPicker(
              initialMediaFiles: selectedMediaStep1,
              onMediaFilesChanged: (mediaFiles) {
                setState(() {
                  selectedMediaStep1 = mediaFiles;
                });
              },
            ),
            const SizedBox(height: 5),
            const Text(
              'Max of 3 images',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
            ),
          ],
        );
      case 2:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Step 2: Proof of Identity',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Text('Provide ID documents to verify your identity. '),
            const SizedBox(height: 10),
            const Text(
              'ID document type',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            DropdownInputField(
              items: identityDocumentTypes,
              hintText: 'Select document type',
              onChanged: (value) {
                setState(() {
                  selectedDocumentType = value;
                });
              },
              validator: (value) => isValidInput(value),
            ),
            const SizedBox(height: 10),
            const Text(
              'Document number',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            InputField(
              controller: documentNumberController,
              hintText: 'Enter number',
              validator: (value) => isValidInput(value),
            ),
            const SizedBox(height: 10),
            Text(
              'Upload documents',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            MediaPicker(
              initialMediaFiles: selectedMediaStep2,
              onMediaFilesChanged: (mediaFiles) {
                setState(() {
                  selectedMediaStep2 = mediaFiles;
                });
              },
            ),
            const SizedBox(height: 5),
            const Text(
              'Max of 3 images',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
            ),
          ],
        );
      case 3:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Step 3: Proof of Facial Look',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Text(
                'Proceed to prove your facial look.Please follow the steps displayed on the screen and make sure your face is fully visible.'),
            const SizedBox(height: 10),
            VerificationGuidelines(),
            const SizedBox(height: 10),
          ],
        );
      default:
        return Center(child: Text('Unknown Step'));
    }
  }

  @override
  void dispose() {
    documentNumberController.dispose();
    super.dispose();
  }
}
