part of 'maintenance_mode_cubit.dart';

class MaintenanceModeState {
  final bool isMaintenanceMode;
  final String title;
  final String message;
  final DateTime? scheduledEnd;

  MaintenanceModeState({
    required this.isMaintenanceMode,
    required this.title,
    required this.message,
    this.scheduledEnd,
  });

  // Add copyWith for easier state updates in cubit
  MaintenanceModeState copyWith({
    bool? isMaintenanceMode,
    String? title,
    String? message,
    DateTime? scheduledEnd,
  }) {
    return MaintenanceModeState(
      isMaintenanceMode: isMaintenanceMode ?? this.isMaintenanceMode,
      title: title ?? this.title,
      message: message ?? this.message,
      scheduledEnd: scheduledEnd ?? this.scheduledEnd,
    );
  }
}
