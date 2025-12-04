import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/constants/lists.dart';
import 'package:zheeta/core/mixin/validation_mixin.dart';
import 'package:zheeta/core/utils/notify.dart';
import 'package:zheeta/core/utils/pagination_controller.dart';
import 'package:zheeta/core/utils/token_utils.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/models/payment_types_model.dart';
import 'package:zheeta/features/payment_and_subscriptions/domain/usecases/get_payment_link_usecase.dart';
import 'package:zheeta/features/payment_and_subscriptions/presentation/cubits/payment_cubit/payment_cubit.dart';
import 'package:zheeta/features/payment_and_subscriptions/presentation/screens/fund_wallet/payment_link_screen.dart';
import 'package:zheeta/features/profile/presentation/widgets/search_field.dart';
import 'package:zheeta/shared/widgets/back_button.dart';
import 'package:zheeta/shared/widgets/input_field.dart';
import 'package:zheeta/shared/widgets/loader.dart';
import 'package:zheeta/shared/widgets/primary_button.dart';

@RoutePage()
class PaymentTypeScreen extends StatelessWidget {
  const PaymentTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

// class PaymentTypesScreen extends StatefulWidget {
//   const PaymentTypesScreen({super.key});
//
//   @override
//   State<PaymentTypesScreen> createState() => _PaymentTypesScreenState();
// }
//
// class _PaymentTypesScreenState extends State<PaymentTypesScreen>
//     with Validator {
//   final TextEditingController _searchController = TextEditingController();
//   final TextEditingController _amountController = TextEditingController();
//   late PaginatedListController<PaymentType, PaymentCubit, PaymentState>
//       _paymentTypesPaginatedController;
//
//   PaymentCubit paymentCubit = locator<PaymentCubit>();
//   final ScrollController _scrollController = ScrollController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   List<PaymentType> filteredPaymentTypes = [];
//   String _selectedCurrency = 'USD';
//   int? selectedPaymentTypeId;
//
//   @override
//   void initState() {
//     super.initState();
//     _searchController.addListener(_filterPaymentTypes);
//
//     _paymentTypesPaginatedController =
//         PaginatedListController<PaymentType, PaymentCubit, PaymentState>(
//       fetchItems: (param) => paymentCubit.fetchPaymentTypes(),
//       cubit: paymentCubit,
//     );
//
//     _scrollController.addListener(_scrollListener);
//     _loadPaymentTypesPage();
//   }
//
//   void _filterPaymentTypes() {
//     setState(() {
//       if (_searchController.text.isEmpty) {
//         filteredPaymentTypes = _paymentTypesPaginatedController.items;
//       } else {
//         final query = _searchController.text.toLowerCase();
//         filteredPaymentTypes =
//             _paymentTypesPaginatedController.items.where((paymentType) {
//           return paymentType.name.toLowerCase().contains(query);
//         }).toList();
//       }
//     });
//   }
//
//   void _loadPaymentTypesPage() {
//     _paymentTypesPaginatedController.loadNextPage(
//       successCondition: (state) =>
//           state.paymentTypeStatus == PaymentTypeStatus.success,
//       extractItems: (state) => state.paymentTypes ?? [],
//       isError: (state) => state.paymentTypeStatus == PaymentTypeStatus.failure,
//     );
//   }
//
//   void _scrollListener() {
//     if (_isBottom) {
//       _loadPaymentTypesPage();
//     }
//   }
//
//   bool get _isBottom {
//     if (!_scrollController.hasClients) return false;
//     final maxScroll = _scrollController.position.maxScrollExtent;
//     final currentScroll = _scrollController.position.pixels;
//     return currentScroll >= (maxScroll * 0.9);
//   }
//
//   @override
//   void dispose() {
//     _scrollController.dispose();
//     _searchController.dispose();
//     _amountController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.secondaryLight,
//       appBar: AppBar(
//         backgroundColor: AppColors.secondaryLight,
//         elevation: 0.0,
//         leading: AppBackButton(),
//         title: Text(
//           'Select Payment Type',
//           style: TextStyle(
//             color: AppColors.grayscale,
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: BlocBuilder<PaymentCubit, PaymentState>(
//         builder: (context, state) {
//           if (state.paymentTypeStatus == PaymentTypeStatus.loading &&
//               _paymentTypesPaginatedController.items.isEmpty) {
//             return loadingIndicator();
//           } else if (state.paymentTypeStatus == PaymentTypeStatus.success &&
//               _paymentTypesPaginatedController.items.isEmpty) {
//             return Center(
//               child: Text(
//                 'No payment types available.',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                   color: AppColors.primaryDark,
//                 ),
//               ),
//             );
//           }
//
//           final displayList = _searchController.text.isEmpty
//               ? _paymentTypesPaginatedController.items
//               : filteredPaymentTypes;
//
//           return Column(
//             children: [
//               SearchField(
//                 searchController: _searchController,
//                 containerColor: AppColors.white,
//                 iconColor: AppColors.black,
//                 textColor: Colors.blueGrey,
//                 onTap: () => {
//                   setState(() {
//                     selectedPaymentTypeId = null;
//                   }),
//                 },
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: ListView.builder(
//                     controller: _scrollController,
//                     itemCount: displayList.length,
//                     itemBuilder: (context, index) {
//                       final paymentType = displayList[index];
//
//                       // Only show the selected card or all cards if none is selected
//                       if (selectedPaymentTypeId != null &&
//                           selectedPaymentTypeId != paymentType.id) {
//                         return SizedBox.shrink();
//                       }
//
//                       return GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             selectedPaymentTypeId = paymentType.id;
//                           });
//                         },
//                         child: Card(
//                           color: selectedPaymentTypeId == paymentType.id
//                               ? AppColors.white
//                               : AppColors.white,
//                           elevation: 4,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12.0),
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(16.0),
//                             child: selectedPaymentTypeId == paymentType.id
//                                 ? Form(
//                                     key: _formKey,
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           paymentType.name,
//                                           style: TextStyle(
//                                             color: AppColors.primaryDark,
//                                             fontSize: 18,
//                                             fontWeight: FontWeight.w400,
//                                           ),
//                                         ),
//                                         SizedBox(height: 16),
//                                         InputField(
//                                           hintText: 'Amount',
//                                           validator: (data) =>
//                                               isValidAmount(data!),
//                                           controller: _amountController,
//                                         ),
//                                         DropdownInputField(
//                                           value: _selectedCurrency,
//                                           hintText: 'Select Currency',
//                                           validator: (data) =>
//                                               isValidInput(data),
//                                           onChanged: (value) {
//                                             if (value != null) {
//                                               setState(() {
//                                                 _selectedCurrency = value;
//                                               });
//                                             }
//                                           },
//                                           items: AppLists.currencies,
//                                         ),
//                                         SizedBox(height: 16),
//                                         BlocListener<PaymentCubit,
//                                             PaymentState>(
//                                           listener: (context, state) {
//                                             if (state.paymentLinkStatus ==
//                                                 PaymentLinkStatus.success) {
//                                               Navigator.push(
//                                                 context,
//                                                 MaterialPageRoute(
//                                                   builder: (context) =>
//                                                       PaymentLinkScreen(
//                                                     paymentLinkData:
//                                                         state.paymentLinkData,
//                                                   ),
//                                                 ),
//                                               );
//                                             } else if (state
//                                                     .paymentLinkStatus ==
//                                                 PaymentLinkStatus.failure) {
//                                               NotifyUser.showSnackBar(
//                                                   'Payment link generation failed');
//                                             }
//                                           },
//                                           child: PrimaryButton(
//                                             title: 'Proceed',
//                                             state: state.paymentLinkStatus ==
//                                                 PaymentLinkStatus.loading,
//                                             action: () async {
//                                               String? userId =
//                                                   await TokenUtil.getUserId();
//                                               if (_formKey.currentState!
//                                                   .validate()) {
//                                                 final amount = double.tryParse(
//                                                         _amountController
//                                                             .text) ??
//                                                     0;
//                                                 paymentCubit
//                                                     .generatePaymentLink(
//                                                   GetPaymentLinkParams(
//                                                     userId: userId!,
//                                                     payInType:
//                                                         selectedPaymentTypeId ??
//                                                             1,
//                                                     amount: amount,
//                                                     currency: _selectedCurrency,
//                                                   ),
//                                                 );
//                                               }
//                                             },
//                                           ),
//                                         ),
//                                         TextButton(
//                                           onPressed: () {
//                                             setState(() {
//                                               selectedPaymentTypeId = null;
//                                             });
//                                           },
//                                           child: Text(
//                                             'Change Selection',
//                                             style: TextStyle(
//                                               color: AppColors.black,
//                                               fontWeight: FontWeight.w300,
//                                             ),
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   )
//                                 : Center(
//                                     child: Text(
//                                       paymentType.name,
//                                       style: TextStyle(
//                                         color: AppColors.primaryDark,
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w400,
//                                       ),
//                                     ),
//                                   ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
