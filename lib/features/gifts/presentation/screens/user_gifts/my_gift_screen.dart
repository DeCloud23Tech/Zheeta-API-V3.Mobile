import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/utils/pagination_controller.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/gifts/data/models/received_gift_model.dart';
import 'package:zheeta/features/gifts/data/models/sent_gift_model.dart';
import 'package:zheeta/features/gifts/presentation/cubits/gift_cubit/gift_cubit.dart';
import 'package:zheeta/features/gifts/presentation/cubits/received_gifts_cubit/received_gifts_cubit.dart';
import 'package:zheeta/router/app_router.gr.dart';
import 'package:zheeta/shared/widgets/back_button.dart';
import 'package:zheeta/shared/widgets/loader.dart';
import 'package:zheeta/shared/widgets/primary_button.dart';

import '../../cubits/sent_gifts_cubit/sent_gifts_cubit.dart'
    show SentGiftsCubit;

@RoutePage()
class MyGiftScreen extends StatefulWidget {
  const MyGiftScreen({super.key});

  @override
  State<MyGiftScreen> createState() => _MyGiftScreenState();
}

class _MyGiftScreenState extends State<MyGiftScreen> {
  late ReceivedGiftsCubit _receivedGiftsCubit;
  late SentGiftsCubit _sentGiftsCubit;

  final ScrollController _receivedGiftsScrollController = ScrollController();
  final ScrollController _sentGiftsScrollController = ScrollController();

  int activeTab = 1;

  @override
  void initState() {
    super.initState();
    _receivedGiftsCubit = locator<ReceivedGiftsCubit>();
    _sentGiftsCubit = locator<SentGiftsCubit>();

    // Load initial pages
    _receivedGiftsCubit.reset();
    _sentGiftsCubit.reset();

    _receivedGiftsScrollController.addListener(() {
      if (_isReceivedGiftsBottom) _receivedGiftsCubit.loadNextPage();
    });
    _sentGiftsScrollController.addListener(() {
      if (_isSentGiftsBottom) _sentGiftsCubit.loadNextPage();
    });
  }

  bool get _isReceivedGiftsBottom {
    if (!_receivedGiftsScrollController.hasClients) return false;
    final maxScroll = _receivedGiftsScrollController.position.maxScrollExtent;
    final currentScroll = _receivedGiftsScrollController.position.pixels;
    return currentScroll >= (maxScroll * 0.9);
  }

  bool get _isSentGiftsBottom {
    if (!_sentGiftsScrollController.hasClients) return false;
    final maxScroll = _sentGiftsScrollController.position.maxScrollExtent;
    final currentScroll = _sentGiftsScrollController.position.pixels;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void dispose() {
    _receivedGiftsScrollController.dispose();
    _sentGiftsScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.secondaryLight,
        leading: AppBackButton(),
        title: Text(
          'My Gifts',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _buildTabBar(),
            SizedBox(height: 10),
            Expanded(child: _buildTabContent()),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTabButton(1, "Received Gifts"),
          _buildTabButton(2, "Sent Gifts"),
        ],
      ),
    );
  }

  Widget _buildTabButton(int tabIndex, String text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          activeTab = tabIndex;
        });
      },
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            Container(
              height: 3,
              width: MediaQuery.of(context).size.width * 0.44,
              decoration: BoxDecoration(
                color: activeTab == tabIndex
                    ? AppColors.primaryDark
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            SizedBox(height: 5),
            Text(
              text,
              style: TextStyle(
                color: activeTab == tabIndex
                    ? AppColors.grayscale
                    : AppColors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    return activeTab == 1 ? _buildReceivedGiftsList() : _buildSentGiftsList();
  }

  Widget _buildReceivedGiftsList() {
    return BlocBuilder<ReceivedGiftsCubit, PaginationState<ReceivedGiftModel>>(
      bloc: _receivedGiftsCubit,
      builder: (context, state) {
        if (state.isLoading && state.items.isEmpty) {
          return loadingIndicator();
        } else if (state.items.isEmpty) {
          return Center(
            child: Text(
              'No received gifts.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          );
        }

        return ListView.builder(
          controller: _receivedGiftsScrollController,
          itemCount:
              state.hasMore ? state.items.length + 1 : state.items.length,
          itemBuilder: (context, index) {
            if (index >= state.items.length) {
              return state.hasMore ? loadingIndicator() : SizedBox.shrink();
            }

            final gift = state.items[index];
            return _buildGiftItem(
              gift.title,
              gift.totalAmount,
              gift.createdDate,
              gift.senderUserName ?? '',
              gift.imageFileURL,
              actionLabel: "Redeem Now",
              action: () {
                context.router.push(RedeemGiftDetailRoute(
                    totalAmount: gift.totalAmount, giftId: gift.id));
              },
            );
          },
        );
      },
    );
  }

  Widget _buildSentGiftsList() {
    return BlocBuilder<SentGiftsCubit, PaginationState<SentGiftModel>>(
      bloc: _sentGiftsCubit,
      builder: (context, state) {
        if (state.isLoading && state.items.isEmpty) {
          return loadingIndicator();
        } else if (state.items.isEmpty) {
          return Center(
            child: Text(
              'No sent gifts.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          );
        }

        return ListView.builder(
          controller: _sentGiftsScrollController,
          itemCount:
              state.hasMore ? state.items.length + 1 : state.items.length,
          itemBuilder: (context, index) {
            if (index >= state.items.length) {
              return state.hasMore ? loadingIndicator() : SizedBox.shrink();
            }

            final gift = state.items[index];
            return _buildGiftItem(
              gift.title,
              gift.totalAmount,
              gift.createdDate,
              gift.receiverUserName ?? '',
              gift.imageFileURL,
            );
          },
        );
      },
    );
  }

  Widget _buildGiftItem(
    String title,
    double amount,
    DateTime date,
    String userName,
    String imageUrl, {
    String? actionLabel,
    VoidCallback? action,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.grayscale.withValues(alpha: 0.06),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        imageUrl: imageUrl,
                        // height: MediaQuery.of(context).size.width * 0.38,
                        // width: MediaQuery.of(context).size.width * 0.28,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            const CupertinoActivityIndicator(
                          color: AppColors.primaryLight,
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.image_not_supported),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: TextStyle(
                              color: AppColors.grayscale,
                              fontSize: 14,
                              fontWeight: FontWeight.w400)),
                      SizedBox(height: 5),
                      Text("\$$amount",
                          style: TextStyle(
                              color: AppColors.primaryDark,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                      SizedBox(height: 5),
                      Text(DateFormat('d,MMMM y').format(date),
                          style: TextStyle(
                              color: AppColors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w400)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            _buildInfoRow(
                actionLabel != null ? "Sender" : "Recipient", userName),
            if (actionLabel != null && action != null)
              _buildActionButton(actionLabel, action),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                  color: AppColors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400)),
          Text(value,
              style: TextStyle(
                  color: AppColors.grayscale,
                  fontSize: 14,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _buildActionButton(String title, VoidCallback action) {
    return SizedBox(
      width: double.infinity,
      height: 30,
      child: PrimaryButton(
        title: title,
        action: action,
      ),
    );
  }
}
