import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:injectable/injectable.dart';

part 'maintenance_mode_state.dart';

@prod
@Singleton()
class MaintenanceModeCubit extends Cubit<MaintenanceModeState> {
  MaintenanceModeCubit()
      : super(MaintenanceModeState(
          isMaintenanceMode: false,
          title: '',
          message: '',
          scheduledEnd: null,
        ));

  Future<void> checkMaintenanceMode() async {
    try {
      final response = await http.get(
        // `http` object will now be available
        Uri.parse(
            'https://zheetargaa95.blob.core.windows.net/zheeta-utilities/maintenance_mode.json'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        final state = MaintenanceModeState(
          isMaintenanceMode: data['isMaintenanceMode'] ?? false,
          title: data['title'] ?? '',
          message: data['message'] ?? '',
          scheduledEnd: DateTime.tryParse(data['scheduledEnd'] ?? ''),
        );

        emit(state);
      } else {
        // Log the actual status code and reason for better debugging
        print(
            'Failed to load maintenance mode: Status Code ${response.statusCode}, Reason: ${response.reasonPhrase}');
        emit(state.copyWith(
            isMaintenanceMode:
                false)); // Potentially reset state or handle gracefully
        throw Exception(
            'Failed to load maintenance mode: ${response.statusCode}');
      }
    } catch (e) {
      // Handle error (e.g., show error message)
      print("Error checking maintenance mode: $e");
      // Consider emitting an error state or keeping maintenance mode off if the check fails
      emit(state.copyWith(isMaintenanceMode: false));
    }
  }
}
