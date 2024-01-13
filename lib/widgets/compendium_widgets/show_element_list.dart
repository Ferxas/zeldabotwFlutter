import 'package:flutter/material.dart';
import 'package:jma_app_project/api_routes/all_elements_api.dart';
import 'package:jma_app_project/api_routes/creatures_api.dart';
import 'package:jma_app_project/api_routes/horse_api.dart';
import 'package:jma_app_project/api_routes/equipment_api.dart';
import 'package:jma_app_project/api_routes/materials_api.dart';
import 'package:jma_app_project/api_routes/monster_api.dart';
import 'package:jma_app_project/api_routes/treasure_api.dart';
import 'package:jma_app_project/models/creature.dart';
import 'package:jma_app_project/models/equipment.dart';
import 'package:jma_app_project/models/game_element.dart';
import 'package:jma_app_project/models/horse.dart';
import 'package:jma_app_project/models/materials.dart';
import 'package:jma_app_project/models/monster.dart';
import 'package:jma_app_project/models/treasure.dart';
import 'package:jma_app_project/widgets/compendium_widgets/list_element.dart';
import 'package:jma_app_project/widgets/compendium_widgets/list_horse.dart';

class ShowAllElementsList extends StatelessWidget {
  const ShowAllElementsList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiLoadAll(),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<GameElement>> snapshot,
      ) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final allElementsList = snapshot.data!;
        return ListView.builder(
          itemCount: allElementsList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListElement(gameElement: allElementsList[index]);
          },
        );
      },
    );
  }
}

class ShowCreatureList extends StatelessWidget {
  const ShowCreatureList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiLoadCreatures(),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<Creature>> snapshot,
      ) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final creatureList = snapshot.data!;
        return ListView.builder(
          itemCount: creatureList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListElement(gameElement: creatureList[index]);
          },
        );
      },
    );
  }
}

class ShowHorseList extends StatelessWidget {
  const ShowHorseList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiLoadHorses(),
      builder: (
          BuildContext context,
          AsyncSnapshot<List<Horse>> snapshot,
          ) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final horseList = snapshot.data!;
        return ListView.builder(
          itemCount: horseList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListHorse(gameElement: horseList[index]);
          },
        );
      },
    );
  }
}

class ShowEquipmentList extends StatelessWidget {
  const ShowEquipmentList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiLoadEquipment(),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<Equipment>> snapshot,
      ) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final equipmentList = snapshot.data!;
        return ListView.builder(
          itemCount: equipmentList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListElement(gameElement: equipmentList[index]);
          },
        );
      },
    );
  }
}

class ShowMaterialsList extends StatelessWidget {
  const ShowMaterialsList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiLoadMaterials(),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<Materials>> snapshot,
      ) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final materialsList = snapshot.data!;
        return ListView.builder(
          itemCount: materialsList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListElement(gameElement: materialsList[index]);
          },
        );
      },
    );
  }
}

class ShowMonsterList extends StatelessWidget {
  const ShowMonsterList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiLoadMonsters(),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<Monster>> snapshot,
      ) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final monsterList = snapshot.data!;
        return ListView.builder(
          itemCount: monsterList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListElement(gameElement: monsterList[index]);
          },
        );
      },
    );
  }
}

class ShowTreasureList extends StatelessWidget {
  const ShowTreasureList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiLoadTreasures(),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<Treasure>> snapshot,
      ) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final treasureList = snapshot.data!;
        return ListView.builder(
          itemCount: treasureList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListElement(gameElement: treasureList[index]);
          },
        );
      },
    );
  }
}
