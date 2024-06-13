import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/gifts/data/model/gift_model.dart';
import 'package:zheeta/gifts/presentation/bloc/gift/gift_cubit.dart';
import 'package:zheeta/gifts/presentation/viewmodel/gift_viewmodel.dart';
import 'package:zheeta/widgets/drawer.dart';

import '../../../app/common/debouncer.dart';
import '../../../app/injection/di.dart';

@RoutePage()
class GiftShopScreen extends StatefulWidget {
  const GiftShopScreen({super.key});

  @override
  State<GiftShopScreen> createState() => _GiftShopScreenState();
}

class _GiftShopScreenState extends State<GiftShopScreen> {
  late GiftViewModel _giftViewModel;
  static final TextEditingController _searchController =
      TextEditingController();
  final Debouncer _debouncer = Debouncer(milliseconds: 800);
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _giftViewModel = locator<GiftViewModel>();
    _giftViewModel.fetchAllGifts();
    _searchController.addListener(_onSearchChanged);
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    // _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    _debouncer.run(() {
      _giftViewModel.searchGifts(_searchController.text);
    });
  }

  void _onScroll() {
    if (_scrollController.position.atEdge) {
      if (_scrollController.position.pixels != 0) {
        _giftViewModel.fetchNextPage();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      drawer: const SideDrawer(),
      appBar: AppBar(
        backgroundColor: AppColors.secondaryLight,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () => router.pop(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(5),
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child:
                  const Icon(Icons.arrow_back_ios_new, color: AppColors.grey),
            ),
          ),
        ),
        title: const Text(
          'Gift Shop',
          style: TextStyle(
            color: AppColors.grayscale,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              height: 46,
              child: TextFormField(
                style: const TextStyle(color: Colors.black),
                controller: _searchController,
                keyboardType: TextInputType.text,
                cursorColor: AppColors.primaryDark,
                decoration: const InputDecoration(
                  suffixIcon: Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.search),
                  ),
                  border: OutlineInputBorder(),
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                validator: (searchValue) {
                  if (searchValue!.isEmpty) {
                    return 'Please enter search keyword';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: StreamBuilder<GiftState>(
                stream: _giftViewModel.stateStream,
                builder: (context, snapshot) {
                  final state = snapshot.data;
                  if (state is GiftsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is GiftsError) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Error: ${state.errorMessage}'),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              _giftViewModel.fetchAllGifts();
                            },
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    );
                  } else if (state is GiftsSuccess) {
                    final gifts = state.gifts.data;
                    if (gifts.isEmpty) {
                      return Center(
                        child: Text(
                          'No more gifts available',
                          style: TextStyle(
                            color: AppColors.grayscale,
                            fontSize: 18,
                          ),
                        ),
                      );
                    }
                    return GridView.builder(
                      controller: _scrollController,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: gifts.length,
                      itemBuilder: (context, index) {
                        final gift = gifts[index];
                        return GestureDetector(
                          onTap: () {
                            router.push(ProductDetailsRoute(gift: gift));
                          },
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
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
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopNavBtn2 extends StatelessWidget {
  final String icon;

  const TopNavBtn2({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Scaffold.of(context).openDrawer();
      },
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(100),
          ),
          child: SvgPicture.asset(
            icon,
            width: 30,
            colorFilter:
                const ColorFilter.mode(AppColors.grey, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
