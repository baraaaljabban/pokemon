import 'package:pokemon/features/pokemon_details/data/datasources/pokemon_details_remote_data_source.dart';
import 'package:pokemon/features/pokemon_details/data/repositories/pokemon_details_repository_impl.dart';
import 'package:pokemon/features/pokemon_details/domain/repositories/pokemon_details_repository.dart';
import 'package:pokemon/features/pokemon_details/domain/usecases/fetch_pokemon_details.dart';
import 'package:pokemon/features/pokemon_details/presentation/cubit/pokemon_details_cubit.dart';

import 'dependencies.dart';

Future<void> registerPokemonDetailsDeps() async {
  sl.registerSingleton<PokemonDetailsRemoteDataSource>(
    PokemonDetailsRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerFactory<PokemonDetailsRepository>(
    () => PokemonDetailsRepositoryImpl(
      remoteDataSource: sl(),
    ),
  );

  sl.registerFactory<FetchPokemonDetails>(() => FetchPokemonDetails(repository: sl()));

  sl.registerFactory<PokemonDetailsCubit>(
    () => PokemonDetailsCubit(
      fetchPokemonDetails: sl(),
    ),
  );
}
