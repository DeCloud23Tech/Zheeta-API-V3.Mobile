import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/common/enums/others.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/profile/data/model/user_profile_model.dart';
import 'package:zheeta/profile/presentation/bloc/profile_cubit.dart';
import 'package:zheeta/profile/presentation/viewmodel/user_profile_viewmodel.dart';
import 'package:zheeta/widgets/empty_content.dart';
import 'package:zheeta/widgets/primary_button.dart';
import 'package:zheeta/widgets/top_nav.dart';
import 'package:zheeta/widgets/transparent_button.dart';

import '../../../app/router/app_router.dart';
import '../widgets/basic_profile_prop.dart';
import '../widgets/intrests_tile.dart';
import '../widgets/profile_add_or_like.dart';
import '../widgets/profile_posts.dart';

@RoutePage<String?>()
class ProfileScreen extends StatefulWidget {
  final String? profileId;

  ProfileScreen({super.key, this.profileId});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late UserProfileViewModel userProfileViewModel;
  UserProfileDataModel? theUser;

  final controller = ScrollController();
  var _current = 0;
  var activeTab = 1;

  bool showFullBio = true;

  @override
  void initState() {
    super.initState();
    userProfileViewModel = locator<UserProfileViewModel>();
    userProfileViewModel.loadUserRecentActivity(context);
    userProfileViewModel.getUserId();
    loadUserProfile();
  }

  Future<void> loadUserProfile() async {
    if (widget.profileId != null) {
      await userProfileViewModel.visitUserProfile(context, widget.profileId!);
      setState(() {
        theUser = userProfileViewModel.visitProfilePage?.data.profile;
      });
    } else {
      setState(() {
        theUser = userProfileViewModel.userProfileModel?.data;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int carouselCount = 1;

    if (theUser != null) {
      carouselCount = theUser!.userCarousels?.length ?? 1;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(theUser?.profile?.firstName ?? 'Profile'),
      ),
      body: theUser == null
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        controller: controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileHeader(),
            _buildProfileContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        // Add profile header content here (e.g., profile picture, name, etc.)
      ],
    );
  }

  Widget _buildProfileContent() {
    if (theUser == null) {
      return Center(child: Text('No user profile data available.'));
    }

    if (!userProfileViewModel.visitProfilePage!.data.canViewProfile) {
      return Center(child: Text('You cannot view this profile.'));
    }

    return Column(
      children: [
        // Show different widgets based on the user type
        if (userProfileViewModel.visitProfilePage!.data.isFriend) _buildFriendProfile(),
        if (!userProfileViewModel.visitProfilePage!.data.canViewProfile && widget.profileId != null) _buildVisitorProfile(),
        if (widget.profileId == null) _buildLoggedInUserProfile(),
      ],
    );
  }

  Widget _buildFriendProfile() {
    return Column(
      children: [
        Text('Friend Profile View'),
        // Add widgets specific to friend profile view
        if (userProfileViewModel.visitProfilePage!.data.canMessage) _buildMessageButton(),
        if (userProfileViewModel.visitProfilePage!.data.canAddFriend) _buildAddFriendButton(),
      ],
    );
  }

  Widget _buildVisitorProfile() {
    return Column(
      children: [
        Text('Visitor Profile View'),
        // Add widgets specific to visitor profile view
        if (userProfileViewModel.visitProfilePage!.data.canAddFriend) _buildAddFriendButton(),
      ],
    );
  }

  Widget _buildLoggedInUserProfile() {
    return Column(
      children: [
        Text('Logged-in User Profile View'),
        // Add widgets specific to logged-in user profile view
      ],
    );
  }

  Widget _buildMessageButton() {
    return ElevatedButton(
      onPressed: () {
        // Handle message button press
      },
      child: Text('Message'),
    );
  }

  Widget _buildAddFriendButton() {
    return ElevatedButton(
      onPressed: () {
        // Handle add friend button press
      },
      child: Text('Add Friend'),
    );
  }
}
