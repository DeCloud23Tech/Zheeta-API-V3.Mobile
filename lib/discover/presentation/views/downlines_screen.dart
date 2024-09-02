import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/app/common/color.dart';

import '../../../app/router/app_router.gr.dart';
import '../../../widgets/loading_screen.dart';
import '../../data/model/user_downline_model.dart';
import '../bloc/downline_bloc/downline_cubit.dart';

@RoutePage()
class DownLinesScreen extends StatefulWidget {
  const DownLinesScreen({super.key});

  @override
  State<DownLinesScreen> createState() => _DownLinesScreenState();
}

class _DownLinesScreenState extends State<DownLinesScreen> {
  late DownlineCubit downlineCubit;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    downlineCubit = context.read<DownlineCubit>();
    _scrollController.addListener(_onScroll);
    downlineCubit.fetchDownlines(); // Fetch initial downlines
  }

  void _onScroll() {
    if (_isBottom) downlineCubit.fetchDownlines();
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryLight,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(5),
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Icon(Icons.arrow_back_ios_new, color: AppColors.grey),
            ),
          ),
        ),
        title: Text(
          'Downlines',
          style: TextStyle(
            color: AppColors.grayscale,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: BlocBuilder<DownlineCubit, DownlineState>(
          builder: (context, state) {
            if (state.status == DownlineStatus.loading || state.downlines.isEmpty) {
              return LoadingScreen(
                backgroundColor: AppColors.secondaryLight,
                indicatorColor: AppColors.primaryDark,
              );
            } else if (state.status == DownlineStatus.loaded) {
              if (state.downlines.isEmpty) {
                return Center(
                  child: Text(
                    'No downlines available',
                    style: TextStyle(
                      color: AppColors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20.0),
                  child: Column(
                    children: [
                      _SearchTextField(),
                      SizedBox(height: 20),
                      Expanded(
                        child: RefreshIndicator(
                          onRefresh: () async {
                            downlineCubit.reset();
                            await downlineCubit.fetchDownlines();
                          },
                          child: _DownlineList(
                            downlines: state.downlines,
                            scrollController: _scrollController,
                          ),
                        ),
                      ),
                      if (state.isFetching)
                        CircularProgressIndicator(
                          color: AppColors.primaryDark,
                          strokeWidth: 2,
                        ),
                    ],
                  ),
                );
              }
            } else if (state.status == DownlineStatus.error) {
              return Center(
                child: Text('Error fetching downlines'),
              );
            } else {
              return SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}

class _SearchTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (query) {
        // downlineViewModel.filterProfiles(query);
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(12),
        fillColor: AppColors.white,
        filled: true,
        hintText: 'Search',
        hintStyle: TextStyle(
          color: AppColors.grey,
          fontSize: 18,
          fontWeight: FontWeight.w300,
        ),
        suffixIcon: Icon(Icons.search),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryDark),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(),
        ),
      ),
    );
  }
}

class _DownlineList extends StatelessWidget {
  final List<UserDownlineModel> downlines;
  final ScrollController scrollController;

  const _DownlineList({
    required this.downlines,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: downlines.length,
      itemBuilder: (context, index) {
        final profile = downlines[index];
        return ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 6),
          leading: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                image: NetworkImage(profile.profilePhotoURL),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
            '${profile.firstName} ${profile.lastName}',
            style: TextStyle(
              color: AppColors.primaryDark,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          trailing: ElevatedButton(
            onPressed: () {
              context.router.push(ProfileViewRoute(profileId: profile.id));
            },
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              backgroundColor: MaterialStateProperty.all(AppColors.primaryDark),
            ),
            child: Text(
              'View Profile',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        );
      },
    );
  }
}
