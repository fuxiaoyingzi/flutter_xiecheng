import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_xiecheng/dao/home_dao.dart';
import 'package:flutter_xiecheng/model/home_model.dart';
import 'package:flutter_xiecheng/widget/home/home_grid_nav.dart';
import 'package:flutter_xiecheng/widget/home/home_local_nav.dart';
import 'package:flutter_xiecheng/widget/home/home_sale_box.dart';
import 'package:flutter_xiecheng/widget/home/home_sub_nav.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double opacity = 0; //APPBar透明度

  /// MediaQuery.removePadding 去除 默认padding
  /// NotificationListener 滑动监听事件，会监听所有的子类

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<HomeModel>(
      builder: (context, snapshot) {
        /* if (snapshot.connectionState == ConnectionState.none) {
              print("ConnectionState.none");
              return Text("请求接口失败");
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              print("ConnectionState.waiting");

              return Center(
                child: SizedBox(
                  child: CircularProgressIndicator(),
                  height: 44.0,
                  width: 44.0,
                ),
              );
            } else*/
        if (snapshot.hasData) {
          print("ConnectionState.hasData");
          return getHomeWidget(snapshot.data);
        } else {
          return Center(
            child: SizedBox(
              child: CircularProgressIndicator(),
              height: 44.0,
              width: 44.0,
            ),
          );
        }
      },
      future: HomeDao.fetch(),
    ));
  }

  ///滑动监听
  void _scrollListener(double pixels) {
    var offset = pixels / 100.0;
    if (offset > 1) {
      offset = 1;
    } else if (offset < 0) {
      offset = 0;
    }
    setState(() {
      opacity = offset;
    });
  }

  getHomeWidget(HomeModel mHomeModel) {
    if (mHomeModel != null) {
      return Container(
        child: MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: Stack(
              children: <Widget>[
                NotificationListener(
                    onNotification: (notification) {
                      if (notification is ScrollUpdateNotification &&
                          notification.depth == 0) {
                        _scrollListener(notification.metrics.pixels);
                        return true;
                      } else {
                        return false;
                      }
                    },
                    child: ListView(
                      children: <Widget>[
                        Container(
                          height: 180,
                          child: Swiper(
                            autoplay: true,
                            pagination: SwiperPagination(),
                            itemCount: mHomeModel.bannerList.length,
                            itemBuilder: (context, index) {
                              return Image.network(
                                mHomeModel.bannerList[index].icon,
                                fit: BoxFit.cover,
                                height: 250,
                              );
                            },
                          ),
                        ),
                        HomeLocalVavList(mHomeModel.localNavList),
                        HomeGridNav(mHomeModel.gridNav),
                        HomeSubVavList(mHomeModel.subNavList),
                        HomeSalesBoxList(mHomeModel.salesBox),
                      ],
                    )),
                Positioned(
                  child: Opacity(
                    opacity: opacity,
                    child: Container(
                      color: Colors.white,
                      height: 45,
                      alignment: Alignment.center,
                      child: Text(
                        "顶部标题",
                      ),
                    ),
                  ),
                  left: 0,
                  top: 0,
                  right: 0,
                ),
              ],
            )),
      );
    } else {
      return Text("暂无数据");
    }
  }
}
