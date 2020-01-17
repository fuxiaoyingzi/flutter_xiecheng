import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

//携程白名单，当返回到这些页面的时候，直接返回到首页
const CATCH_URLS = ["m.ctrip.com/", "m.ctrip.com/html5/", "m.ctrip.com/html5"];

class BaseWebView extends StatefulWidget {
  String title; //标题
  String url;

  BaseWebView(this.title, this.url); //跳转地址

  @override
  _BaseWebViewState createState() => _BaseWebViewState();
}

class _BaseWebViewState extends State<BaseWebView> {
  FlutterWebviewPlugin _webviewPlugin = FlutterWebviewPlugin();
  StreamSubscription<String> onUrlChangedListener;
  StreamSubscription<WebViewStateChanged> onStateChanged;
  StreamSubscription<WebViewHttpError> httpError;

  bool backMain = false;

  @override
  void initState() {
    super.initState();
    _webviewPlugin.close();
    //当页面发生改变的时候
    onUrlChangedListener = _webviewPlugin.onUrlChanged.listen((url) {});

    //当状态发生变化的时候
    onStateChanged =
        _webviewPlugin.onStateChanged.listen((WebViewStateChanged state) {
      if (state.type == WebViewState.startLoad) {
        //新页面加载
        print("state.url == " + state.url);
        if (!_isContainer(state.url) && !backMain) {
          _webviewPlugin.reloadUrl(state.url);
        } else {
          backMain = true;
          Navigator.pop(context);
        }
      }
    });

    //加载发生错误
    httpError = _webviewPlugin.onHttpError.listen((WebViewHttpError httpError) {
      print(httpError.toString());
    });
  }

  @override
  void dispose() {
    onUrlChangedListener.cancel();
    httpError.cancel();
    onStateChanged.cancel();
    _webviewPlugin.close();
    _webviewPlugin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          /*  FractionallySizedBox( //撑满屏幕宽度
            widthFactor: 1,
            child: Stack(
              children: <Widget>[
                Container(
                  child: GestureDetector(
                    onTap: () {
                      print("退出");
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black38,
                      size: 36,
                    ),
                  ),
                ),
                Positioned(
                  child: Text(
                    widget.title,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  left: 0,
                  right: 0,
                )
              ],
            ),
          ),*/
          Expanded(
              //沉默屏幕（高度，宽度）
              child: WebviewScaffold(
            url: widget.url,
            withJavascript: true,
            withZoom: true,
            withLocalStorage: true,
          ))
        ],
      ),
    );
  }

  ///是否包含 那些不需要返回的界面
  bool _isContainer(String url) {
    bool container = false;
    for (var i in CATCH_URLS) {
      if (url?.endsWith(i) ?? false) {
        container = true;
        break;
      }
    }
    return container;
  }
}
