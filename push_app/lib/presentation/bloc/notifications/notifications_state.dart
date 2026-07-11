part of 'notifications_bloc.dart';

class NotificationsState extends Equatable {
  // Metodo de Firebase
  final AuthorizationStatus status;

  //Todo: Modelo de Notificaciones
  final List<dynamic> notifications;

  const NotificationsState({
    this.status = AuthorizationStatus.notDetermined,
    this.notifications = const [],
  });

  @override
  List<Object> get props => [status, notifications];

  NotificationsState copywith({
    AuthorizationStatus? status,
    List<dynamic>? notifications
  }) => NotificationsState(
    status: status ?? this.status,
    notifications: notifications ?? this.notifications
  );
}

