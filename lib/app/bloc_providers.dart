import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:zheeta/discover/presentation/bloc/matches_cubit.dart';

class AppBlocsProvider {
  static get allBlocProviders => [
        BlocProvider(create: (context) => locator<AuthenticationCubit>()),
        BlocProvider(create: (context) => locator<MatchesCubit>())
      ];
}
