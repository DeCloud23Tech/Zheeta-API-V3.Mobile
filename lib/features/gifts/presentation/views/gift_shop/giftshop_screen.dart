import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:zheeta/common/constants/color.dart';
import 'package:zheeta/core/injection/di.dart';
import 'package:zheeta/core/router/app_router.gr.dart';
import 'package:zheeta/features/gifts/data/model/gift_model.dart';
import 'package:zheeta/features/gifts/presentation/bloc/gift/gift_cubit.dart';
import 'package:zheeta/features/profile/presentation/widgets/search_field.dart';
import 'package:zheeta/utils/pagination_controller.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/loader.dart';

@RoutePage()
class GiftShopScreen extends StatefulWidget {
  const GiftShopScreen({super.key});

  @override
  State<GiftShopScreen> createState() => _GiftShopScreenState();
}

class _GiftShopScreenState extends State<GiftShopScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<GiftModel> filteredGifts = [];

  late PaginatedListController<GiftModel, GiftCubit, GiftState>
      _giftsPaginatedController;
  final ScrollController _scrollController = ScrollController();
  GiftCubit giftsCubit = locator<GiftCubit>();

  @override
  void initState() {
    super.initState();

    _searchController.addListener(_filterGifts);

    // Initialize the paginated controller
    _giftsPaginatedController =
        PaginatedListController<GiftModel, GiftCubit, GiftState>(
      fetchItems: (param) => giftsCubit.fetchGifts(param),
      cubit: giftsCubit,
    );

    // Add scroll listener to load more items when reaching the bottom
    _scrollController.addListener(_scrollListener);

    // Load the initial page of gifts
    _loadGiftsPage();
  }

  void _filterGifts() {
    setState(() {
      filteredGifts = _giftsPaginatedController.items.where((gift) {
        return gift.title
            .toLowerCase()
            .contains(_searchController.text.toLowerCase());
      }).toList();
    });
  }

  void _loadGiftsPage() {
    // Load the next page of gifts
    _giftsPaginatedController.loadNextPage(
      successCondition: (state) => state.status == GiftsStatus.success,
      extractItems: (state) => state.gifts,
      isError: (state) => state.status == GiftsStatus.error,
    );
  }

  void _scrollListener() {
    if (_isBottom) {
      _loadGiftsPage();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    return currentScroll >=
        (maxScroll * 0.9); // Trigger loading when 90% scrolled
  }

  Future<void> _onRefresh() async {
    _giftsPaginatedController.reset();
    _loadGiftsPage();
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
          'Gift Shop',
          style: TextStyle(
            color: AppColors.grayscale,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<GiftCubit, GiftState>(
        builder: (context, state) {
          if (state.status == GiftsStatus.loading &&
              _giftsPaginatedController.items.isEmpty) {
            return loadingIndicator();
          } else if (state.status == GiftsStatus.success &&
              _giftsPaginatedController.items.isEmpty) {
            return Center(
              child: Text(
                'No gifts available.',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryDark),
              ),
            );
          }

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
                  padding: const EdgeInsets.only(
                      top: 20.0, left: 20.0, right: 20.0),
                  child: GridBox(
                    scrollController: _scrollController,
                    giftsPaginatedController: _giftsPaginatedController,
                    items: filteredGifts.isEmpty &&
                            _searchController.text.isEmpty
                        ? _giftsPaginatedController.items
                        : filteredGifts,
                    onRefresh: _onRefresh,
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

class GridBox extends StatelessWidget {
  final ScrollController scrollController;
  final List<GiftModel> items;
  final PaginatedListController<GiftModel, GiftCubit, GiftState>
      giftsPaginatedController;
  final Future<void> Function() onRefresh;

  const GridBox({super.key,
    required this.scrollController,
    required this.items,
    required this.giftsPaginatedController,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      color: AppColors.primaryLight,
      child: GridView.builder(
        controller: scrollController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 18.0,
          crossAxisSpacing: 18.0,
          childAspectRatio: 0.75,
        ),
        itemCount: items.length + 1,
        itemBuilder: (context, index) {
          // Display loading indicator if loading more items
          if (index == items.length) {
            return giftsPaginatedController.hasMoreItems &&
                    items.length >= giftsPaginatedController.pageSize
                ? loadingIndicator()
                : const SizedBox.shrink();
          }

          // Render each gift item
          final gift = items[index];
          return GestureDetector(
            onTap: () {
              context.router.push(ProductDetailsRoute(gift: gift));
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
                    height: MediaQuery.of(context).size.width * 0.38,
                    width: MediaQuery.of(context).size.width * 0.28,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const CupertinoActivityIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
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
    );
  }
}
