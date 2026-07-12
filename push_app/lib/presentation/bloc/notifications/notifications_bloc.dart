import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:push_app/config/domain/entities/push_message.dart';
import 'package:push_app/firebase_options.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationsBloc() : super(const NotificationsState()) {
    // Repintar UI del estado (permisos)
    on<NotificationStatusChanged>(_onNotificationStatusChanged);

    on<NotificationRecived>(_onPushMessageRecived);

    // Verificar estado de las notifiaciones(Permisos)
    _initialStatusCheck();

    // Listerner para notificaciones en Foreground
    _onForegroundMessage();
  }

  // Iniciar Configuracion de Firebase
  static Future<void> initializeFCM() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  // Manejador del evento
  void _onNotificationStatusChanged(
    NotificationStatusChanged event,
    Emitter<NotificationsState> emit,
  ) {
    emit(state.copywith(status: event.status));
    _getFCMToken();
  }

  // Lanzador de envento capturar estado de permiso
  void _initialStatusCheck() async {
    final settings = await messaging.getNotificationSettings();
    add(NotificationStatusChanged(settings.authorizationStatus));
  }

  // Obtener Token del dispositivo usando app
  void _getFCMToken() async {
    if (state.status != AuthorizationStatus.authorized) return;
    final token = await messaging.getToken();
    print(token);
  }

  //---- Listerner para Foreground ----

  // Manejador
  void _onPushMessageRecived(
    NotificationRecived event,
    Emitter<NotificationsState> emit,
  ) {
    emit(
      state.copywith(notifications: [event.pushMessage, ...state.notifications]),
    );
  }

  void _handleRemoteMessage(RemoteMessage message) {
    if (message.notification == null) return;

    final notification = PushMessage(
      messageId:
          message.messageId?.replaceAll(':', '').replaceAll('%', '') ?? '',
      title: message.notification!.title ?? '',
      body: message.notification!.body ?? '',
      senDate: message.sentTime ?? DateTime.now(),
      data: message.data,
      imageUrl: Platform.isAndroid
          ? message.notification!.android?.imageUrl
          : message.notification!.apple?.imageUrl,
    );

    add(NotificationRecived(pushMessage: notification));
  }

  void _onForegroundMessage() {
    FirebaseMessaging.onMessage.listen(_handleRemoteMessage);
  }
  // ---- ----

  // Lanzador de evento de solicitud de permiso
  void requestPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: false,
      sound: true,
    );
    add(NotificationStatusChanged(settings.authorizationStatus));

    // print('User granted permission: ${settings.authorizationStatus}');
  }
}
