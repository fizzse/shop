import 'package:flutter/material.dart';
import 'package:shop/view/index/banner.dart';
import 'package:shop/view/index/category.dart';
import 'package:shop/view/index/goods.dart';
import 'package:shop/view/index/popular.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: HomeBanner()),
        SliverToBoxAdapter(child: SizedBox(height: 20)),
        HomeCategory(),
        SliverToBoxAdapter(child: SizedBox(height: 20)),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: HomePopular(),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 20)),
        HomeGoodsList(),
      ],
    );
  }
}

