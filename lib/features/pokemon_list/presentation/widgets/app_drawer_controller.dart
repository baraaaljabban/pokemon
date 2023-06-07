import 'package:flutter/material.dart';

import 'package:pokemon/core/navigation/nav_router.dart';
import 'package:pokemon/core/navigation/navigation_service.dart';
import 'package:pokemon/core/theme/app_style.dart';
import 'package:pokemon/core/theme/theme_color.dart';

class AppDrawer extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const AppDrawer({
    Key? key,
    required this.scaffoldKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 250,
        decoration: const BoxDecoration(color: ThemeColor.brandBackground),
        child: Column(children: [
          ListTile(
            onTap: () {
              navigationService.navigateTo(NavRouter.favorite);
              toggleDrawer();
            },
            title: Text(
              "Favorite Pokemons",
              style: AppStyle.baseBold.copyWith(color: Colors.white),
            ),
            leading: const Icon(
              Icons.favorite,
              color: Colors.white,
            ),
          )
        ]),
      ),
    );
  }

  toggleDrawer() async {
    if (scaffoldKey.currentState?.isDrawerOpen ?? false) {
      scaffoldKey.currentState?.closeDrawer();
    } else {
      scaffoldKey.currentState?.openDrawer();
    }
  }
}
