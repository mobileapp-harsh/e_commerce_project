import 'package:flutter/material.dart';

class FoodSliderWidget extends StatefulWidget {
  const FoodSliderWidget({Key? key}) : super(key: key);

  @override
  State<FoodSliderWidget> createState() => _FoodSliderWidgetState();
}

class _FoodSliderWidgetState extends State<FoodSliderWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      
      child: PageView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return _buildPageItemWidget(index: index);
        },
      ),
    );
  }

  Widget _buildPageItemWidget({required int index}){
    return Container(
      height: 100.0,
      margin: const EdgeInsets.symmetric(horizontal: 6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.red,
        // image: pending to put the image in the container
      ),
    );
  }

}
