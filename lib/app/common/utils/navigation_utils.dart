import 'package:zheeta/app/common/notify/notify_user.dart';
import 'package:zheeta/app/common/storage/user_storage/i_user_storage.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/authentication/data/model/register_user_model.dart';

// Future<void> navigateToVerificationPage() async {
//   // Navigate to verification screen
//
//   router.popAndPush(VerificationRoute(
//       isPhoneNumber: true,
//       phoneNumber: _phoneNumber.number,
//       countryCode: _phoneNumber.countryCode,
//       email: _email));
// }

Future<void> navigateToVerificationPageLogin() async {
  // Navigate to verification screen
  IUserStorage userStorage = locator<IUserStorage>();

  RegisterUserModel? user = await userStorage.read();
  if (user != null) {
    router.popAndPush(VerificationRoute(
        isPhoneNumber: true,
        phoneNumber: user.phoneNumber,
        countryCode: user.phoneCountryCode,
        email: user.email));
  } else {
    NotifyUser.showSnackbar('No Registered User');
  }
}
