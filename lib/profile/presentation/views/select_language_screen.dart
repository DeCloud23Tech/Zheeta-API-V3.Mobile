import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/profile/presentation/viewmodel/user_profile_viewmodel.dart';
import 'package:zheeta/widgets/input_field.dart';
import 'package:zheeta/widgets/primary_button.dart';
import 'package:zheeta/widgets/radio_button.dart';

@RoutePage<List<String>>()
class SelectLanguageScreen extends StatefulWidget {
  final List<String> languages;
  UserProfileViewModel userProfileViewModel;
  SelectLanguageScreen({super.key, required this.languages, required this.userProfileViewModel});

  @override
  State<SelectLanguageScreen> createState() =>
      _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {
  late UserProfileViewModel userProfileViewModel;

  List<String> selectedLanguages = [];
  String searchKey = '';

  @override
  void initState() {
    userProfileViewModel = widget.userProfileViewModel;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        selectedLanguages = widget.languages;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.secondaryLight,
          body: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                InputField(
                  hintText: 'Search Language...',
                  suffixIcon: Icon(Icons.search),
                  onChanged: (value) {
                    setState(() {
                      searchKey = value;
                    });
                  },
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: userProfileViewModel.languageList.where((e) {
                        return e.toLowerCase().contains(searchKey.toLowerCase());
                      }).map((language) {
                        return ListTile(
                          dense: true,
                          title: Text(language),
                          leading: AppMultipleSelectRadioButton(
                            value: language,
                            showTitle: false,
                            isActive: selectedLanguages.contains(language),
                            onChanged: (value) {
                              if (selectedLanguages.contains(language)) {
                                selectedLanguages.remove(language);
                              } else {
                                selectedLanguages.add(language);
                              }
                              setState(() {});
                              userProfileViewModel.setLanguage(selectedLanguages);
                            },
                          ),
                          onTap: () {
                            if (selectedLanguages.contains(language)) {
                              selectedLanguages.remove(language);
                            } else {
                              selectedLanguages.add(language);
                            }
                            setState(() {});
                            userProfileViewModel.setLanguage(selectedLanguages);
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(20),
            child: PrimaryButton(
              title: 'Done',
              action: () async {
                router.pop<List<String>>(selectedLanguages);
              },
            ),
          ),
        );
      }
    );
  }
}
