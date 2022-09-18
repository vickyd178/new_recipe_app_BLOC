import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_recipe_app/utils/colors.dart';

class HeaderWidget extends StatelessWidget {
  final String pageTitle;
  final IconData icon;
  final VoidCallback onPress;
  final String? thumb;

  const HeaderWidget(
      {Key? key,
      required this.pageTitle,
      required this.icon,
      required this.onPress,
      this.thumb = null})
      : super(key: key);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.mainBlackColor,
      ),
      titleTextStyle: TextStyle(
        color: AppColors.titleColor,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      iconTheme: const IconThemeData(color: Colors.black),
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        pageTitle,
      ),
      leading: IconButton(
        icon: Icon(icon),
        onPressed: onPress,
      ),
      actions: thumb == null
          ? null
          : [
              Container(
                margin: EdgeInsets.only(right: 10),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  minRadius: 24,
                  maxRadius: 30,
                  child: Image(
                    image: NetworkImage(thumb!),
                  ),
                ),
              )
            ],
    );
  }
}
