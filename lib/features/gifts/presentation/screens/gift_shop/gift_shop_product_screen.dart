import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/utils/notify.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/gifts/data/models/gift_model.dart';
import 'package:zheeta/features/gifts/data/requests/send_gift_request_model.dart';
import 'package:zheeta/features/gifts/presentation/cubits/gift_cubit/gift_cubit.dart';
import 'package:zheeta/features/gifts/presentation/screens/gift_shop/gift_shop_sucess_screen.dart';
import 'package:zheeta/shared/widgets/back_button.dart';
import 'package:zheeta/shared/widgets/input_field.dart';
import 'package:zheeta/shared/widgets/loader.dart';
import 'package:zheeta/shared/widgets/primary_button.dart';
import 'package:zheeta/shared/widgets/search_screen.dart';

@RoutePage()
class ProductDetailsScreen extends StatefulWidget {
  final GiftModel gift;

  const ProductDetailsScreen({super.key, required this.gift});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GiftCubit giftsCubit = locator<GiftCubit>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  late String? _receiverId;
  var quantity = 1;

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
        leading: AppBackButton(
          onTap: () {
            context.read<GiftCubit>().resetGiftCubit(); // Reset cubit
            context.router.back();
          },
        ),
      ),
      body: BlocConsumer<GiftCubit, GiftState>(
        listener: (context, state) {
          if (state.status == GiftsStatus.error) {
            NotifyUser.showSnackBar(state.errorMessage ??
                'Something went wrong please try again later');
          }
        },
        builder: (context, state) {
          if (state.status == GiftsStatus.loading) {
            return loadingIndicator();
          } else if (state.status == GiftsStatus.sentGift) {
            return GiftShopSuccessScreen();
          }

          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
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
                          const Icon(Icons.image_not_supported),
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
                      GestureDetector(
                        onTap: () async {
                          // Navigate to the search screen
                          final result =
                              await Navigator.push<Map<String, dynamic>>(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchUserScreen(),
                            ),
                          );

                          // Set the returned username and userId to the respective controllers
                          if (result != null) {
                            _usernameController.text = result['username'] ?? '';
                            _receiverId = result['userId'] ?? '';
                          }
                        },
                        child: AbsorbPointer(
                          // Prevents manual input
                          child: InputField(
                            controller: _usernameController,
                            hintText: 'Send to (Username)',
                            validator: validateUsername,
                            onChanged: (value) {},
                          ),
                        ),
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
                // Add the PrimaryButton here
                PrimaryButton(
                  title: 'Proceed',
                  state: state.status == GiftsStatus.loading,
                  action: () {
                    if (_formKey.currentState!.validate()) {
                      giftsCubit.sendGiftCubit(
                        SendGiftRequestModel(
                          giftId: widget.gift.id,
                          totalQuantity: quantity,
                          receiverId: _receiverId!,
                          receiverUsername: _usernameController.text,
                          message: _messageController.text,
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
