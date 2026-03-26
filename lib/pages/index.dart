import 'package:flutter/material.dart';
import 'package:shop/view/index/home.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _currentIndex = 0;
  final _bottomNavigationBarItem = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
    const BottomNavigationBarItem(icon: Icon(Icons.category), label: "分类"),
    const BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: "购物车"),
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: "我的"),
  ];
  List<BottomNavigationBarItem> _bottomNavigationBarItems() {
    return _bottomNavigationBarItem;
  }

  List<Widget> _indexedStackChildren() {
    return [
      const Home(),
      const Text("分类"),
      const Text("购物车"),
      const Text("我的"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("首页")),
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: _indexedStackChildren(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _currentIndex = index;
          setState(() {});
        },
        //elevation:100,
        currentIndex: _currentIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        items: _bottomNavigationBarItems(),
      ),
    );
  }
}
