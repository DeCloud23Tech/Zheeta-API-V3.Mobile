import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zheeta/core/common/cubit/maintenance_mode_cubit/maintenance_mode_cubit.dart';
import 'package:zheeta/core/services/agreement_service.dart';
import 'package:zheeta/core/services/deep_link_service.dart';
import 'package:zheeta/core/services/inapp_purchase_service.dart';
import 'package:zheeta/core/services/push_notification_service.dart';
import 'package:zheeta/core/storage/storage/i_storage.dart';
import 'package:zheeta/core/storage/storage/shared_preferences_storage_service.dart';
import 'package:zheeta/core/storage/token_storage/i_token_storage.dart';
import 'package:zheeta/core/storage/token_storage/token_storage.dart';
import 'package:zheeta/core/storage/user_storage/i_user_storage.dart';
import 'package:zheeta/core/storage/user_storage/user_storage.dart';
import 'package:zheeta/di/di.config.dart';

final locator = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies(String env) async {
  if (!locator.isRegistered<bool>(instanceName: 'DI_initialized')) {
    await locator.init(environment: env);
    locator.registerSingleton<bool>(true, instanceName: 'DI_initialized');
    debugPrint('GetIt dependencies configured for environment: $env');
  } else {
    debugPrint('GetIt dependencies already configured for this isolate.');
  }
}

@module
abstract class StorageModule {
  // Your existing @preResolve for IStorage (via SharedPreferencesStorageService)
  // This must be here or similar.
  @preResolve
  Future<IStorage> get storageService =>
      SharedPreferencesStorageService.create();

  @preResolve
  Future<ITokenStorage> get tokenStorage async {
    final instance = TokenStorage();
    await instance
        .init(); // Assuming init() takes care of its own dependencies or they are injected.
    return instance;
  }

  @preResolve
  Future<IUserStorage> get userStorage async {
    final instance = UserStorage();
    await instance
        .init(); // Assuming init() takes care of its own dependencies or they are injected.
    return instance;
  }

  // NEW: Add AgreementService here as a @preResolve dependency
  @preResolve
  Future<AgreementService> get agreementService async {
    // AgreementService needs IStorage. Since IStorage is @preResolve'd in this module,
    // it will be ready by the time agreementService is built.
    return AgreementService(locator<IStorage>());
  }
}

@module
abstract class ServiceModule {
  @preResolve
  Future<DeepLinkService> get deepLinkService async {
    final instance = DeepLinkService();
    await instance.initialize();
    return instance;
  }

  @preResolve
  Future<PushNotificationService> get pushNotificationService async {
    final instance = PushNotificationService();
    await instance.initialize();
    return instance;
  }

// Ensure PushNotificationService and DeepLinkService are also LazySingletons or Singletons if they are only injected via constructor
// and not used directly via locator.get() after configureDependencies.
// If they are only consumed via their respective preResolve getters, then this is fine.
}
