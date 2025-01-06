// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:zheeta/app/common/color.dart';
// import 'package:zheeta/app/router/app_router.dart';
// import 'package:zheeta/wallet/presentation/widgets/custom_wallet_button.dart';
// import 'package:zheeta/wallet/presentation/widgets/transactions_listview.dart';
//
//
// class TransactionListPage extends StatefulWidget {
//   const TransactionListPage({Key? key}) : super(key: key);
//
//   @override
//   _TransactionListPageState createState() => _TransactionListPageState();
// }
//
// class _TransactionListPageState extends State<TransactionListPage> {
//   late TextEditingController fromDateController;
//   late TextEditingController toDateController;
//   DateTime? fromDate;
//   DateTime? toDate;
//   String filter = 'All';
//   List<Transaction> transactions = [
//     Transaction(
//       iconPath: 'assets/images/icons/af-payment.svg',
//       title: 'Monthly AFFILIATE PAY',
//       description: 'Withdraw to bank',
//       amount: 150.0,
//       date: 'Nov 01',
//       status: 'incoming',
//     ),
//     Transaction(
//       iconPath: 'assets/images/icons/subscriptions.svg',
//       title: 'Monthly AFFILIATE PAY',
//       description: 'Withdraw to bank',
//       amount: 150.0,
//       date: 'Nov 01',
//       status: 'incoming',
//     ),
//     Transaction(
//       iconPath: 'assets/images/icons/payment.svg',
//       title: 'Monthly AFFILIATE PAY',
//       description: 'Withdraw to bank',
//       amount: 150.0,
//       date: 'Nov 01',
//       status: 'outgoing',
//     ),
//     Transaction(
//       iconPath: 'assets/images/icons/subscriptions.svg',
//       title: 'Monthly AFFILIATE PAY',
//       description: 'Withdraw to bank',
//       amount: 150.0,
//       date: 'Nov 01',
//       status: 'incoming',
//     ),
//     Transaction(
//       iconPath: 'assets/images/icons/gift.svg',
//       title: 'Monthly AFFILIATE PAY',
//       description: 'Withdraw to bank',
//       amount: 150.0,
//       date: 'Nov 01',
//       status: 'outgoing',
//     ),
//     Transaction(
//       iconPath: 'assets/images/icons/gift.svg',
//       title: 'Monthly AFFILIATE PAY',
//       description: 'Withdraw to bank',
//       amount: 150.0,
//       date: 'Nov 01',
//       status: 'outgoing',
//     ),
//     Transaction(
//       iconPath: 'assets/images/icons/subscriptions.svg',
//       title: 'Monthly AFFILIATE PAY',
//       description: 'Withdraw to bank',
//       amount: 150.0,
//       date: 'Nov 01',
//       status: 'incoming',
//     ),
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     fromDateController = TextEditingController();
//     toDateController = TextEditingController();
//   }
//
//   @override
//   void dispose() {
//     fromDateController.dispose();
//     toDateController.dispose();
//     super.dispose();
//   }
//
//   Future<void> _selectDate(TextEditingController controller) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2015, 8),
//       lastDate: DateTime.now(),
//     );
//     if (picked != null && picked != controller.text) {
//       setState(() {
//         controller.text = DateFormat('yyyy-MM-dd').format(picked);
//       });
//     }
//   }
//
//   void _filterList(String selectedFilter) {
//     setState(() {
//       filter = selectedFilter;
//     });
//   }
//
//   List<Transaction> getFilteredTransactions() {
//     if (filter == 'All') {
//       return transactions;
//     } else if (filter == 'Income') {
//       return transactions
//           .where((transaction) => transaction.status == 'incoming')
//           .toList();
//     } else {
//       return transactions
//           .where((transaction) => transaction.status == 'outgoing')
//           .toList();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.primaryDark,
//       appBar: AppBar(
//         backgroundColor: AppColors.primaryDark,
//         elevation: 0.0,
//         leading: GestureDetector(
//           onTap: () => router.back(),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//                 padding: EdgeInsets.all(5),
//                 height: 30,
//                 width: 30,
//                 decoration: BoxDecoration(
//                     color: AppColors.white,
//                     borderRadius: BorderRadius.circular(100)),
//                 child: Icon(Icons.arrow_back_ios_new, color: AppColors.grey)),
//           ),
//         ),
//         title: Text(
//           'Transaction',
//           style: TextStyle(
//               color: AppColors.white,
//               fontSize: 24,
//               fontWeight: FontWeight.w600),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 SizedBox(
//                   height: 50,
//                   width: MediaQuery.of(context).size.width * 0.4,
//                   child: TextFormField(
//                     controller: fromDateController,
//                     readOnly: true,
//                     onTap: () => _selectDate(fromDateController),
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: AppColors.white,
//                       border: OutlineInputBorder(
//                           borderSide: BorderSide(
//                         color: AppColors.grey,
//                       )),
//                       hintText: 'From',
//                       hintStyle: TextStyle(color: AppColors.grey),
//                       suffixIcon: IconButton(
//                         icon: Icon(
//                           Icons.calendar_today_sharp,
//                           color: AppColors.grey,
//                         ),
//                         onPressed: () => _selectDate(fromDateController),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 50,
//                   width: MediaQuery.of(context).size.width * 0.4,
//                   child: TextFormField(
//                     controller: toDateController,
//                     readOnly: true,
//                     onTap: () => _selectDate(toDateController),
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: AppColors.white,
//                       border: OutlineInputBorder(
//                           borderSide: BorderSide(
//                         color: AppColors.grey,
//                       )),
//                       hintText: 'To',
//                       hintStyle: TextStyle(color: AppColors.grey),
//                       suffixIcon: IconButton(
//                         icon: Icon(
//                           Icons.calendar_today_sharp,
//                           color: AppColors.grey,
//                         ),
//                         onPressed: () => _selectDate(toDateController),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 4),
//               child: Text(
//                 'Recent Transactions',
//                 style: TextStyle(
//                   color: AppColors.white,
//                   fontWeight: FontWeight.w700,
//                   fontSize: 20,
//                 ),
//               ),
//             ),
//             SizedBox(height: 16),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 4),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   GestureDetector(
//                     onTap: () => _filterList('All'),
//                     child: Container(
//                       padding:
//                       EdgeInsets.symmetric(vertical: 10, horizontal: 30),
//                       decoration: BoxDecoration(
//                         color: AppColors.secondaryLight,
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(14),
//                         ),
//                       ),
//                       child: Text(
//                         'All',
//                         style: TextStyle(
//                           color: AppColors.primaryDark,
//                           fontWeight: FontWeight.w500,
//                           fontSize: 14,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 18),
//                   Expanded(
//                     child: Row(
//                       children: [
//                         GestureDetector(
//                           onTap: () => _filterList('Income'),
//                           child: buildButton(
//                             text: 'Income',
//                             icon: Icons.arrow_circle_down,
//                             isActive: filter == 'Income',
//                           ),
//                         ),
//                         SizedBox(width: 18),
//                         GestureDetector(
//                           onTap: () => _filterList('Outcome'),
//                           child: buildButton(
//                             text: 'Outcome',
//                             icon: Icons.arrow_circle_up,
//                             isActive: filter == 'Outcome',
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 4),
//                 child: TransactionListView(
//                   transactions: getFilteredTransactions(),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
