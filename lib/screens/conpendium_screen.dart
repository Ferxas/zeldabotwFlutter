import 'package:flutter/material.dart';
import 'package:jma_app_project/widgets/compendium_widgets/compendium_tab_bar.dart';
import 'package:jma_app_project/widgets/compendium_widgets/search_list_element.dart';
import 'package:jma_app_project/widgets/general_widgets/home_button.dart';
import 'package:jma_app_project/widgets/general_widgets/important_tittle.dart';

class ConpendiumScreen extends StatelessWidget {
  const ConpendiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          shadowColor: const Color.fromARGB(255, 255, 225, 127),
          elevation: 3,
          backgroundColor: Colors.black,
          titleSpacing: 0,
          automaticallyImplyLeading: false,
          title: ImportantTittle(
            screenSize: screenSize,
            tittleName: 'COMPENDIUM     ',
          ),
          centerTitle: true,
          leading: const HomeButton(),
        ),
        body: const Stack(
          children: [
            ConpendiumTabBar(),
            SearchListElement(),
          ],
        ));
  }
}
