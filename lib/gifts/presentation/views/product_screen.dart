import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/gifts/data/model/gift_model.dart';
import 'package:zheeta/gifts/data/request/send_gift_request_model.dart';
import 'package:zheeta/widgets/primary_button.dart';
import '../../../app/injection/di.dart';
import '../../../widgets/input_field.dart';
import '../viewmodel/gift_viewmodel.dart';

@RoutePage()
class ProductDetailsScreen extends StatefulWidget {
  final GiftModel gift;

  const ProductDetailsScreen({super.key, required this.gift});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late GiftViewModel _giftViewModel;
  var quantity = 1;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    _giftViewModel = locator<GiftViewModel>();
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (quantity > 1) quantity--;
    });
  }

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a username';
    }
    return null;
  }

  String? validateMessage(String? value) {
    if (value != null && value.length > 200) {
      return 'Message should not exceed 200 characters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryLight,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () => router.pop(),
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
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 343,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  imageUrl: widget.gift.imageUrl,
                  height: MediaQuery.of(context).size.width * 0.38,
                  width: MediaQuery.of(context).size.width * 0.28,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const CupertinoActivityIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              widget.gift.title,
              style: TextStyle(
                color: AppColors.grayscale,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${widget.gift.amount}',
                  style: TextStyle(
                    color: AppColors.primaryDark,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: _decrementQuantity,
                      child: Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              width: 1,
                              color: AppColors.grey,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "-",
                              style: TextStyle(
                                color: AppColors.primaryDark,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "$quantity",
                      style: TextStyle(
                        color: AppColors.grayscale,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GestureDetector(
                      onTap: _incrementQuantity,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              width: 1,
                              color: AppColors.grey,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "+",
                              style: TextStyle(
                                color: AppColors.primaryDark,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  InputField(
                    controller: _usernameController,
                    hintText: 'Send to (Username)',
                    validator: validateUsername,
                    onChanged: (value) {},
                  ),
                  InputField(
                    controller: _messageController,
                    hintText: 'Message (optional)',
                    minLine: 4,
                    maxLine: 4,
                    validator: validateMessage,
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            PrimaryButton(
              title: 'Proceed',
              action: () {
                if (_formKey.currentState!.validate()) {
                  _giftViewModel.sendGift(
                    SendGiftRequestModel(
                      giftId: widget.gift.id,
                      totalQuantity: quantity,
                      receiverUsername: _usernameController.text,
                      message: _messageController.text,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
