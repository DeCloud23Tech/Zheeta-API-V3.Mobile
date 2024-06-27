import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/profile/data/model/user_profile_model.dart';
import 'package:zheeta/profile/presentation/viewmodel/user_profile_viewmodel.dart';
import 'package:zheeta/widgets/empty_content.dart';
import 'package:zheeta/widgets/primary_button.dart';
import '../../../app/router/app_router.dart';
import '../widgets/friend_profile_view.dart';
import '../widgets/user_profile_view.dart';
import '../widgets/visitor_profile_view.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late UserProfileViewModel userProfileViewModel;
  UserProfileDataModel? theUser;

  final controller = ScrollController();
  int _current = 0;
  int _activeTab = 1;
  int carouselCount = 1;

  bool showFullBio = true;

  @override
  void initState() {
    super.initState();
    userProfileViewModel = locator<UserProfileViewModel>();
    userProfileViewModel.loadUserRecentActivity(context);
    userProfileViewModel.getUserId();
    loadUserProfile();
  }

  void updateCurrentIndex(int index) {
    setState(() {
      _current = index;
    });
  }

  void updateActiveTab(int tabIndex) {
    setState(() {
      _activeTab = tabIndex;
    });
  }

  void toggleBio() {
    setState(() {
      showFullBio = !showFullBio;
    });
  }

  Future<void> loadUserProfile() async {
   
   
      setState(() {
        theUser = userProfileViewModel.userProfileModel?.data;
      });
    
  }

  @override
  Widget build(BuildContext context) {
    if (theUser != null) {
      carouselCount = theUser!.userCarousels?.length ?? 1;
    }

    return Scaffold(
      body: theUser == null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PrimaryButton(
                        title: 'Back',
                        action: () {
                          router.pop();
                        }),
                  )
                ],
              ),
            )
          : buildLoggedInUserProfileView(
                  controller: controller,
                  theUser: theUser,
                  userProfileViewModel: userProfileViewModel,
                  current: _current,
                  carouselCount: carouselCount,
                  activeTab: _activeTab,
                  showFullBio: showFullBio,
                  updateActiveTab: updateActiveTab,
                  updateCurrentIndex: updateCurrentIndex,
                  toggleBio: toggleBio,
                )
              
    );
  }
}

Widget _buildBlockedView() {
  return BlockedUserContent();
}
