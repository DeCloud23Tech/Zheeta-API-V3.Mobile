import 'package:zheeta/app/common/type_def.dart';

abstract class AccessRestrictionRepository {
  ResultVoid enableAccountRepo({required String userId});
  ResultVoid disableAccountRepo({required String userId});
}
