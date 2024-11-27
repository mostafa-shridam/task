import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:task/core/constants/app_colors.dart';
import 'package:task/core/helper/backend_points.dart';
import 'package:task/core/notifications/local_notifications_service.dart';
import 'package:task/core/services/get_it_service.dart';
import 'package:task/feature/home/presentation/model/event_entity.dart';
import 'package:task/feature/main/presentation/view/main_view.dart';
import 'core/helper/on_generate_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotificationsService.init();
  await LocalNotificationsService.configureTimezone();
  // await requestExactAlarmPermission();
  await Hive.initFlutter();

  Hive.registerAdapter(EventEntityAdapter());
  await Hive.openBox<EventEntity>(BackendEndPoints.events);
  getItSetup();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: Colors.white.withOpacity(0.0),
          ),
        ),
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
        ),
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: MainView.routeName,
    );
  }
}

// Future<void> requestExactAlarmPermission() async {
//   if (Platform.isAndroid) {
//     const AndroidIntent intent = AndroidIntent(
//       action: 'android.settings.REQUEST_SCHEDULE_EXACT_ALARM',
//     );
//     await intent.launch();
//   }
// }
