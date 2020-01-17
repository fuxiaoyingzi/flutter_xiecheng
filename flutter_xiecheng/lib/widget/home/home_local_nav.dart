import 'package:flutter/material.dart';
import 'package:flutter_xiecheng/model/home_model.dart';
import 'package:flutter_xiecheng/widget/base_web_view.dart';

///球区入口
class HomeLocalVavList extends StatelessWidget {
  List<CommonModel> localNavList;

  HomeLocalVavList(this.localNavList);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
      padding: EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _getItem(context),
      ),
    );
  }

  ///获取列表数据
  List<Widget> _getItem(context) {
    List<Widget> widgetItems = [];
    localNavList.forEach((item) {
      widgetItems.add(InkWell(
        child: Column(
          children: <Widget>[
            new ClipOval(
              child: new Image.network(
                item.icon,
                width: 40,
                height: 40,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(item.title),
          ],
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return BaseWebView(item.title, item.url);
              }
          ));
        },
      ));
    });
    return widgetItems;
  }
}
