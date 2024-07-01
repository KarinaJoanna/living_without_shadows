import 'dart:async';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:living_without_shadows/notification_controller.dart';
import 'package:living_without_shadows/screens/chat_screen.dart';
import 'package:living_without_shadows/screens/profile_screen.dart';
import 'package:living_without_shadows/screens/chat.dart';
import 'screens/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AwesomeNotifications().initialize(null, [
    NotificationChannel(
      channelGroupKey: "basic_channel_group",
      channelKey: 'basic_channel',
      channelName: 'Basic notifications',
      channelDescription: 'Notification channel for basic tests',
      defaultColor: Color(0xFF9D50DD),
    )
  ], channelGroups: [
    NotificationChannelGroup(
      channelGroupKey: "basic_channel_group",
      channelGroupName: "Basic channel group",
    )
  ]);
  bool isAllowedToSendNotification =
      await AwesomeNotifications().isNotificationAllowed();
  if (!isAllowedToSendNotification) {
    await AwesomeNotifications().requestPermissionToSendNotifications();
  }
  runApp(LivingWithoutShadowsApp());
}

class LivingWithoutShadowsApp extends StatefulWidget {
  const LivingWithoutShadowsApp({super.key});

  @override
  _LivingWithoutShadowsAppState createState() =>
      _LivingWithoutShadowsAppState();
}

class _LivingWithoutShadowsAppState extends State<LivingWithoutShadowsApp> {
  Timer? _timer;
  int _notificationIndex = 0;

  final List<Map<String, String>> _notifications = [
    {
      'title': 'Recuerda',
      'body':
          'Cada día es una nueva oportunidad para empezar de nuevo. No estás solo en esta lucha.'
    },
    {
      'title': 'Fortaleza',
      'body':
          'Eres más fuerte de lo que piensas. Busca ayuda y habla con alguien de confianza.'
    },
    {
      'title': 'Está bien no estar bien',
      'body': 'Permítete sentir y busca apoyo. Tu bienestar es importante.'
    },
    {
      'title': 'Apoyo',
      'body':
          'No tengas miedo de pedir ayuda. Hay personas que se preocupan por ti y quieren verte bien.'
    },
    {
      'title': 'Cada pequeño paso cuenta',
      'body': 'Celebra tus logros, por más pequeños que parezcan.'
    },
    {
      'title': 'Las tormentas no duran para siempre',
      'body':
          'Mantente firme y confía en que puedes superar estos momentos difíciles.'
    }
  ];

  @override
  void initState() {
    super.initState();
    AwesomeNotifications().setListeners(
        onActionReceivedMethod: NotificationController.onActionReceivedMethod,
        onNotificationCreatedMethod:
            NotificationController.onNotificationCreatedMethod,
        onNotificationDisplayedMethod:
            NotificationController.onNotificationDisplayedMethod,
        onDismissActionReceivedMethod:
            NotificationController.onDismissActionReceivedMethod);

    _startNotificationTimer();
  }

  void _startNotificationTimer() {
    _timer = Timer.periodic(Duration(minutes: 2), (timer) {
      _showNextNotification();
    });
  }

  void _showNextNotification() {
    final notification = _notifications[_notificationIndex];
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: DateTime.now().millisecondsSinceEpoch.remainder(100000),
        channelKey: "basic_channel",
        title: notification['title'],
        body: notification['body'],
      ),
    );

    _notificationIndex = (_notificationIndex + 1) % _notifications.length;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Living Without Shadows',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: HomePage(),
      ),
      routes: {
        '/home': (context) => HomePage(),
        ChatScreen.routeName: (context) => ChatScreen(),
        ChatPage.routeName: (context) =>
            ChatPage(), // Añade la ruta para ChatPage
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}
