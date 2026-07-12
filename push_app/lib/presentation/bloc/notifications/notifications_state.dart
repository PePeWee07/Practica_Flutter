part of 'notifications_bloc.dart';

class NotificationsState extends Equatable {
  // Metodo de Firebase
  final AuthorizationStatus status;

  // Modelo de notificaciones(Mio)
  final List<PushMessage> notifications;

  const NotificationsState({
    this.status = AuthorizationStatus.notDetermined,
    this.notifications = const [],
  });

  @override
  List<Object> get props => [status, notifications];

  NotificationsState copywith({
    AuthorizationStatus? status,
    List<PushMessage>? notifications
  }) => NotificationsState(
    status: status ?? this.status,
    notifications: notifications ?? this.notifications
  );
}

