import 'package:get_it/get_it.dart';
import 'package:pokemon/core/dependency_registrar/start_up.dart';

import 'shared_dep.dart';

final sl = GetIt.instance;

Future<void> slInit() async {
  await registerSharedDep();
  registerStartUpDep();
}
