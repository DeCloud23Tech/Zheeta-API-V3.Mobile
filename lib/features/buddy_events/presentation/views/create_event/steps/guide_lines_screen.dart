import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zheeta/core/router/app_router.gr.dart';
import 'package:zheeta/features/buddy_events/presentation/views/create_event/create_event_screen.dart';
import 'package:zheeta/widgets/guide_line_input_field.dart';
import 'package:zheeta/widgets/primary_button.dart';

import '../create_event_globals.dart';

// Step 3 Screen
@RoutePage()
class GuidelinesItemsScreen extends StatelessWidget {
  const GuidelinesItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context, 3),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKeys[2],
            child: ListView(
              children: [
                GuidelinesInputWithCheckbox(
                  text: 'Include event Guidelines (Optional)',
                  hintText: 'Enter guideline',
                  onGuidelinesChanged: (newGuidelines) {
                    guidelines = newGuidelines;
                  },
                ),
                SizedBox(height: 15),
                GuidelinesInputWithCheckbox(
                  text: 'Items to bring (Optional)',
                  hintText: 'Enter item',
                  onGuidelinesChanged: (newItems) {
                    itemsToBring = newItems;
                  },
                ),

              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20.0),
          child: PrimaryButton(
            title: 'Next',
            action: () {
              if (formKeys[2].currentState?.validate() ?? false) {
                // Continue only if all necessary fields are filled
                context.router.push(const TargetInsightsRoute());
              }
            },
          ),
        ),
    );
  }
}
