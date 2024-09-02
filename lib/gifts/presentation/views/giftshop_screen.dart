import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import '../../../app/injection/di.dart';
import '../../../widgets/loading_screen.dart';
import '../../data/model/gift_model.dart';
import '../bloc/gift/gift_cubit.dart';

@RoutePage()
class GiftShopScreen extends StatefulWidget {
  const GiftShopScreen({super.key});

  @override
  State<GiftShopScreen> createState() => _GiftShopScreenState();
}

class _GiftShopScreenState extends State<GiftShopScreen> {
  late GiftCubit giftCubit;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    giftCubit = locator<GiftCubit>();
    giftCubit.reset();
    giftCubit.fetchGifts();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      // Only fetch next page if it's not already fetching
      if (!giftCubit.state.isFetching && !giftCubit.state.hasReachedMax) {
        giftCubit.fetchGifts();
      }
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  Future<void> _onRefresh() async {
    giftCubit.reset();
    giftCubit.fetchGifts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryLight,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () => context.router.pop(),
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
          'Gift Shop',
          style: TextStyle(
            color: AppColors.grayscale,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<GiftCubit, GiftState>(
        builder: (context, state) {
          if (state.status ==  GiftsStatus.loading || state.gifts.isEmpty) {
            return LoadingScreen(
              backgroundColor: AppColors.secondaryLight,
              indicatorColor: AppColors.primaryDark,
            );
          } else if (state.status == GiftsStatus.error) {
            return Center(child: Text('Error: ${state.errorMessage}'));
          } else if (state.status == GiftsStatus.success) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Available gifts for you ',
                          style: TextStyle(
                            color: AppColors.darkText,
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Expanded(
                    child: GridBox(
                      data: state.gifts,
                      scrollController: _scrollController,
                      onRefresh: _onRefresh,
                      hasReachedMax: state.hasReachedMax,
                      isFetching: state.isFetching,
                    ),
                  ),
                ],
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}

class GridBox extends StatelessWidget {
  final List<GiftModel> data;
  final ScrollController scrollController;
  final Future<void> Function() onRefresh;
  final bool hasReachedMax;
  final bool isFetching;

  const GridBox({
    required this.data,
    required this.scrollController,
    required this.onRefresh,
    required this.hasReachedMax,
    required this.isFetching,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      color: AppColors.primaryLight,
      child: Padding(
        padding: EdgeInsets.only(left: 0.0),
        child: GridView.builder(
          controller: scrollController,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 18.0,
            crossAxisSpacing: 18.0,
            childAspectRatio: 0.65,
          ),
          itemCount: data.length + (hasReachedMax ? 0 : 1),
          itemBuilder: (context, index) {
            if (index >= data.length) {
              // Show a loading indicator at the end if more items are being fetched
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: CircularProgressIndicator(color: AppColors.primaryDark),
                ),
              );
            }
            final gift = data[index];
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
                      height: MediaQuery.of(context).size.width *
                          0.38,
                      width: MediaQuery.of(context).size.width *
                          0.28,
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
      ),
    );
  }
}
