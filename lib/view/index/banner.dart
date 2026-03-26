
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop/model/banner_item.dart';
import 'package:shop/utils/dio.dart';

class HomeBanner extends StatefulWidget {
  List<BannerItem> _bannerItems = [];

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
    setState(() {
    
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(items: List.generate(widget._bannerItems.length, (index){
          return Container(
            width: double.infinity,
            color: Colors.green,
            child: Image.network(widget._bannerItems[index].imageUrl,fit: BoxFit.cover,),
          );

        }), options: CarouselOptions(viewportFraction:1, height: 200, autoPlay: true)),

        Container(),
      ],
    );
  }
}
