import 'package:dartz/dartz.dart';

import 'errors/failures.dart';

abstract class UseCase<Params, Type> {
  Future<Either<Failure, Type>> call({
    required Params params,
  });
}
