// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:test_s/data/models/characters.dart';
import 'package:test_s/data/web_services/characters_web_services.dart';

class CharactersRepository {
  final CharacterWebServices characterWebServices;
  CharactersRepository({
    required this.characterWebServices,
  });

  Future<List<dynamic>> getAllCharacters() async {
    final characters = await characterWebServices.getAllCharacters();
    return characters
        .map((character) => Characters.fromJson(character))
        .toList();
  }
}
