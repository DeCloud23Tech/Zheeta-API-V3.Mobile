import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/authentication/presentation/bloc/authentication_bloc.dart';

class AppBlocsProvider {
  static get allBlocProviders => [
        BlocProvider(create: (context) => locator<AuthenticationCubit>()),
      ];
}
