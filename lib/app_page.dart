import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/navigation/nav_router.dart';
import 'core/navigation/navigation_service.dart';

class AppPage extends StatefulWidget {
  const AppPage({
    super.key,
  });

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: 'Georgia',
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: NavRouter.generateRoute,
      navigatorKey: navigationService.navigationKey,
      initialRoute: '/',
    );
  }
}
