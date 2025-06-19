part of 'maintenance_mode_cubit.dart';


class MaintenanceModeState extends Equatable  {
  final bool isMaintenanceMode;
  final String title;
  final String message;
  final DateTime? scheduledEnd;

  const MaintenanceModeState({
    required this.isMaintenanceMode,
    required this.title,
    required this.message,
    this.scheduledEnd,
  });

  @override
  List<Object?> get props => [];
}