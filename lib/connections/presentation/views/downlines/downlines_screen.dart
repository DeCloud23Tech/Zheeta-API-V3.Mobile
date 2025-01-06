import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/app/pagination_controller.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/connections/data/model/user_downline_model.dart';
import 'package:zheeta/connections/presentation/bloc/downline_cubit/downline_cubit.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/loader.dart';
import 'package:zheeta/widgets/search_field.dart';

@RoutePage()
class DownLinesScreen extends StatefulWidget {
  const DownLinesScreen({super.key});

  @override
  State<DownLinesScreen> createState() => _DownLinesScreenState();
}

class _DownLinesScreenState extends State<DownLinesScreen> {
  final TextEditingController _searchController = TextEditingController();
  late PaginatedListController<UserDownlineModel, DownlineCubit, DownlineState>
      _downlinesPaginatedController;
  DownlineCubit downlineCubit = locator<DownlineCubit>();

  final ScrollController _scrollController = ScrollController();
  List<UserDownlineModel> filteredDownlines = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterDownlines);

    // Initialize paginated controller
    _downlinesPaginatedController = PaginatedListController<UserDownlineModel,
        DownlineCubit, DownlineState>(
      fetchItems: (param) => downlineCubit.fetchDownlines(param),
      cubit: downlineCubit,
    );

    // Add scroll listener to load more items when reaching the bottom
    _scrollController.addListener(_scrollListener);

    // Load the initial page of downlines
    _loadDownlinesPage();
  }

  void _filterDownlines() {
    setState(() {
      if (_searchController.text.isEmpty) {
        filteredDownlines = _downlinesPaginatedController.items;
      } else {
        final query = _searchController.text.toLowerCase();
        filteredDownlines = _downlinesPaginatedController.items.where((downline) {
          return downline.firstName.toLowerCase().contains(query) ||
              downline.lastName.toLowerCase().contains(query);
        }).toList();
      }
    });
  }

  void _loadDownlinesPage() {
    _downlinesPaginatedController.loadNextPage(
      successCondition: (state) => state.status == DownlineStatus.loaded,
      extractItems: (state) => state.downlines.data,
      isError: (state) => state.status == DownlineStatus.error,
    );
  }

  void _scrollListener() {
    if (_isBottom) {
      _loadDownlinesPage();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryLight,
        elevation: 0.0,
        leading: AppBackButton(),
        title: Text(
          'Downlines',
          style: TextStyle(
            color: AppColors.grayscale,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<DownlineCubit, DownlineState>(
        builder: (context, state) {
          if (state.status == DownlineStatus.loading &&
              _downlinesPaginatedController.items.isEmpty) {
            return LoadingIndicator();
          } else if (state.status == DownlineStatus.loaded &&
              _downlinesPaginatedController.items.isEmpty) {
            return Center(
              child: Text(
                'No downlines found.',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryDark,
                ),
              ),
            );
          }

          final displayList = _searchController.text.isEmpty
              ? _downlinesPaginatedController.items
              : filteredDownlines;

          return Column(
            children: [
              SearchField(
                searchController: _searchController,
                containerColor: AppColors.white,
                iconColor: AppColors.black,
                textColor: Colors.blueGrey,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    controller: _scrollController,
                    itemCount: displayList.length + 1,
                    itemBuilder: (context, index) {
                      if (index == displayList.length) {
                        return _downlinesPaginatedController.hasMoreItems &&
                                (_downlinesPaginatedController.items.length >=
                                    _downlinesPaginatedController.pageSize)
                            ? LoadingIndicator()
                            : const SizedBox.shrink();
                      }

                      final downline = displayList[index];
                      return ListTile(
                        contentPadding: EdgeInsets.symmetric(vertical: 6),
                        leading: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(15.0),
                            image: DecorationImage(
                              image: NetworkImage(downline.profilePhotoURL),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: Text(
                          '${downline.firstName} ${downline.lastName}',
                          style: TextStyle(
                            color: AppColors.primaryDark,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        trailing: SizedBox(
                          height: 30,
                          child: ElevatedButton(
                            onPressed: () {
                              context.router.push(
                                  ProfileViewRoute(profileId: downline.id));
                            },
                            style: ButtonStyle(
                              padding: WidgetStateProperty.all(
                                EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                              ),
                              shape: WidgetStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              backgroundColor: WidgetStateProperty.all(
                                  AppColors.primaryDark),
                            ),
                            child: Text(
                              'View Profile',
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
