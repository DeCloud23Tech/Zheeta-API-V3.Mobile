import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/gifts/presentation/bloc/gift/gift_cubit.dart';
import 'package:zheeta/widgets/primary_button.dart';

import '../../../app/injection/di.dart';
import '../../../app/router/app_router.gr.dart';
import '../../../widgets/loading_screen.dart';
import '../../data/model/received_gift_model.dart';
import '../../data/model/sent_gift_model.dart';

@RoutePage()
class MyGiftScreen extends StatefulWidget {
  const MyGiftScreen({super.key});

  @override
  State<MyGiftScreen> createState() => _MyGiftScreenState();
}

class _MyGiftScreenState extends State<MyGiftScreen> {
  late GiftCubit _giftCubit;
  int activeTab = 1;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _giftCubit = locator<GiftCubit>();
    _scrollController.addListener(_onScroll);
    _giftCubit.reset();
    _fetchGifts();
  }

  void _fetchGifts() {
    if (activeTab == 1) {
      _giftCubit.fetchReceivedGifts();
    } else {
      _giftCubit.fetchSentGifts();
    }
  }

  void _onScroll() {
    if (_isBottom) {
      if (!_giftCubit.state.isFetching && !_giftCubit.state.hasReachedMax) {
        _fetchGifts();
      }
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
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
          'My gifts',
          style: TextStyle(
            color: AppColors.grayscale,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTabBar(),
                SizedBox(height: 20),
                BlocBuilder<GiftCubit, GiftState>(
                  builder: (context, state) {
                    if (state.isFetching && state.gifts.isEmpty) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryDark,
                          strokeWidth: 2,
                        ),
                      );
                    } else if (state.errorMessage.isNotEmpty) {
                      return Center(
                        child: Text('Error: ${state.errorMessage}'),
                      );
                    } else if (activeTab == 1 &&
                        state.receivedGifts.isNotEmpty) {
                      return _buildReceivedGifts(state.receivedGifts);
                    } else if (activeTab == 2 && state.sentGifts.isNotEmpty) {
                      return _buildSentGifts(state.sentGifts);
                    } else {
                      return Center(child: Text('No gifts found.'));
                    }
                  },
                ),
                if (_giftCubit.state.isFetching &&
                    _giftCubit.state.gifts.isNotEmpty)
                  Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryDark,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                activeTab = 1;
              });
              _giftCubit.reset();
              _fetchGifts();
            },
            child: Container(
              color: Colors.transparent,
              child: Column(
                children: [
                  Container(
                    height: 3,
                    width: MediaQuery.of(context).size.width * 0.44,
                    decoration: BoxDecoration(
                      color: activeTab == 1
                          ? AppColors.primaryDark
                          : Colors.transparent,
                      border: Border(),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Received Gifts",
                    style: TextStyle(
                      color:
                          activeTab == 1 ? AppColors.grayscale : AppColors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                activeTab = 2;
              });
              _giftCubit.reset();
              _fetchGifts();
            },
            child: Container(
              color: Colors.transparent,
              child: Column(
                children: [
                  Container(
                    height: 3,
                    width: MediaQuery.of(context).size.width * 0.44,
                    decoration: BoxDecoration(
                      color: activeTab == 2
                          ? AppColors.primaryDark
                          : Colors.transparent,
                      border: Border(),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Sent Gifts",
                    style: TextStyle(
                      color:
                          activeTab == 2 ? AppColors.grayscale : AppColors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReceivedGifts(List<ReceivedGiftModel> gifts) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: gifts.map((gift) => _buildGiftItem(gift)).toList(),
    );
  }

  Widget _buildSentGifts(List<SentGiftModel> gifts) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: gifts.map((gift) => _buildSentGiftItem(gift)).toList(),
    );
  }

  Widget _buildGiftItem(ReceivedGiftModel gift) {
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
                color: AppColors.grayscale.withOpacity(0.06),
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
                      child: Image.network(
                        gift.imageFileURL,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        gift.title,
                        style: TextStyle(
                          color: AppColors.grayscale,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "\$${gift.totalAmount}",
                        style: TextStyle(
                          color: AppColors.primaryDark,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '${DateFormat('d,MMMM y').format(gift.createdDate)}',
                        style: TextStyle(
                          color: AppColors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            _buildInfoRow("Sender", gift.senderUserName),
            _buildInfoRow("Quantity", "${gift.totalQuantity} Unit"),
            _buildActionButton("Redeem Now", () {
              context.router.push(RedeemGiftDetailRoute(
                  totalAmount: gift.totalAmount, giftId: gift.id));
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildSentGiftItem(SentGiftModel gift) {
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
                color: AppColors.grayscale.withOpacity(0.06),
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
                      child: Image.network(
                        gift.imageFileURL,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        gift.title,
                        style: TextStyle(
                          color: AppColors.grayscale,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "\$${gift.totalAmount}",
                        style: TextStyle(
                          color: AppColors.primaryDark,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '${DateFormat('d,MMMM y').format(gift.createdDate)}',
                        style: TextStyle(
                          color: AppColors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            _buildInfoRow("Recipient", gift.receiverUserName),
            _buildInfoRow("Quantity", "${gift.totalQuantity} Unit"),
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
          Text(
            label,
            style: TextStyle(
              color: AppColors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: AppColors.grayscale,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String title, VoidCallback action,
      {bool invert = false}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 30,
      child: PrimaryButton(
        title: title,
        action: action,
        invert: invert,
      ),
    );
  }
}
