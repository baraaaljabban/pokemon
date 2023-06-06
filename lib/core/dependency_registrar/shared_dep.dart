import 'dart:async';

import 'package:pokemon/core/constant/constants.dart';
import 'package:pokemon/core/network/connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'dependencies.dart';

Future<void> registerSharedDep() async {
  await initHiveForFlutter();
  var httpLink = HttpLink(
    baseUrl,
    defaultHeaders: h,
  );

  sl.registerLazySingleton<MyGraphQLClient>(
    () => MyGraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: HiveStore()),
    ),
  );

  var sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  sl.registerLazySingleton<ConnectionChecker>(() => ConnectionCheckerImpl());
}

class MyGraphQLClient extends GraphQLClient {
  MyGraphQLClient({required super.link, required super.cache});
}

var h = {
  "access-control-allow-origin": "*",
  "cache-control": "no-store",
  "connection": "keep-alive",
  "content-type": "application/json; charset=utf-8",
  "x-powered-by": "Express"
};
