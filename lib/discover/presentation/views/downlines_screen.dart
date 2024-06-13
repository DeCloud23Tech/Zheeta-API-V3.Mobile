import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/router/app_router.dart';

@RoutePage()
class DownLinesScreen extends StatefulWidget {
  const DownLinesScreen({super.key});

  @override
  State<DownLinesScreen> createState() => _DownLinesScreenState();
}

class _DownLinesScreenState extends State<DownLinesScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryLight,
        elevation: 0.0,
        leading: GestureDetector(
            onTap: () => router.pop(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  padding: EdgeInsets.all(5),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(100)),
                  child: Icon(Icons.arrow_back_ios_new, color: AppColors.grey)),
            )),
        title: Text(
          'Downlines',
          style: TextStyle(
              color: AppColors.grayscale,
              fontSize: 24,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            children: [
              TextField(
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
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: displayedProfiles.length,
                  itemBuilder: (context, index) {
                    final profile = displayedProfiles[index];
                    return ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 6),
                      leading: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                            image: AssetImage(profile.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(
                        profile.name,
                        style: TextStyle(
                            color: AppColors.primaryDark,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          // View profile button pressed
                        },
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                10.0,
                              ),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(AppColors.primaryDark),
                        ),
                        child: Text(
                          'View Profile',
                          style: TextStyle(
                              color: AppColors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
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
