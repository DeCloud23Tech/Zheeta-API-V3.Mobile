import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/gifts/data/model/gift_model.dart';
import 'package:zheeta/gifts/data/request/send_gift_request_model.dart';
import 'package:zheeta/widgets/primary_button.dart';
import '../../../app/injection/di.dart';
import '../../../app/router/app_router.dart';
import '../../../app/router/app_router.gr.dart';
import '../../../widgets/input_field.dart';
import '../../../widgets/loading_screen.dart';
import '../bloc/gift/gift_cubit.dart';

@RoutePage()
class ProductDetailsScreen extends StatefulWidget {
  final GiftModel gift;

  const ProductDetailsScreen({super.key, required this.gift});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  var quantity = 1;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  late GiftCubit _giftCubit;

  @override
  void initState() {
    super.initState();
    _giftCubit = locator<GiftCubit>();
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

  void _sendGift(SendGiftRequestModel request) {
    // _giftCubit.sendGiftCubit(request).then((_) {
    //   // Handle post-gift sending actions like showing a success message or navigating to another screen.
    //   // Example:
    //   // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Gift sent successfully')));
    //   // context.router.pop();
    // });
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
      ),
      body: BlocListener<GiftCubit, GiftState>(
        listener: (context, state) {
          // if (state is GiftSent) {
          //   ScaffoldMessenger.of(context).showSnackBar(
          //     SnackBar(content: Text('Gift sent successfully')),
          //   );
          //   context.router.push(const GiftSuccessRoute());
          // } else if (state is GiftsError) {
          //   ScaffoldMessenger.of(context).showSnackBar(
          //     SnackBar(content: Text('Error: ${state.errorMessage}')),
          //   );
          // }
        },
        child: SingleChildScrollView(
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
                        const CupertinoActivityIndicator(
                      color: AppColors.primaryLight,
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
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
              SizedBox(height: 20),
              PrimaryButton(
                title: 'Proceed',
                action: () {
                  if (_formKey.currentState!.validate()) {
                    _sendGift(
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
      ),
    );
  }
}
