import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_recipe_app/controllers/HomePageController.dart';
import 'package:new_recipe_app/utils/colors.dart';

class SidebarWidget extends GetWidget<HomePageController> {
  const SidebarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.mainBlackColor,
      child: Container(
        margin: const EdgeInsets.only(top: 45, left: 15, right: 15, bottom: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "FOODIE",
                      style: TextStyle(
                          color: AppColors.yellowColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  InkWell(
                    customBorder: CircleBorder(),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        Icons.close_rounded,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      controller.controlMenu();
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              DrawerTile(
                title: "Home",
                icon: Icons.home,
                onPress: () {
                  controller.controlMenu();
                },
              ),
              DrawerTile(
                title: "Favorites",
                icon: Icons.favorite,
                onPress: () {
                  controller.controlMenu();
                },
              ),
              DrawerTile(
                title: "Popular",
                icon: Icons.star,
                onPress: () {
                  controller.controlMenu();
                },
              ),
              DrawerTile(
                title: "About Us",
                icon: Icons.info_rounded,
                onPress: () {
                  controller.controlMenu();
                },
              ),
              DrawerTile(
                title: "Logout",
                icon: Icons.exit_to_app_rounded,
                onPress: () {
                  controller.controlMenu();
                  printError(info: "Logout Clicked");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPress;

  const DrawerTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: EdgeInsets.all(0),
        leading: Icon(
          icon,
          color: Colors.white,
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
        onTap: onPress);
  }
}
