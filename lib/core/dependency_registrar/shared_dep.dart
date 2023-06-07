import 'dart:async';

import 'package:pokemon/core/constant/constants.dart';
import 'package:pokemon/core/network/connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../network/graphql_client.dart';
import 'dependencies.dart';

Future<void> registerSharedDep() async {
  await initHiveForFlutter();
  sl.registerLazySingleton<ConnectionChecker>(() => ConnectionCheckerImpl());

  var httpLink = HttpLink(
    baseUrl,
    defaultHeaders: h,
  );

  sl.registerLazySingleton<MyGraphQLClient>(
    () => MyGraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: HiveStore()),
      connectionChecker: sl(),
    ),
  );

  var sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
}
