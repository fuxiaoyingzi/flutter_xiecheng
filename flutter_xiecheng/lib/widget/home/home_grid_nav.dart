import 'package:flutter/material.dart';
import 'package:flutter_xiecheng/model/home_model.dart';

//首页网格布局
class HomeGridNav extends StatelessWidget {
  GridNavModel gridNav;

  HomeGridNav(this.gridNav);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10,top: 3),
      child: PhysicalModel( //因为设置了背景色，所以如果通过container设置圆角没有效果
        //设置大布局圆角
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(6)),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: _getGridNavList(),
        ),
      ),
    );
  }

  _getGridNavList() {
    List<Widget> gridNavItems = [];
    if (gridNav.hotel != null) {
      gridNavItems.add(_getRowItem(gridNav.hotel, true));
    }
    if (gridNav.flight != null) {
      gridNavItems.add(_getRowItem(gridNav.flight, false));
    }
    if (gridNav.travel != null) {
      gridNavItems.add(_getRowItem(gridNav.travel, false));
    }
    return gridNavItems;
  }

  //行
  _getRowItem(GridNavItem navItem, bool isTop) {
    List<Widget> items = [];
    items.add(_getMainItem(navItem.mainItem));
    items.add(_getDoubleItem(navItem.item1, navItem.item2));
    items.add(_getDoubleItem(navItem.item3, navItem.item4));
    List<Widget> expandedWidget = [];
    items.forEach((item) {
      expandedWidget.add(Expanded(
        child: item,
        flex: 1,
      ));
    });
    Color startColor = Color(int.parse("0xff" + navItem.startColor));
    Color endColor = Color(int.parse("0xff" + navItem.endColor));
    return Container(
      height: 88,
      margin: isTop ? null : EdgeInsets.only(top: 3),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [startColor, endColor])),
      child: Row(
        children: expandedWidget,
      ),
    );
  }

  //左边主模块
  _getMainItem(CommonModel mainItem) {
    return Container(
      height: 88,
      width: 121,
      child: Stack(
        children: <Widget>[
          Image.network(
            mainItem.icon,
            fit: BoxFit.contain,
            width: 110,
            alignment: Alignment.bottomCenter,
            height: 80,
          ),
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: 10),
            child: Text(
              mainItem.title,
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          )
        ],
      ),
    );
  }

  //双层item
  _getDoubleItem(CommonModel topItem, CommonModel bottomItem) {
    return Column(
      children: <Widget>[
        Expanded( //上下铺满
          child: _item(topItem, true),
          flex: 1,
        ),
        Expanded(
          child: _item(bottomItem, false),
          flex: 1,
        ),
      ],
    );
  }

  //小格子框
  _item(CommonModel item1, bool isTop) {
    var borderSide = BorderSide(color: Colors.white, width: 0.8);
    return FractionallySizedBox(
      widthFactor: 1, //撑满父布局的宽度
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border(
                bottom: isTop ? borderSide : BorderSide.none,
                left: borderSide)),
        child: Text(
          item1.title,
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }
}
