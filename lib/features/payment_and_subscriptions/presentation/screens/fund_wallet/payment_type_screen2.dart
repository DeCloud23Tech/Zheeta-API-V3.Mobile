// import 'package:auto_route/annotations.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:zheeta/core/constants/color.dart';
// import 'package:zheeta/core/injection/di.dart';
// import 'package:zheeta/features/payment_and_subscriptions/data/model/payment_types_model.dart';
// import 'package:zheeta/features/payment_and_subscriptions/presentation/bloc/payment/payment_cubit.dart';
// import 'package:zheeta/widgets/back_button.dart';
// import 'package:zheeta/widgets/loader.dart';
// import 'package:zheeta/utils/pagination_controller.dart';
//
// @RoutePage()
// class PaymentTypesScreen extends StatefulWidget {
//   const PaymentTypesScreen({super.key});
//
//   @override
//   State<PaymentTypesScreen> createState() => _PaymentTypesScreenState();
// }
//
// class _PaymentTypesScreenState extends State<PaymentTypesScreen> {
//   final TextEditingController _searchController = TextEditingController();
//   final TextEditingController _amountController = TextEditingController();
//   late PaginatedListController<PaymentType, PaymentCubit, PaymentState> _paymentTypesPaginatedController;
//
//   PaymentCubit paymentCubit = locator<PaymentCubit>();
//   final ScrollController _scrollController = ScrollController();
//
//   List<PaymentType> filteredPaymentTypes = [];
//   String _selectedCurrency = 'NGN';
//   int? selectedPaymentTypeId;
//
//   @override
//   void initState() {
//     super.initState();
//     _searchController.addListener(_filterPaymentTypes);
//
//     _paymentTypesPaginatedController = PaginatedListController<PaymentType, PaymentCubit, PaymentState>(
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
//         filteredPaymentTypes = _paymentTypesPaginatedController.items.where((paymentType) {
//           return paymentType.name.toLowerCase().contains(query);
//         }).toList();
//       }
//     });
//   }
//
//   void _loadPaymentTypesPage() {
//     _paymentTypesPaginatedController.loadNextPage(
//       successCondition: (state) => state.paymentTypeStatus == PaymentTypeStatus.success,
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
//           'Select payment type',
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
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: TextField(
//                   controller: _searchController,
//                   decoration: InputDecoration(
//                     hintText: 'Search',
//                     prefixIcon: Icon(Icons.search),
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12.0),
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: ListView.builder(
//                     controller: _scrollController,
//                     itemCount: displayList.length,
//                     itemBuilder: (context, index) {
//                       final paymentType = displayList[index];
//                       return Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           RadioListTile<int>(
//                             title: Text(
//                               paymentType.name,
//                               style: TextStyle(
//                                 color: AppColors.primaryDark,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w400,
//                               ),
//                             ),
//                             value: paymentType.id,
//                             groupValue: selectedPaymentTypeId,
//                             onChanged: (value) {
//                               setState(() {
//                                 selectedPaymentTypeId = value;
//                               });
//                             },
//                           ),
//                           Visibility(
//                             visible: selectedPaymentTypeId == paymentType.id,
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 16.0),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   TextField(
//                                     controller: _amountController,
//                                     keyboardType: TextInputType.number,
//                                     decoration: InputDecoration(
//                                       labelText: 'Amount',
//                                       border: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(10.0),
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(height: 16),
//                                   DropdownButtonFormField<String>(
//                                     value: _selectedCurrency,
//                                     onChanged: (value) {
//                                       setState(() {
//                                         _selectedCurrency = value!;
//                                       });
//                                     },
//                                     items: ['NGN', 'USD', 'EUR']
//                                         .map((currency) => DropdownMenuItem(
//                                       value: currency,
//                                       child: Text(currency),
//                                     ))
//                                         .toList(),
//                                     decoration: InputDecoration(
//                                       labelText: 'Currency',
//                                       border: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(10.0),
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(height: 16),
//                                   ElevatedButton(
//                                     onPressed: () {
//                                       final amount = double.tryParse(_amountController.text) ?? 0;
//                                       if (amount > 0) {
//                                         // Example of generating a payment link
//                                         final paymentDetails = {
//                                           "userId": "2a46fbbc-5e85-4ffa-9d7d-e69a5ef752ba",
//                                           "payInType": selectedPaymentTypeId,
//                                           "amount": amount,
//                                           "currency": _selectedCurrency,
//                                         };
//
//                                         // Simulate a payment link (replace with actual API response if necessary)
//                                         final paymentLink = 'https://payment.example.com/pay?${paymentDetails.entries.map((e) => '${e.key}=${e.value}').join('&')}';
//
//                                         // widget.onConfirm(amount, _selectedCurrency);
//
//                                         // Navigate to the PaymentLinkScreen
//                                         Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                             builder: (context) => PaymentLinkScreen(paymentLink: paymentLink),
//                                           ),
//                                         );
//                                       } else {
//                                         // Show error for invalid amount
//                                         ScaffoldMessenger.of(context).showSnackBar(
//                                           SnackBar(content: Text('Please enter a valid amount')),
//                                         );
//                                       }
//                                     },
//                                     child: const Text('Confirm'),
//                                     style: ElevatedButton.styleFrom(
//                                       backgroundColor: AppColors.primaryDark,
//                                       minimumSize: const Size(double.infinity, 50),
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(10.0),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Divider(),
//                         ],
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
//
//
//
// class PaymentLinkScreen extends StatelessWidget {
//   final String paymentLink;
//
//   const PaymentLinkScreen({
//     super.key,
//     required this.paymentLink,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Payment Link'),
//         backgroundColor: Colors.blueAccent,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Your payment link:',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10),
//             GestureDetector(
//               onTap: () async {
//                 if (await canLaunchUrl(Uri.parse(paymentLink))) {
//                   await launchUrl(Uri.parse(paymentLink), mode: LaunchMode.externalApplication);
//                 } else {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text('Could not open the link')),
//                   );
//                 }
//               },
//               child: Text(
//                 paymentLink,
//                 style: const TextStyle(
//                   color: Colors.blue,
//                   fontSize: 16,
//                   decoration: TextDecoration.none,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton.icon(
//               onPressed: () {
//                 Clipboard.setData(ClipboardData(text: paymentLink));
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text('Payment link copied to clipboard')),
//                 );
//               },
//               icon: const Icon(Icons.copy),
//               label: const Text('Copy Link'),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.green,
//                 minimumSize: const Size(double.infinity, 50),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
