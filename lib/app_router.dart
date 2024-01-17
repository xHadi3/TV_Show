import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_s/business_logic/cubit/characters_cubit.dart';
import 'package:test_s/data/repository/characters_repository.dart';
import 'package:test_s/data/web_services/characters_web_services.dart';
import 'package:test_s/presentation/screens/character_detail.dart';
import 'package:test_s/presentation/screens/character_screen.dart';
import 'constants/strings.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepository =
        CharactersRepository(characterWebServices: CharacterWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case allCharactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => charactersCubit,
            child: const CharacterScreen(),
          ),
        );

      case characterDetailsScreen:
        return MaterialPageRoute(builder: (_) => CharacterDetailsScreen());
    }
  }
}
