import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/common/strings.dart';
import 'package:zheeta/profile/presentation/viewmodel/user_profile_viewmodel.dart';
import 'package:zheeta/widgets/primary_button.dart';

@RoutePage()
class WelcomeScreen extends ConsumerStatefulWidget {
  const WelcomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends ConsumerState<WelcomeScreen> {
  late UserProfileViewModel userProfileViewModel;

  @override
  void initState() {
    userProfileViewModel = ref.read(userProfileViewModelProvider.notifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userProfileState = ref.watch(userProfileViewModelProvider);
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              Text(
                authWelcomeTitle,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 28),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Text(
                  authWelcomeSubtitle,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 15.0, color: Colors.white),
                ),
              ),
              SizedBox(height: 60),
              Image.asset('assets/images/welcome.png')
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 50.0),
        child: PrimaryButton(
          invert: true,
          state: userProfileState.getSingleUserProfileState.isLoading,
          title: 'Proceed',
          action: () {
            userProfileViewModel.getSingleUserProfile();
          },
        ),
      ),
    );
  }
}
