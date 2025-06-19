import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zheeta/common/constants/lists.dart';
import 'package:zheeta/common/mixins/validation_helper.dart';
import 'package:zheeta/common/notify/notify_user.dart';
import 'package:zheeta/core/router/app_router.gr.dart';
import 'package:zheeta/features/buddy_events/presentation/views/create_event/create_event_screen.dart';
import 'package:zheeta/features/buddy_events/presentation/widgets/multi_tag_selector.dart';
import 'package:zheeta/widgets/input_field.dart';
import 'package:zheeta/widgets/media_picker.dart';
import 'package:zheeta/widgets/primary_button.dart';

import '../create_event_globals.dart';

// Step 1 Screen
@RoutePage()
class EventInfoScreen extends StatefulWidget {
  const EventInfoScreen({super.key});

  @override
  State<EventInfoScreen> createState() => _EventInfoScreenState();
}

class _EventInfoScreenState extends State<EventInfoScreen>
    with ValidationHelperMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 1),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKeys[0],
          child: ListView(
            children: [
              const Text(
                'Category',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              DropdownInputField(
                value: categoryController.text.isNotEmpty
                    ? categoryController.text
                    : null,
                items: AppLists.eventCategories,
                hintText: 'Select category',
                validator: (value) => isValidInput(value),
                onChanged: (value) =>
                    setState(() => categoryController.text = value ?? ''),
              ),
              const SizedBox(height: 10),
              const Text(
                'Event type',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              DropdownInputField(
                value: eventTypeController.text.isNotEmpty
                    ? eventTypeController.text
                    : null,
                items: ['Free', 'Paid'],
                hintText: 'Event type',
                onChanged: (value) =>
                    setState(() => eventTypeController.text = value ?? ''),
                validator: (value) => isValidInput(value),
              ),
              const SizedBox(height: 10),
              if (isPaid) ...[
                const Text(
                  'Participation fee',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                InputField(
                  keyboardType: TextInputType.number,
                  hintText: 'Enter participation fee',
                  onChanged: (value) =>
                      setState(() => participationFeeController.text = value),
                  validator: (value) => isValidInput(value),
                ),
                const SizedBox(height: 10),
              ],
              const Text(
                'Event title',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              InputField(
                hintText: 'Enter event title',
                onChanged: (value) =>
                    setState(() => eventTitleController.text = value),
                validator: (value) => isValidInput(value),
              ),
              const SizedBox(height: 10),
              const Text(
                'Description',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              InputField(
                hintText: 'Type description',
                minLine: 4,
                maxLine: 4,
                onChanged: (value) =>
                    setState(() => descriptionController.text = value),
                validator: (value) => isValidInput(value),
              ),
              const SizedBox(height: 10),
              const Text(
                'Event Tags',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              MultiSelectTags(
                tags: AppLists.eventTags,
                onTagsChanged: (tags) {
                  setState(() {
                    selectedTags = tags;
                  });
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Number of buddies wanted',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              InputField(
                hintText: '0',
                keyboardType: TextInputType.number,
                onChanged: (value) =>
                    setState(() => buddiesWantedController.text = value),
                validator: (value) => isValidInput(value),
              ),
              const SizedBox(height: 10),
              MediaPicker(
                initialMediaFiles: selectedMedia,
                onMediaFilesChanged: (mediaFiles) {
                  setState(() {
                    selectedMedia = mediaFiles;
                  });
                },
              ),
              const SizedBox(height: 5),
              const Text(
                'Max of 3 images',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
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
            if (formKeys[0].currentState?.validate() ?? false) {
              // Null check for selectedTags
              if (selectedTags.isEmpty) {
                NotifyUser.showSnackBar(
                    "Please select at least one event tag.");
                return; // Stop further execution if validation fails
              }

              // Null check for selectedMedia
              if (selectedMedia.isEmpty) {
                NotifyUser.showSnackBar("Please select media files.");
                return; // Stop further execution if validation fails
              }

              // Null or empty check for categoryController
              if (categoryController.text.isEmpty) {
                NotifyUser.showSnackBar("Please select a category.");
                return;
              }

              // Null or empty check for eventTypeController
              if (eventTypeController.text.isEmpty) {
                NotifyUser.showSnackBar("Please select an event type.");
                return;
              }

              // If the event is paid, check for participation fee
              if (isPaid && participationFeeController.text.isEmpty) {
                NotifyUser.showSnackBar("Please enter the participation fee.");
                return;
              }

              // Null or empty check for eventTitleController
              if (eventTitleController.text.isEmpty) {
                NotifyUser.showSnackBar("Please enter the event title.");
                return;
              }

              // Null or empty check for descriptionController
              if (descriptionController.text.isEmpty) {
                NotifyUser.showSnackBar("Please enter the event description.");
                return;
              }

              // Null or empty check for buddiesWantedController
              if (buddiesWantedController.text.isEmpty) {
                NotifyUser.showSnackBar(
                    "Please enter the number of buddies wanted.");
                return;
              }

              // Proceed to the next step in the form
              context.router.push(const DateTimeLocationRoute());
            }
          },
        ),
      ),
    );
  }
}
