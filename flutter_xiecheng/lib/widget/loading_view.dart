import 'package:flutter/material.dart';

///进度条
class LoadingView extends StatelessWidget {
  Widget child;
  bool isLoading;
  bool isCover = true;

  LoadingView(this.child, this.isLoading, {this.isCover});

  @override
  Widget build(BuildContext context) {
    return !isCover
        ? !isLoading ? child : _loadingView()
        : Stack(
            children: <Widget>[child, isLoading ? _loadingView() : null],
          );
  }

  Widget _loadingView() {
    return CircularProgressIndicator();
  }
}
