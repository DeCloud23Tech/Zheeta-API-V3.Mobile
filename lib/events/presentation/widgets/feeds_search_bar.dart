import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/events/presentation/widgets/event_filter_bottomsheet.dart';
import 'package:zheeta/widgets/search_field.dart';

class FeedSearchBar extends StatelessWidget {
  final TextEditingController searchController;

  const FeedSearchBar({Key? key, required this.searchController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SearchField(
            searchController: searchController,
            onTap: () => _showSearchBottomSheet(context),
            containerColor: AppColors.primaryLightBackground,
            iconColor: AppColors.white,
            textColor: Colors.white,
          ),
        ),
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.primaryLightBackground,
            borderRadius: BorderRadius.circular(8),
          ),
          child: GestureDetector(
            onTap: () async {
              final eventFilter = await eventFilterBottomSheet(context);
            },
            child: SvgPicture.asset(
              'assets/images/icons/filter_mark.svg',
              colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
            ),
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }

  void _showSearchBottomSheet(BuildContext context) {
    final TextEditingController _searchController = TextEditingController();

    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            // Move the activeTab variable here to maintain state
            int activeTab = 1; // Initialize the active tab

            return Container(
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                color: AppColors.secondaryLight,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  _buildSearchHeader(context),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SearchField(
                          searchController: _searchController,
                          containerColor: AppColors.white,
                          iconColor: AppColors.black,
                          textColor: Colors.blueGrey,
                        ),
                        SizedBox(height: 20),
                        _buildTabBar(setState, activeTab),
                        activeTab == 1
                            ? PeopleTabContent(
                                searchQuery: _searchController.text)
                            : HashtagTabContent(
                                searchQuery: _searchController.text),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildSearchHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              padding: EdgeInsets.all(5),
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Icon(
                Icons.close,
                color: AppColors.grey,
                size: 18,
              ),
            ),
          ),
          Spacer(),
          Text(
            'Search',
            style: TextStyle(
              color: AppColors.grayscale,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }

  Widget _buildTabBar(StateSetter setState, int activeTab) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return Container(
        height: 40,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            _buildTabItem(setState, activeTab, 1, "People"),
            _buildTabItem(setState, activeTab, 2, "Hashtag"),
          ],
        ),
      );
    });
  }

  Widget _buildTabItem(
      StateSetter setState, int activeTab, int tab, String title) {
    return Expanded(
      child: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return GestureDetector(
            onTap: () {
              setState(() {
                activeTab = tab; // Update the active tab
              });
            },
            child: Column(
              children: [
                Container(
                  height: 3,
                  color: activeTab == tab
                      ? AppColors.primaryDark
                      : Colors.transparent,
                ),
                SizedBox(height: 5),
                Text(
                  title,
                  style: TextStyle(
                    color:
                        activeTab == tab ? AppColors.grayscale : AppColors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Define PeopleTabContent widget
class PeopleTabContent extends StatelessWidget {
  final String searchQuery;

  PeopleTabContent({required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    List<String> names = List.generate(10, (index) => 'Name $index');

    // Filtered list based on search query
    List<String> filteredNames = names.where((name) {
      return name.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      margin: EdgeInsets.only(top: 5),
      child: ListView(
        children: List.generate(
          filteredNames.length,
          (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage('assets/images/User.png'),
                ),
                SizedBox(width: 10),
                Text(
                  filteredNames[index],
                  style: TextStyle(
                      color: AppColors.primaryDark,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(width: 15),
                Image.asset('assets/images/verified.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Define HashtagTabContent widget
class HashtagTabContent extends StatelessWidget {
  final String searchQuery;

  HashtagTabContent({required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    List<String> hashtags =
        List.generate(10, (index) => '#Hashtag ${index + 1}');

    // Filtered list based on search query
    List<String> filteredHashtags = hashtags.where((hashtag) {
      return hashtag.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      margin: EdgeInsets.only(top: 5),
      child: ListView(
        children: List.generate(
          filteredHashtags.length,
          (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage('assets/images/User.png'),
                ),
                SizedBox(width: 10),
                Text(
                  filteredHashtags[index],
                  style: TextStyle(
                      color: AppColors.primaryDark,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
