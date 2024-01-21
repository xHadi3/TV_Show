import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_s/data/models/characters.dart';
import 'package:test_s/data/repository/characters_repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  List<Results> characters = [];
  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  List<Results> getAllCharacters() {
    charactersRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters: characters)); // start
      this.characters = characters;
    });
    return characters;
  }
}
