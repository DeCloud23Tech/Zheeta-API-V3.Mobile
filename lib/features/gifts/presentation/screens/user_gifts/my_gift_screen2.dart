// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:zheeta/core/constants/color.dart';
// import 'package:zheeta/core/utils/pagination_controller.dart';
// import 'package:zheeta/di/di.dart';
// import 'package:zheeta/features/gifts/data/models/received_gift_model.dart';
// import 'package:zheeta/features/gifts/data/models/sent_gift_model.dart';
// import 'package:zheeta/features/gifts/presentation/cubits/gift_cubit/gift_cubit.dart';
// import 'package:zheeta/router/app_router.gr.dart';
// import 'package:zheeta/shared/widgets/back_button.dart';
// import 'package:zheeta/shared/widgets/loader.dart';
// import 'package:zheeta/shared/widgets/primary_button.dart';
//
// @RoutePage()
//
//
// class MyGiftScreen extends StatefulWidget {
//   const MyGiftScreen({super.key});
//
//   @override
//   State<MyGiftScreen> createState() => _MyGiftScreenState();
// }
//
// class _MyGiftScreenState extends State<MyGiftScreen> {
//   late PaginatedListController<ReceivedGiftModel, GiftCubit, GiftState>
//       _receivedGiftsPaginatedController;
//   late PaginatedListController<SentGiftModel, GiftCubit, GiftState>
//       _sentGiftsPaginatedController;
//
//   final ScrollController _receivedGiftsScrollController = ScrollController();
//   final ScrollController _sentGiftsScrollController = ScrollController();
//
//   final GiftCubit _giftCubit = locator<GiftCubit>();
//   int activeTab = 1;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Initialize paginated controllers for received and sent gifts
//     _initializeReceivedGiftsPagination();
//     _initializeSentGiftsPagination();
//
//     // Add scroll listeners
//     _receivedGiftsScrollController.addListener(_scrollListener);
//     _sentGiftsScrollController.addListener(_scrollListener);
//
//     // Load the initial data based on the active tab
//     _loadInitialDataForActiveTab();
//   }
//
//   void _initializeReceivedGiftsPagination() {
//     _receivedGiftsPaginatedController =
//         PaginatedListController<ReceivedGiftModel, GiftCubit, GiftState>(
//       fetchItems: (param) => _giftCubit.fetchReceivedGifts(param),
//       cubit: _giftCubit,
//     );
//   }
//
//   void _initializeSentGiftsPagination() {
//     _sentGiftsPaginatedController =
//         PaginatedListController<SentGiftModel, GiftCubit, GiftState>(
//       fetchItems: (param) => _giftCubit.fetchSentGifts(param),
//       cubit: _giftCubit,
//     );
//   }
//
//   void _loadInitialDataForActiveTab() {
//     if (activeTab == 1) {
//       _loadReceivedGiftsPage();
//     } else if (activeTab == 2) {
//       _loadSentGiftsPage();
//     }
//   }
//
//   void _resetPaginationForActiveTab() {
//     if (activeTab == 1) {
//       _receivedGiftsPaginatedController.reset();
//     } else if (activeTab == 2) {
//       _sentGiftsPaginatedController.reset();
//     }
//   }
//
//   void _loadReceivedGiftsPage() {
//     _receivedGiftsPaginatedController.loadNextPage(
//       successCondition: (state) => state.status == GiftsStatus.success,
//       extractItems: (state) => state.receivedGifts,
//       isError: (state) => state.status == GiftsStatus.error,
//     );
//   }
//
//   void _loadSentGiftsPage() {
//     _sentGiftsPaginatedController.loadNextPage(
//       successCondition: (state) => state.status == GiftsStatus.success,
//       extractItems: (state) => state.sentGifts,
//       isError: (state) => state.status == GiftsStatus.error,
//     );
//   }
//
//   void _scrollListener() {
//     if (activeTab == 1 && _isReceivedGiftsBottom) {
//       _loadReceivedGiftsPage();
//     } else if (activeTab == 2 && _isSentGiftsBottom) {
//       _loadSentGiftsPage();
//     }
//   }
//
//   bool get _isReceivedGiftsBottom {
//     if (!_receivedGiftsScrollController.hasClients) return false;
//     final maxScroll = _receivedGiftsScrollController.position.maxScrollExtent;
//     final currentScroll = _receivedGiftsScrollController.position.pixels;
//     return currentScroll >= (maxScroll * 0.9);
//   }
//
//   bool get _isSentGiftsBottom {
//     if (!_sentGiftsScrollController.hasClients) return false;
//     final maxScroll = _sentGiftsScrollController.position.maxScrollExtent;
//     final currentScroll = _sentGiftsScrollController.position.pixels;
//     return currentScroll >= (maxScroll * 0.9);
//   }
//
//   @override
//   void dispose() {
//     _receivedGiftsScrollController.dispose();
//     _sentGiftsScrollController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.secondaryLight,
//       appBar: AppBar(
//         elevation: 0,
//         centerTitle: true,
//         backgroundColor: AppColors.secondaryLight,
//         surfaceTintColor: AppColors.secondaryLight,
//         scrolledUnderElevation: 0.5,
//         shadowColor: Colors.grey,
//         leadingWidth: MediaQuery.of(context).size.width * 0.2,
//         leading: Row(
//           children: [
//             AppBackButton(),
//           ],
//         ),
//         title: Text(
//           'My Gifts',
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//         ),
//         actions: [
//           // SvgPicture.asset('assets/images/icons/search.svg'),
//           // SizedBox(width: 16),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           children: [
//             _buildTabBar(),
//             SizedBox(height: 10),
//             Expanded(child: _buildTabContent()),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTabBar() {
//     return Container(
//       height: 40,
//       width: MediaQuery.of(context).size.width,
//       decoration: BoxDecoration(
//         color: AppColors.white,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           _buildTabButton(1, "Received Gifts"),
//           _buildTabButton(2, "Sent Gifts"),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildTabButton(int tabIndex, String text) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           activeTab = tabIndex;
//           _resetPaginationForActiveTab();
//         });
//         _loadInitialDataForActiveTab();
//       },
//       child: Container(
//         color: Colors.transparent,
//         child: Column(
//           children: [
//             Container(
//               height: 3,
//               width: MediaQuery.of(context).size.width * 0.44,
//               decoration: BoxDecoration(
//                 color: activeTab == tabIndex
//                     ? AppColors.primaryDark
//                     : Colors.transparent,
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//             SizedBox(height: 5),
//             Text(
//               text,
//               style: TextStyle(
//                 color: activeTab == tabIndex
//                     ? AppColors.grayscale
//                     : AppColors.grey,
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTabContent() {
//     return activeTab == 1 ? _buildReceivedGiftsList() : _buildSentGiftsList();
//   }
//
//   Widget _buildReceivedGiftsList() {
//     return BlocConsumer<GiftCubit, GiftState>(
//       // listenWhen: (previous, current) =>
//       // current.status == !GiftsStatus.redeemedGift,
//       listener: (context, state) {
//         if (state.status == GiftsStatus.redeemedGift) {
//           // _resetPaginationForActiveTab();
//           // _loadInitialDataForActiveTab();
//         }
//       },
//       builder: (context, state) {
//         if (state.status == GiftsStatus.loading &&
//             _receivedGiftsPaginatedController.items.isEmpty) {
//           return loadingIndicator();
//         } else if (state.status == GiftsStatus.success &&
//             _receivedGiftsPaginatedController.items.isEmpty) {
//           return Center(
//             child: Text(
//               'No received gifts.',
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w500,
//                 color: AppColors.primaryDark,
//               ),
//             ),
//           );
//         }
//
//         return ListView.builder(
//           controller: _receivedGiftsScrollController,
//           itemCount: _receivedGiftsPaginatedController.items.length + 1,
//           itemBuilder: (context, index) {
//             if (index == _receivedGiftsPaginatedController.items.length) {
//               return _receivedGiftsPaginatedController.hasMoreItems &&
//                       (_receivedGiftsPaginatedController.items.length >=
//                           _receivedGiftsPaginatedController.pageSize)
//                   ? loadingIndicator()
//                   : SizedBox.shrink();
//             }
//
//             final gift = _receivedGiftsPaginatedController.items[index];
//             return Padding(
//               padding: const EdgeInsets.only(bottom: 10.0),
//               child: Container(
//                 padding: EdgeInsets.all(15),
//                 decoration: BoxDecoration(
//                   color: AppColors.white,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Column(
//                   children: [
//                     Container(
//                       padding: EdgeInsets.all(10),
//                       decoration: BoxDecoration(
//                         color: AppColors.grayscale.withValues(alpha: 0.06),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             height: 80,
//                             width: 80,
//                             padding: EdgeInsets.all(1),
//                             decoration: BoxDecoration(
//                               color: AppColors.white,
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(8),
//                               child: Image.network(
//                                 gift.imageFileURL,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                           SizedBox(width: 10),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 gift.title,
//                                 style: TextStyle(
//                                   color: AppColors.grayscale,
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ),
//                               SizedBox(height: 5),
//                               Text(
//                                 "\$${gift.totalAmount}",
//                                 style: TextStyle(
//                                   color: AppColors.primaryDark,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                               SizedBox(height: 5),
//                               Text(
//                                 DateFormat('d,MMMM y').format(gift.createdDate),
//                                 style: TextStyle(
//                                   color: AppColors.grey,
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     _buildInfoRow("Sender", gift.senderUserName ?? ''),
//                     _buildInfoRow("Quantity", "${gift.totalQuantity} Unit"),
//                     _buildActionButton("Redeem Now", () {
//                       context.router.push(RedeemGiftDetailRoute(
//                           totalAmount: gift.totalAmount, giftId: gift.id));
//                     }),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
//
//   Widget _buildSentGiftsList() {
//     return BlocBuilder<GiftCubit, GiftState>(
//       builder: (context, state) {
//         if (state.status == GiftsStatus.loading &&
//             _sentGiftsPaginatedController.items.isEmpty) {
//           return loadingIndicator();
//         } else if (state.status == GiftsStatus.success &&
//             _sentGiftsPaginatedController.items.isEmpty) {
//           return Center(
//             child: Text(
//               'No sent gifts.',
//               style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                   color: AppColors.primaryDark),
//             ),
//           );
//         }
//
//         return ListView.builder(
//           controller: _sentGiftsScrollController,
//           itemCount: _sentGiftsPaginatedController.items.length + 1,
//           itemBuilder: (context, index) {
//             if (index == _sentGiftsPaginatedController.items.length) {
//               return _sentGiftsPaginatedController.hasMoreItems &&
//                       (_sentGiftsPaginatedController.items.length >=
//                           _sentGiftsPaginatedController.pageSize)
//                   ? loadingIndicator()
//                   : SizedBox.shrink();
//             }
//
//             final gift = _sentGiftsPaginatedController.items[index];
//             return Padding(
//               padding: const EdgeInsets.only(bottom: 10.0),
//               child: Container(
//                 padding: EdgeInsets.all(15),
//                 decoration: BoxDecoration(
//                   color: AppColors.white,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Column(
//                   children: [
//                     Container(
//                       padding: EdgeInsets.all(10),
//                       decoration: BoxDecoration(
//                         color: AppColors.grayscale.withValues(alpha: 0.06),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             height: 80,
//                             width: 80,
//                             padding: EdgeInsets.all(1),
//                             decoration: BoxDecoration(
//                               color: AppColors.white,
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(8),
//                               child: Image.network(
//                                 gift.imageFileURL,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                           SizedBox(width: 10),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 gift.title,
//                                 style: TextStyle(
//                                   color: AppColors.grayscale,
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ),
//                               SizedBox(height: 5),
//                               Text(
//                                 "\$${gift.totalAmount}",
//                                 style: TextStyle(
//                                   color: AppColors.primaryDark,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                               SizedBox(height: 5),
//                               Text(
//                                 '${DateFormat('d,MMMM y').format(gift.createdDate)}',
//                                 style: TextStyle(
//                                   color: AppColors.grey,
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     _buildInfoRow("Recipient", gift.receiverUserName ?? ''),
//                     _buildInfoRow("Quantity", "${gift.totalQuantity} Unit"),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }
//
// Widget _buildInfoRow(String label, String value) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(vertical: 5.0),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           label,
//           style: TextStyle(
//             color: AppColors.grey,
//             fontSize: 14,
//             fontWeight: FontWeight.w400,
//           ),
//         ),
//         Text(
//           value,
//           style: TextStyle(
//             color: AppColors.grayscale,
//             fontSize: 14,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       ],
//     ),
//   );
// }
//
// Widget _buildActionButton(String title, VoidCallback action,
//     {bool invert = false}) {
//   return Builder(builder: (context) {
//     return SizedBox(
//       width: MediaQuery.of(context).size.width,
//       height: 30,
//       child: PrimaryButton(
//         title: title,
//         action: action,
//         invert: invert,
//       ),
//     );
//   });
// }
