import 'package:auto_route/annotations.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/common/extensions/num_extension.dart';
import 'package:zheeta/app/common/lists.dart';
import 'package:zheeta/app/common/mixins/validation_helper.dart';
import 'package:zheeta/events/presentation/bloc/multi_step_form_cubit/multi_step_form_cubit.dart';
import 'package:zheeta/events/presentation/widgets/multi_step_form.dart';
import 'package:zheeta/profile/presentation/bloc/profile_cubit/profile_cubit.dart';
import 'package:zheeta/widgets/input_field.dart';
import 'package:zheeta/widgets/primary_button.dart';

@RoutePage()
class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen();

  @override
  _CreateEventScreenState createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen>
    with ValidationHelperMixin {
  final int totalSteps = 4;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MultiStepFormCubit(totalSteps: totalSteps),
      child: BlocBuilder<MultiStepFormCubit, int>(
        builder: (context, currentStep) {
          final cubit = context.read<MultiStepFormCubit>();
          return Scaffold(
            backgroundColor: AppColors.secondaryLight,
            appBar: AppBar(
              backgroundColor: AppColors.secondaryLight,
              elevation: 0.0,
              leading: GestureDetector(
                onTap: () {
                  if (currentStep != 1) {
                    // print(currentStep);
                    // cubit.previousStep;
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child:
                        Icon(Icons.arrow_back_ios_new, color: AppColors.grey),
                  ),
                ),
              ),
              title: Text(
                'Create event',
                style: TextStyle(
                  color: AppColors.grayscale,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              centerTitle: true,
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: MultiStepForm(),
              ),
            ),
          );
        },
      ),
    );
  }
}
