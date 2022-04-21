import 'package:flutter/material.dart';

class PopularFoodDetailsScreen extends StatefulWidget {
  const PopularFoodDetailsScreen({Key? key}) : super(key: key);

  @override
  State<PopularFoodDetailsScreen> createState() =>
      _PopularFoodDetailsScreenState();
}

class _PopularFoodDetailsScreenState extends State<PopularFoodDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                height: deviceSize.height * 0.35,
                color: Colors.red,
              ),
            ),
            Positioned(
              top: 16.0,
              left: 20.0,
              right: 20.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _appIconsForFoodDetailsScreen(
                    icon: Icons.arrow_back_ios,
                    backgroundColor: Colors.white38,
                    color: Colors.black,
                    size: 40.0,
                  ),
                  _appIconsForFoodDetailsScreen(
                    icon: Icons.arrow_back_ios,
                    backgroundColor: Colors.white38,
                    color: Colors.black,
                    size: 40.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _appIconsForFoodDetailsScreen(
      {required IconData icon,
      required Color backgroundColor,
      required Color color,
      required double size}) {
    return Container(
      // alignment: Alignment.center,
      height: size,
      width: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 2),
        color: backgroundColor,
      ),
      child: Align(
        alignment: Alignment.center,
        child: Icon(
          icon,
          color: color,
          size: 24.0,
        ),
      ),
    );
  }
}
