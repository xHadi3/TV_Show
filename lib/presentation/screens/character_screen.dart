import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_s/business_logic/cubit/characters_cubit.dart';
import 'package:test_s/constants/my_colors.dart';
import 'package:test_s/presentation/widgets/character_item.dart';

import '../../data/models/characters.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  CharacterModel? allCharacters = CharacterModel();
  // late List<CharacterModel> searchForCharacter;
  // late List<CharacterModel> searchForCharacter = allCharacters!.toList;
  // bool isSearching = false;

  // Widget _buildSearchField() {
  //   return TextField(
  //     controller: _searchTextController,
  //     cursorColor: MyColors.myGrey,
  //     decoration: InputDecoration(
  //       hintText: 'Find a Character ...',
  //       border: InputBorder.none,
  //       hintStyle: TextStyle(fontSize: 18, color: MyColors.myGrey),
  //     ),
  //     style: TextStyle(color: MyColors.myGrey, fontSize: 18),
  //     onChanged: (searcedCharacter) {
  //       addSearchedForitemsToSearchedList(searcedCharacter);
  //     },
  //   );
  // }

  // void addSearchedForitemsToSearchedList() {
  //   searchForCharacter = allCharacters?.where((character) =>
  //       character.name.toLowerCase().startWith(searchForCharacter)).toList();
  // }

  final _searchTextController = TextEditingController();
  initCall() async {
    allCharacters =
        await BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  @override
  void initState() {
    super.initState();
    initCall();
    //print(allCharacters.results?.first.name);
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
      if (state is CharactersLoaded) {
        allCharacters = (state).characters;
        print(allCharacters!.results?.first.name);
        return buildLoadedListWidgets();
      } else {
        return showLoadingIndicator();
      }
    });
  }

  Widget showLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: MyColors.myYellow,
      ),
    );
  }

  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGrey,
        child: Column(
          children: [
            buildCharactersList(),
          ],
        ),
      ),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: allCharacters!.results?.length,
      itemBuilder: (ctx, index) {
        return CharacterItem(
          character: allCharacters!.results?[index],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        title: const Text(
          "Characters",
          style: TextStyle(color: MyColors.myGrey),
        ),
      ),
      body: buildBlocWidget(),
    );
  }
}
