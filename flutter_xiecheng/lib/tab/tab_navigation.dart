import 'package:flutter/material.dart';
import 'package:flutter_xiecheng/pages/home_page.dart';
import 'package:flutter_xiecheng/pages/my_page.dart';
import 'package:flutter_xiecheng/pages/search_page.dart';
import 'package:flutter_xiecheng/pages/travel_page.dart';

class TabNavigation extends StatefulWidget {
  @override
  _TabNavigationState createState() => _TabNavigationState();
}

class _TabNavigationState extends State<TabNavigation> {
  List<Widget> pageViews = [HomePage(), SearchPage(), TravelPage(), MyPage()];
  List<BottomNavigationBarItem> navigationBarItems;
  int selIndex = 0;
  PageController _controller = PageController();

  ///获取 底部导航栏 item
  BottomNavigationBarItem _getBarItem(
      Icon icon, activeIcon, title, currentIndex) {
    var barItem = BottomNavigationBarItem(
        icon: icon,
        activeIcon: activeIcon,
        title: Text(
          title,
          style: TextStyle(
              color: selIndex == currentIndex ? Colors.blue : Colors.grey),
        ));
    return barItem;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: pageViews,
        onPageChanged: (index){
          setState(() {
            selIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: getNavigationBarItem(),
        currentIndex: selIndex,
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            selIndex = index;
          });
        },
      ),
    );
  }

  getNavigationBarItem() {
    navigationBarItems = [
      _getBarItem(
          Icon(
            Icons.home,
            color: Colors.grey,
          ),
          Icon(
            Icons.home,
            color: Colors.blue,
          ),
          "首页",
          0),
      _getBarItem(
          Icon(
            Icons.search,
            color: Colors.grey,
          ),
          Icon(
            Icons.search,
            color: Colors.blue,
          ),
          "搜索",
          1),
      _getBarItem(
          Icon(
            Icons.card_travel,
            color: Colors.grey,
          ),
          Icon(
            Icons.card_travel,
            color: Colors.blue,
          ),
          "旅拍",
          2),
      _getBarItem(
          Icon(
            Icons.person_outline,
            color: Colors.grey,
          ),
          Icon(
            Icons.people_outline,
            color: Colors.blue,
          ),
          "我的",
          3),
    ];
    return navigationBarItems;
  }
}
