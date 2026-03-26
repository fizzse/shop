import 'package:flutter/material.dart';

class HomePopular extends StatefulWidget {
  const HomePopular({super.key});

  @override
  State<HomePopular> createState() => _HomePopularState();
}

class _HomePopularState extends State<HomePopular> {
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
          child: Container(
            width: 100,
            height: 100,
            color: Colors.green,
            child: const Center(child: Text("人气推荐")),
          ),
        ),

        SizedBox(width: 20),
        Expanded(
          child: Container(
            width: 100,
            height: 100,
            color: Colors.green,
            child: const Center(child: Text("人气推荐")),
          ),
        ),
      ],
    );
  }
}
