import 'package:pokemon/features/pokemon_list/presentation/cubit/pokemon_list_cubit.dart';

import '../../features/pokemon_list/data/datasources/pokemon_list_remote_data_source.dart';
import '../../features/pokemon_list/data/repositories/pokemon_list_repository_impl.dart';
import '../../features/pokemon_list/domain/repositories/pokemon_list_repository.dart';
import '../../features/pokemon_list/domain/usecases/fetch_pokemon_list.dart';
import 'dependencies.dart';

Future<void> registerPokemonListDeps() async {
  sl.registerSingleton<PokemonListRemoteDataSource>(
    PokemonListRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerFactory<PokemonListRepository>(
    () => PokemonListRepositoryImpl(
      remoteDataSource: sl(),
    ),
  );

  sl.registerFactory<FetchPokemonList>(() => FetchPokemonList(repository: sl()));
  sl.registerLazySingleton<PokemonListCubit>(
    () => PokemonListCubit(
      fetchPokemonList: sl(),
    ),
  );
}
