import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_recipe_app/controllers/HomePageController.dart';
import 'package:new_recipe_app/pages/category_page_body.dart';
import 'package:new_recipe_app/widgets/header_widget.dart';
import 'package:new_recipe_app/widgets/sidebar_widget.dart';

class HomePage extends GetWidget<HomePageController> {
   HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: HeaderWidget(
          pageTitle: "Food Recipe",
          icon: Icons.menu,
          onPress: () {
            controller.controlMenu();
          },
        ),
      ),
      key: controller.scaffoldKey,
      drawer: SidebarWidget(),
      body: SafeArea(
        child: CategoryPageBody(),
      ),
    );
  }
}
