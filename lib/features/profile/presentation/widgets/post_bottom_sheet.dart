import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/common/constants/color.dart';
import 'package:zheeta/core/injection/di.dart';
import 'package:zheeta/features/profile/data/model/user_profile_model.dart';
import 'package:zheeta/features/profile/presentation/bloc/profile_cubit/profile_cubit.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/media_container.dart';


class UserPostsBottomSheetView extends StatefulWidget {
  final String subscriptionPlan;
  final Function(List<UserCarousels>) onSelect;
  final List<UserCarousels> selectedMedias;
  final ScrollController scrollController;

  const UserPostsBottomSheetView({
    super.key,
    required this.selectedMedias,
    required this.onSelect,
    required this.subscriptionPlan,
    required this.scrollController,
  });

  @override
  UserPostsBottomSheetViewState createState() =>
      UserPostsBottomSheetViewState();
}

class UserPostsBottomSheetViewState extends State<UserPostsBottomSheetView> {
  late List<UserCarousels> _selectedMedias;

  @override
  void initState() {
    super.initState();
    _selectedMedias = List.from(widget.selectedMedias);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xffFFF1F7),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      ),
      child: Stack(
        children: [
          ListView(
            controller: widget.scrollController,
            children: [
              const SizedBox(height: 8),
              Center(
                child: Container(
                  width: 50,
                  height: 4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Color(0xffDADADA)),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AppBackButton(
                    onTap: () => Navigator.of(context).pop(),
                  ),
                  Flexible(
                    child: Text(
                      'Select Media for Promote profile',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
              const SizedBox(height: 5),
              Divider(color: AppColors.grey.withOpacity(0.5)),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                child: SelectPostsWidget(
                  subscriptionPlan: widget.subscriptionPlan,
                  selectedMedias: _selectedMedias,
                  onSelectionChanged: (selectedMedias) {
                    setState(() {
                      _selectedMedias = selectedMedias;
                    });
                  },
                  scrollController: widget.scrollController,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
          Positioned(
            bottom: 25,
            left: 5,
            right: 5,
            child: Visibility(
              visible: _selectedMedias.isNotEmpty,
              child: Container(
                color: AppColors.secondarySwirl,
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _selectedMedias.length,
                            itemBuilder: (context, index) {
                              final media = _selectedMedias[index];
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    media.carouselPhotoUrl.isNotEmpty
                                        ? media.carouselPhotoUrl
                                        : 'assets/images/placeholder.png',
                                    height: 54,
                                    width: 54,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          widget.onSelect(_selectedMedias);
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          size: 48,
                          Icons.check_circle,
                          color: AppColors.primaryDark,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SelectPostsWidget extends StatefulWidget {
  final String subscriptionPlan;
  final List<UserCarousels> selectedMedias;
  final Function(List<UserCarousels>) onSelectionChanged;
  final ScrollController scrollController;

  const SelectPostsWidget({
    super.key,
    required this.selectedMedias,
    required this.onSelectionChanged,
    required this.subscriptionPlan,
    required this.scrollController,
  });

  @override
  SelectPostsWidgetState createState() => SelectPostsWidgetState();
}

class SelectPostsWidgetState extends State<SelectPostsWidget> {
  late List<UserCarousels> _selectedMedias;
  late ProfileCubit profileCubit;

  @override
  void initState() {
    super.initState();
    profileCubit = locator<ProfileCubit>();
    _selectedMedias = List.from(widget.selectedMedias);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoadedState) {
          final List<UserCarousels>? medias =
              state.profile?.data?.userCarousels;
          return LayoutBuilder(
            builder: (context, constraints) {
              return Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: Wrap(
                    runSpacing: 10,
                    spacing: 2,
                    alignment: WrapAlignment.spaceBetween,
                    runAlignment: WrapAlignment.spaceBetween,
                    children: medias!
                        .where((e) =>
                            e.carouselPhotoUrl != null &&
                            e.carouselPhotoUrl.isNotEmpty)
                        .map((e) => InkWell(
                              onTap: () {
                                setState(() {
                                  // Simplified logic
                                  if (_selectedMedias.contains(e)) {
                                    _selectedMedias.remove(e);
                                  } else {
                                    if (widget.subscriptionPlan.isNotEmpty &&
                                        _selectedMedias.isNotEmpty) {
                                      _selectedMedias = [e];
                                    } else {
                                      _selectedMedias.add(e);
                                    }
                                  }
                                  widget.onSelectionChanged(_selectedMedias);
                                });
                              },
                              child: Stack(
                                children: [
                                  SizedBox(
                                    width: constraints.maxWidth / 3.2,
                                    child: MediaContainer(
                                        mediaPath: e.carouselPhotoUrl),
                                  ),
                                  if (_selectedMedias.contains(e))
                                    Positioned(
                                      bottom: 0,
                                      right: 8,
                                      child: Container(
                                        padding: const EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                          color: AppColors.primaryDark,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(7.0),
                                          child: Text(
                                            (_selectedMedias.indexOf(e) + 1)
                                                .toString(),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ))
                        .toList(),
                  ),
                ),
              );
            },
          );
        } else {
          return const Center(child: Text('No posts available.'));
        }
      },
    );
  }
}

Future userPostsBottomSheet(
    BuildContext context,
    String subscriptionPlan,
    List<UserCarousels> selectedMedias,
    Function(List<UserCarousels>) onSelect) {
  return showModalBottomSheet(
    context: context,
    isDismissible: true,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.5,
        minChildSize: 0.47,
        maxChildSize: 0.9,
        builder: (context, scrollController) {
          return UserPostsBottomSheetView(
            subscriptionPlan: subscriptionPlan,
            selectedMedias: selectedMedias,
            onSelect: onSelect,
            scrollController: scrollController,
          );
        },
      );
    },
  );
}
