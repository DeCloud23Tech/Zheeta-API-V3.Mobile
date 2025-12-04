import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/utils/pagination_controller.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/connections/data/models/user_downline_model.dart';
import 'package:zheeta/features/connections/presentation/cubits/downline_cubit/user_downline_cubit.dart';
import 'package:zheeta/features/profile/presentation/widgets/search_field.dart';
import 'package:zheeta/router/app_router.gr.dart';
import 'package:zheeta/shared/widgets/back_button.dart';
import 'package:zheeta/shared/widgets/loader.dart';

@RoutePage()
class DownlinesScreen extends StatefulWidget {
  const DownlinesScreen({super.key});

  @override
  State<DownlinesScreen> createState() => _DownlinesScreenState();
}

class _DownlinesScreenState extends State<DownlinesScreen> {
  final TextEditingController _searchController = TextEditingController();
  late UserDownlinesCubit _downlinesCubit;
  final ScrollController _scrollController = ScrollController();
  List<UserDownlineModel> filteredDownlines = [];

  @override
  void initState() {
    super.initState();
    _downlinesCubit = locator<UserDownlinesCubit>();
    _searchController.addListener(_filterDownlines);

    // Load initial page
    _downlinesCubit.reset();

    _scrollController.addListener(() {
      if (_isBottom) _downlinesCubit.loadNextPage();
    });
  }

  void _filterDownlines() {
    setState(() {
      if (_searchController.text.isEmpty) {
        filteredDownlines = _downlinesCubit.state.items;
      } else {
        final query = _searchController.text.toLowerCase();
        filteredDownlines = _downlinesCubit.state.items.where((downline) {
          return downline.firstName.toLowerCase().contains(query) ||
              downline.lastName.toLowerCase().contains(query);
        }).toList();
      }
    });
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    return currentScroll >= (maxScroll * 0.9);
  }

  Future<void> _refreshDownlines() async => _downlinesCubit.refreshDownlines();

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
      body: BlocBuilder<UserDownlinesCubit, PaginationState<UserDownlineModel>>(
        bloc: _downlinesCubit,
        builder: (context, state) {
          if (state.isLoading && state.items.isEmpty) {
            return loadingIndicator();
          } else if (state.items.isEmpty) {
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

          final displayList =
              _searchController.text.isEmpty ? state.items : filteredDownlines;

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
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: RefreshIndicator(
                    onRefresh: _refreshDownlines,
                    color: AppColors.primaryLight,
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: state.hasMore
                          ? displayList.length + 1
                          : displayList.length,
                      itemBuilder: (context, index) {
                        if (index >= displayList.length) {
                          return Center(
                            child: CircularProgressIndicator(
                                color: AppColors.primaryLight),
                          );
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
              ),
            ],
          );
        },
      ),
    );
  }
}
