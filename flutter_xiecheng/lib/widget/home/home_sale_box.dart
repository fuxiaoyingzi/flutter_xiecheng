import 'package:flutter/material.dart';
import 'package:flutter_xiecheng/model/home_model.dart';
import 'package:flutter_xiecheng/widget/base_web_view.dart';

///活动入口
class HomeSalesBoxList extends StatelessWidget {
  SalesBoxModel mSalesBoxModel;

  HomeSalesBoxList(this.mSalesBoxModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
      padding: EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Color(0xffdfdfdf), width: 1))),
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.network(
                  mSalesBoxModel.icon,
                  height: 20,
                ),
                InkWell(
                  child: Container(
                    padding:
                        EdgeInsets.only(left: 10, top: 1, right: 10, bottom: 1),
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      gradient: LinearGradient(colors: [Color(0xffee7800),Color(0xffff0000)],)
                    ),
                    child: Text(
                      "查看更多活动 >",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return BaseWebView("查看更多", mSalesBoxModel.moreUrl);
                    }));
                  },
                )
              ],
            ),
          ),
          _getItemList(context)[0],
          _getItemList(context)[1],
          _getItemList(context)[2],
        ],
      ),
    );
  }

  ///获取列表数据
  List<Widget> _getItemList(context) {
    List<Widget> widgetItems = [];
    widgetItems.add(_doubleItem(context, mSalesBoxModel.bigCard1,
        mSalesBoxModel.bigCard2, true, false));
    widgetItems.add(_doubleItem(context, mSalesBoxModel.smallCard1,
        mSalesBoxModel.smallCard2, false, false));
    widgetItems.add(_doubleItem(context, mSalesBoxModel.smallCard3,
        mSalesBoxModel.smallCard4, false, true));

    return widgetItems;
  }

  Widget _doubleItem(
      context, CommonModel left, CommonModel right, bool isBig, bool isLast) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        _getItem(context, left, isBig, true, isLast),
        _getItem(context, right, isBig, false, isLast)
      ],
    );
  }

  Widget _getItem(context, item, bool isBig, bool isLeft, bool isLast) {
    return GestureDetector(
      child: new Image.network(
        item.icon,
        fit: BoxFit.fill,
        width: MediaQuery.of(context).size.width / 2 - 10,
        height: isBig ? 129 : 80,
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return BaseWebView(item.title, item.url);
        }));
      },
    );
  }
}
