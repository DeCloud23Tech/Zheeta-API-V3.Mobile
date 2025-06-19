import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zheeta/common/constants/color.dart';
import 'package:zheeta/common/mixins/validation_helper.dart';
import 'package:zheeta/features/wallet_and_transactions/presentation/views/wallet-transfer/send_coin_details_screen.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/input_field.dart';
import 'package:zheeta/widgets/primary_button.dart';
import 'package:zheeta/widgets/search_screen.dart';

@RoutePage()
class SendCoinScreen extends StatefulWidget {
  const SendCoinScreen({super.key});

  @override
  State<SendCoinScreen> createState() => _SendCoinScreenState();
}

class _SendCoinScreenState extends State<SendCoinScreen>
    with ValidationHelperMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  late String? _receiverId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryLight,
        elevation: 0.0,
        leading: AppBackButton(),
        title: Text(
          'Send',
          style: TextStyle(
            color: AppColors.grayscale,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      final result = await Navigator.push<Map<String, dynamic>>(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchUserScreen(),
                        ),
                      );

                      if (result != null) {
                        _usernameController.text = result['username'] ?? '';
                        _receiverId = result['userId'] ?? '';
                      }
                    },
                    child: AbsorbPointer(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: InputField(
                              controller: _usernameController,
                              hintText: 'Send to (Username)',
                              validator: validateUsername,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: SvgPicture.asset(
                              "assets/images/icons/send-coin.svg",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InputField(
                    controller: _amountController,
                    hintText: 'Amount',
                    keyboardType: TextInputType.number,
                    validator: (value) => isValidAmount(value ?? ''),
                  ),
                  InputField(
                    controller: _messageController,
                    hintText: 'Message (optional)',
                    minLine: 4,
                    maxLine: 4,
                    validator: validateMessage,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            PrimaryButton(
              title: 'Proceed',
              action: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SendCoinDetailsScreen(
                        receiverId: _receiverId!,
                        receiverUsername: _usernameController.text,
                        amount: double.parse(_amountController.text),
                        message: _messageController.text,
                      ),
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
