import 'package:flutter/material.dart';

class HomeCategory extends StatefulWidget {
  const HomeCategory({super.key});

  @override
  State<HomeCategory> createState() => _HomeCategoryState();
}

class _HomeCategoryState extends State<HomeCategory> {
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(pinned :true, delegate: HomeCategoryDelegate(),);
  }
}

class HomeCategoryDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 50,
      padding: EdgeInsets.only(left: 10, right: 10),
      alignment: Alignment.centerLeft,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (ctx, index) {
          return Container(
            alignment: Alignment.center,
            width: 60,
            height: 40,
            color: Colors.green,
            margin: const EdgeInsets.only(right: 10),
            child: Text("分类${index + 1}"),
          );
        },
      ),
    );
  }

  @override
  double get maxExtent => 40;

  @override
  double get minExtent => 40;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}