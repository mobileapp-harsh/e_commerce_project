import 'package:e_commerce_project/constants/preference_constants.dart';
import 'package:e_commerce_project/constants/size_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodSliderWidget extends StatefulWidget {
  const FoodSliderWidget({Key? key}) : super(key: key);

  @override
  State<FoodSliderWidget> createState() => _FoodSliderWidgetState();
}

class _FoodSliderWidgetState extends State<FoodSliderWidget> {
  final PageController _sliderPageController =
      PageController(viewportFraction: 1.0);
  late RxDouble currentPagePosition = 0.0.obs;

  @override
  void initState() {
    super.initState();
    _sliderPageController.addListener(
      () {
        currentPagePosition.value = _sliderPageController.page!;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.0,
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: _sliderPageController,
        itemCount: 5,
        itemBuilder: (context, index) {
          return _buildPageItemWidget(index: index);
        },
      ),
    );
  }

  Widget _buildPageItemWidget({required int index}) {
    return Stack(
      children: [
        Container(
          height: 200.0,
          margin: const EdgeInsets.symmetric(horizontal: 6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.red,
            // image: pending to put the image in the container
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: IntrinsicHeight(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
              margin: const EdgeInsets.symmetric(horizontal: 24.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                    )
                  ]
                  // image: pending to put the image in the container
                  ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "data",
                    style: TextStyle(
                      fontSize: CommonsizeConstants.FONT_SIZE_18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(
                          5,
                          (index) => const Icon(
                            Icons.star,
                            color: ColorCommonConstants.brownColor,
                            size: 20.0,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      const Text(
                        "4.5",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      const Expanded(
                        child: Text(
                          "451251 \tComments",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _iconandTextWidget(
                        icon: Icons.circle_sharp,
                        text: "Normal",
                        color: Colors.grey.shade600,
                        iconColor: Colors.yellow,
                      ),
                      _iconandTextWidget(
                        icon: Icons.location_on,
                        text: "1.7km",
                        color: Colors.grey.shade600,
                        iconColor: ColorCommonConstants.brownColor,
                      ),
                      _iconandTextWidget(
                        icon: Icons.access_time_rounded,
                        text: "32min",
                        color: Colors.grey.shade600,
                        iconColor: Colors.red.shade400,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _iconandTextWidget(
      {required IconData icon,
      required String text,
      required Color color,
      required Color iconColor}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: iconColor,
          size: 16.0,
        ),
        const SizedBox(
          width: 6.0,
        ),
        Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
