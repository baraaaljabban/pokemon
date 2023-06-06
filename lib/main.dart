import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_page.dart';
import 'core/bloc/app_bloc_observer.dart';
import 'core/bloc/base_bloc_provider.dart';
import 'core/dependency_registrar/dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = AppBlocObserver();
  await slInit();

  runApp(
    const BaseBlocProviderWidget(
      child: AppPage(),
    ),
  );
}
