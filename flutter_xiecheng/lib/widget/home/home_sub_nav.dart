import 'package:flutter/material.dart';
import 'package:flutter_xiecheng/model/home_model.dart';
import 'package:flutter_xiecheng/widget/base_web_view.dart';

///活动入口
class HomeSubVavList extends StatelessWidget {
  List<CommonModel> subNavList;

  HomeSubVavList(this.subNavList);

  @override
  Widget build(BuildContext context) {
    int lineCount = (subNavList.length / 2 + 0.5).toInt();
    print("lineCount = $lineCount --- ${subNavList.length}");
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
      padding: EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _getItemList(context, subNavList.sublist(0, lineCount)),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _getItemList(
                context, subNavList.sublist(lineCount, subNavList.length)),
          )
        ],
      ),
    );
  }

  ///获取列表数据
  List<Widget> _getItemList(context, itemList) {
    List<Widget> widgetItems = [];
    itemList.forEach((item) {
      widgetItems.add(_getItem(context, item));
    });
    return widgetItems;
  }

  Widget _getItem(context, item) {
    return Expanded(
      flex: 1,
      child: InkWell(
        child: Column(
          children: <Widget>[
            new Image.network(
              item.icon,
              width: 25,
              height: 25,
            ),
            SizedBox(
              height: 5,
            ),
            Text(item.title),
          ],
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return BaseWebView(item.title, item.url);
          }));
        },
      ),
    );
  }
}
