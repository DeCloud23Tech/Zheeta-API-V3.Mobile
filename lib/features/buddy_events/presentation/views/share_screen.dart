import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zheeta/common/constants/color.dart';
import 'package:zheeta/core/router/app_router.dart';


@RoutePage()
class ShareScreen extends StatefulWidget {
  const ShareScreen({super.key});

  @override
  State<ShareScreen> createState() => _ShareScreenState();
}

class _ShareScreenState extends State<ShareScreen> {
  final List<UserProfile> allProfiles = [
    UserProfile(name: 'Ronald Richards', imageUrl: 'assets/images/User.png'),
    UserProfile(name: 'Eleanor Pena', imageUrl: 'assets/images/User.png'),
    UserProfile(name: 'Jane Smith', imageUrl: 'assets/images/User.png'),
    UserProfile(name: 'Courtney Henry', imageUrl: 'assets/images/User.png'),
    UserProfile(name: 'Jane Smith', imageUrl: 'assets/images/User.png'),
    UserProfile(name: 'Courtney Henry', imageUrl: 'assets/images/User.png'),
    UserProfile(name: 'Jane Smith', imageUrl: 'assets/images/User.png'),
  ];

  List<UserProfile> displayedProfiles = [];
  final List<UserProfile> selectedProfiles = [];

  @override
  void initState() {
    super.initState();
    displayedProfiles.addAll(allProfiles);
  }

  void filterProfiles(String query) {
    List<UserProfile> filteredProfiles = allProfiles
        .where((profile) =>
            profile.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      displayedProfiles = filteredProfiles;
    });
  }

  void toggleSelection(UserProfile profile) {
    setState(() {
      if (selectedProfiles.contains(profile)) {
        selectedProfiles.remove(profile);
      } else {
        selectedProfiles.add(profile);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryLight,
        elevation: 0.0,
        leading: GestureDetector(
          // onTap: () => router.back(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(5),
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(100)),
              child: Icon(Icons.arrow_back_ios_new, color: AppColors.grey),
            ),
          ),
        ),
        title: Text(
          'Share',
          style: TextStyle(
              color: AppColors.grayscale,
              fontSize: 24,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: TextField(
                onChanged: filterProfiles,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(12),
                  fillColor: AppColors.white,
                  filled: true,
                  hintText: 'Search',
                  hintStyle: TextStyle(
                      color: AppColors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.w300),
                  suffixIcon: Icon(Icons.search),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primaryDark),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                itemCount: displayedProfiles.length,
                itemBuilder: (context, index) {
                  final profile = displayedProfiles[index];
                  final isSelected = selectedProfiles.contains(profile);
                  return ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 6),
                    leading: CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage(profile.imageUrl),
                    ),
                    title: Text(
                      profile.name,
                      style: TextStyle(
                          color: AppColors.primaryDark,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Checkbox(
                          activeColor: AppColors.primaryDark, // Set the color when the checkbox is active
                          fillColor: WidgetStateProperty.resolveWith<Color>(
                                (Set<WidgetState> states) {
                              if (states.contains(WidgetState.selected)) {
                                return AppColors.primaryDark; // Color when the checkbox is selected
                              }
                              return AppColors.secondaryLight; // Default color when not selected
                            },
                          ),
                          value: isSelected,
                          onChanged: (value) => toggleSelection(profile),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                              'assets/images/icons/share-3.svg'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.secondaryLight,
                border: Border(
                  top: BorderSide(
                    color: AppColors.grey,
                    width: 1.0,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${selectedProfiles.length} people selected',
                    style: TextStyle(
                      color: AppColors.primaryDark,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Add your share functionality here
                    },
                    icon: SvgPicture.asset('assets/images/icons/send-icon.svg'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserProfile {
  final String name;
  final String imageUrl;

  UserProfile({required this.name, required this.imageUrl});
}
