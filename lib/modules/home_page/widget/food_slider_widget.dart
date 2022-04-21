import 'package:dots_indicator/dots_indicator.dart';
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
  late final RxDouble _currentPagePosition = 0.0.obs;
  late final RxDouble _scaleFactor = 0.0.obs;

  @override
  void initState() {
    _sliderPageController.addListener(
      () {
        _currentPagePosition.value = _sliderPageController.page!;
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 250.0,
          child: PageView.builder(
            physics: const BouncingScrollPhysics(),
            controller: _sliderPageController,
            itemCount: 5,
            itemBuilder: (context, index) {
              return _buildPageItemWidget(index: index);
            },
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        Obx(
          () => DotsIndicator(
            dotsCount: 5,
            position: _currentPagePosition.value,
            decorator: DotsDecorator(
              color: Colors.grey,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeColor: ColorCommonConstants.brownColor,
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                "Popular",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3.0),
                child: const Text(
                  ".",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 2.0),
                child: const Text(
                  "Food Preapiring",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        SizedBox(
          height: deviceSize.height * 0.65,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return _buildPopularItemWidget();
            },
          ),
        )
      ],
    );
  }

  Widget _buildPopularItemWidget() {
    return Container(
      height: 80.0,
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Container(
            height: 80.0,
            width: 80.0,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(
                10.0,
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 80.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "data",
                      style: TextStyle(
                        fontSize: CommonsizeConstants.FONT_SIZE_18,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    const Text(
                      "data",
                      style: TextStyle(
                        fontSize: CommonsizeConstants.FONT_SIZE_14,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      color: Color(0xFFe8e8e8),
                      blurRadius: 2.0,
                      offset: Offset(0, 1),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 2.0,
                      offset: Offset(-1, 0),
                    ),
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 2.0,
                      offset: Offset(1, 0),
                    ),
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
                    height: 16.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

  @override
  void dispose() {
    _sliderPageController.dispose();
    super.dispose();
  }
}
