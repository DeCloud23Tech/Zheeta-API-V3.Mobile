import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/features/profile/data/model/user_profile_model.dart';
import 'package:zheeta/features/profile/presentation/bloc/profile_cubit/profile_cubit.dart';

part 'app_state.dart';

@prod
@LazySingleton()
class AppCubit extends Cubit<AppState> {
  final ProfileCubit profileCubit;

  AppCubit({required this.profileCubit}) : super(AppInitial());

  /// App initialization logic
  Future<void> initializeApp() async {
    emit(AppLoading());
    try {
      // Call the `getSingleUserProfileCubit` method from `ProfileCubit`
      var profile = await profileCubit.getSingleUserProfileCubit();

      // You can also initialize other cubits or perform additional logic here
      // Example:
      // await context.read<AnotherCubit>().someInitializationMethod();

      emit(AppLoaded(
        profile: profile,
      ));
    } catch (error) {
      emit(AppError(error.toString()));
    }
  }
}
