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

        Positioned(top: 15, child: BannerInput()),
        Positioned(
          bottom: 40,
          child: BannerSelect(
            bannerItems: widget._bannerItems,
            carouselController: widget._carouselController,
          ),
        ),
      ],
    );
  }
}

class BannerInput extends StatefulWidget {
  const BannerInput({super.key});

  @override
  State<BannerInput> createState() => _BannerInputState();
}

class _BannerInputState extends State<BannerInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      width: MediaQuery.of(context).size.width,
      height: 40,
      child: TextField(
        decoration: InputDecoration(
          hintText: "搜索",
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.white70),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}

class BannerSelect extends StatefulWidget {
  final List<BannerItem> bannerItems;
  final CarouselSliderController carouselController ;
  int currentIndex = 0;

  BannerSelect({
    super.key,
    required this.bannerItems,
    required this.carouselController,
  });

  @override
  State<BannerSelect> createState() => _BannerSelectState();
}

class _BannerSelectState extends State<BannerSelect> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 20,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(widget.bannerItems.length, (index) {
          return GestureDetector(
            onTap: () {
              widget.currentIndex = index;
              widget.carouselController.animateToPage(index);

              setState(() {});
            },
            child: Container(
              width: 40,
              height: 6,
              decoration: BoxDecoration(
                color: index == widget.currentIndex
                    ? Colors.black
                    : Colors.white,
                border: Border.all(color: Colors.green, width: 1),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          );
        }),
      ),
    );
  }
}
