import 'package:flutter/material.dart';

class HomeGoodsList extends StatefulWidget {
  const HomeGoodsList({super.key});

  @override
  State<HomeGoodsList> createState() => _HomeGoodsListState();
}

class _HomeGoodsListState extends State<HomeGoodsList> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        //crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio : 1.75,
      ),
      itemBuilder: (ctx, index) {
        return Container(color: Colors.blue, margin: EdgeInsets.only(right: 5,left: 5), child: Text("商品${index + 1}"));
      },
      itemCount: 20,
    );
  }
}
