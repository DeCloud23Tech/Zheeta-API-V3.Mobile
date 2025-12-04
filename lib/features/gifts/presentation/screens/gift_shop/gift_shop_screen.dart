import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/utils/pagination_controller.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/gifts/data/models/gift_model.dart';
import 'package:zheeta/features/gifts/presentation/cubits/all_gifts_cubit/all_gifts_cubit.dart';
import 'package:zheeta/features/profile/presentation/widgets/search_field.dart';
import 'package:zheeta/router/app_router.gr.dart';
import 'package:zheeta/shared/widgets/back_button.dart';
import 'package:zheeta/shared/widgets/loader.dart';

@RoutePage()
class GiftShopScreen extends StatefulWidget {
  const GiftShopScreen({super.key});

  @override
  State<GiftShopScreen> createState() => _GiftShopScreenState();
}

class _GiftShopScreenState extends State<GiftShopScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<GiftModel> filteredGifts = [];
  final ScrollController _scrollController = ScrollController();

  late AllGiftsCubit giftsCubit;

  @override
  void initState() {
    super.initState();
    giftsCubit = locator<AllGiftsCubit>();
    _searchController.addListener(_filterGifts);

    // Load the first page
    giftsCubit.loadNextPage();

    _scrollController.addListener(_scrollListener);
  }

  void _filterGifts() {
    setState(() {
      filteredGifts = _searchController.text.isEmpty
          ? giftsCubit.state.items
          : giftsCubit.state.items
              .where((gift) => gift.title
                  .toLowerCase()
                  .contains(_searchController.text.toLowerCase()))
              .toList();
    });
  }

  void _scrollListener() {
    if (_isBottom && !giftsCubit.state.isLoading && giftsCubit.state.hasMore) {
      giftsCubit.loadNextPage();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    return _scrollController.position.pixels >=
        (_scrollController.position.maxScrollExtent * 0.9);
  }

  Future<void> _onRefresh() async {
    await giftsCubit.reset();
    giftsCubit.loadNextPage();
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
        elevation: 0,
        leading: AppBackButton(),
        title: const Text(
          'Gift Shop',
          style: TextStyle(
            color: AppColors.grayscale,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<AllGiftsCubit, PaginationState<GiftModel>>(
        bloc: giftsCubit,
        builder: (context, state) {
          if (state.isLoading && state.items.isEmpty) {
            return loadingIndicator();
          } else if (state.items.isEmpty) {
            return const Center(
              child: Text('No gifts available.'),
            );
          }

          final displayList =
              _searchController.text.isEmpty ? state.items : filteredGifts;

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
                  child: RefreshIndicator(
                    onRefresh: _onRefresh,
                    color: AppColors.primaryLight,
                    child: GridView.builder(
                      controller: _scrollController,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 18.0,
                        crossAxisSpacing: 18.0,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: displayList.length + (state.hasMore ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index == displayList.length) {
                          return loadingIndicator();
                        }

                        final gift = displayList[index];
                        return GestureDetector(
                          onTap: () {
                            context.router
                                .push(ProductDetailsRoute(gift: gift));
                          },
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CachedNetworkImage(
                                  imageUrl: gift.imageUrl,
                                  height:
                                      MediaQuery.of(context).size.width * 0.38,
                                  width:
                                      MediaQuery.of(context).size.width * 0.28,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) =>
                                      const CupertinoActivityIndicator(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.image_not_supported),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  gift.title,
                                  style: const TextStyle(
                                    color: AppColors.grayscale,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "\$${gift.amount}",
                                  style: const TextStyle(
                                    color: AppColors.primaryDark,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
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
