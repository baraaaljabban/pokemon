import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pokemon/core/errors/exceptions.dart';
import 'package:pokemon/core/network/connection_checker.dart';

class MyGraphQLClient extends GraphQLClient {
  MyGraphQLClient({
    required Link link,
    required GraphQLCache cache,
    required ConnectionChecker connectionChecker,
  }) : super(link: link, cache: cache) {
    _checkConnection(connectionChecker);
  }

  Future<void> _checkConnection(ConnectionChecker connectionChecker) async {
    if (!(await connectionChecker.isConnected() == NetworkStatus.Offline)) {
      // throw ConnectionUnavailableException();
    }
  }
}

var h = {
  "X-Method-Used": "graphiql",
  "content-type": "application/json; charset=utf-8",
};
