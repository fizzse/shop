import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop/model/banner_item.dart';
import 'package:shop/utils/dio.dart';

class HomeBanner extends StatefulWidget {
  List<BannerItem> _bannerItems = [];
  final _carouselController = CarouselSliderController();
  int _currentIndex = 0;

  HomeBanner({super.key});

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  @override
  initState() {
    super.initState();
    _loadBannerData();
  }

  Future<void> _loadBannerData() async {
    widget._bannerItems = await httpRequest.getBanner();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          carouselController: widget._carouselController,

          items: List.generate(widget._bannerItems.length, (index) {
            return Container(
              width: double.infinity,
              color: Colors.green,
              child: Image.network(
                widget._bannerItems[index].imageUrl,
                fit: BoxFit.cover,
              ),
            );
          }),
          options: CarouselOptions(
            viewportFraction: 1,
            height: 200,
            autoPlay: false,
          ),
        ),

        Positioned(
          top: 15,
          child: Container(
            padding: EdgeInsets.only(left: 20,right: 20),
            width: MediaQuery.of(context).size.width,
            height: 40,
            child: TextField(decoration: InputDecoration(hintText: "搜索", border:OutlineInputBorder(borderRadius: BorderRadius.circular(20)) )),
          ),
        ),

        Positioned(
          bottom: 10,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 20,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget._bannerItems.length, (index) {
                return GestureDetector(
                  onTap: () {
                    widget._currentIndex = index;
                    widget._carouselController.animateToPage(index);

                    setState(() {});
                  },
                  child: Container(
                    width: 40,
                    height: 6,
                    decoration: BoxDecoration(
                      color: index == widget._currentIndex
                          ? Colors.black
                          : Colors.white,
                      border: Border.all(color: Colors.green, width: 1),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}

// class BannerSelecter extends StatefulWidget {
//   const BannerSelecter({super.key});

//   @override
//   State<BannerSelecter> createState() => _BannerSelecterState();
// }

// class _BannerSelecterState extends State<BannerSelecter> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       height: 20,
//       alignment: Alignment.center,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: List.generate(widget._bannerItems.length, (index) {
//           return Container(
//             width: 30,
//             height: 10,
//             //margin: EdgeInsets.only(left: 5),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               border: Border.all(color: Colors.green, width: 1),
//               borderRadius: BorderRadius.circular(5),
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }
