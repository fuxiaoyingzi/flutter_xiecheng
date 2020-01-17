class HomeModel {
  ConfigModel config; //搜索模块
  List<CommonModel> bannerList; //轮播图
  List<CommonModel> localNavList; //球区入口
  GridNavModel gridNav; //网格卡片布局
  List<CommonModel> subNavList; //运营资源位
  SalesBoxModel salesBox; //运营活动营销

  HomeModel(
      {this.config,
      this.bannerList,
      this.localNavList,
      this.gridNav,
      this.subNavList,
      this.salesBox});

  HomeModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    config = json['config'] != null
        ? new ConfigModel.fromJson(json['config'])
        : null;
    if (json['bannerList'] != null) {
      bannerList = new List<CommonModel>();
      json['bannerList'].forEach((v) {
        bannerList.add(new CommonModel.fromJson(v));
      });
    }
    if (json['localNavList'] != null) {
      localNavList = new List<CommonModel>();
      json['localNavList'].forEach((v) {
        localNavList.add(new CommonModel.fromJson(v));
      });
    }
    gridNav = json['gridNav'] != null
        ? new GridNavModel.fromJson(json['gridNav'])
        : null;
    if (json['subNavList'] != null) {
      subNavList = new List<CommonModel>();
      json['subNavList'].forEach((v) {
        subNavList.add(new CommonModel.fromJson(v));
      });
    }
    salesBox = json['salesBox'] != null
        ? new SalesBoxModel.fromJson(json['salesBox'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.config != null) {
      data['config'] = this.config.toJson();
    }
    if (this.bannerList != null) {
      data['bannerList'] = this.bannerList.map((v) => v.toJson()).toList();
    }
    if (this.localNavList != null) {
      data['localNavList'] = this.localNavList.map((v) => v.toJson()).toList();
    }
    if (this.gridNav != null) {
      data['gridNav'] = this.gridNav.toJson();
    }
    if (this.subNavList != null) {
      data['subNavList'] = this.subNavList.map((v) => v.toJson()).toList();
    }
    if (this.salesBox != null) {
      data['salesBox'] = this.salesBox.toJson();
    }
    return data;
  }
}

///搜索模块
class ConfigModel {
  String searchUrl;

  ConfigModel({this.searchUrl});

  ConfigModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    searchUrl = json['searchUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['searchUrl'] = this.searchUrl;
    return data;
  }
}

/**
 * 网格卡片模块
 */
class GridNavModel {
  GridNavItem hotel; //酒店
  GridNavItem flight; //机票
  GridNavItem travel; //旅行

  GridNavModel({this.hotel, this.flight, this.travel});

  GridNavModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    hotel =
        json['hotel'] != null ? new GridNavItem.fromJson(json['hotel']) : null;
    flight = json['flight'] != null
        ? new GridNavItem.fromJson(json['flight'])
        : null;
    travel = json['travel'] != null
        ? new GridNavItem.fromJson(json['travel'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.hotel != null) {
      data['hotel'] = this.hotel.toJson();
    }
    if (this.flight != null) {
      data['flight'] = this.flight.toJson();
    }
    if (this.travel != null) {
      data['travel'] = this.travel.toJson();
    }
    return data;
  }
}

class GridNavItem {
  String startColor;
  String endColor;
  CommonModel mainItem;
  CommonModel item1;
  CommonModel item2;
  CommonModel item3;
  CommonModel item4;

  GridNavItem(
      {this.startColor,
      this.endColor,
      this.mainItem,
      this.item1,
      this.item2,
      this.item3,
      this.item4});

  GridNavItem.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    startColor = json['startColor'] ?? "ee7800";
    endColor = json['endColor'] ?? "ee7800";
    mainItem = json['mainItem'] != null
        ? new CommonModel.fromJson(json['mainItem'])
        : null;
    item1 =
        json['item1'] != null ? new CommonModel.fromJson(json['item1']) : null;
    item2 =
        json['item2'] != null ? new CommonModel.fromJson(json['item2']) : null;
    item3 =
        json['item3'] != null ? new CommonModel.fromJson(json['item3']) : null;
    item4 =
        json['item4'] != null ? new CommonModel.fromJson(json['item4']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['startColor'] = this.startColor;
    data['endColor'] = this.endColor;
    if (this.mainItem != null) {
      data['mainItem'] = this.mainItem.toJson();
    }
    if (this.item1 != null) {
      data['item1'] = this.item1.toJson();
    }
    if (this.item2 != null) {
      data['item2'] = this.item2.toJson();
    }
    if (this.item3 != null) {
      data['item3'] = this.item3.toJson();
    }
    if (this.item4 != null) {
      data['item4'] = this.item4.toJson();
    }
    return data;
  }
}

///运营营销模块 活动入口模型
class SalesBoxModel {
  String icon;
  String moreUrl;

  //上面两个大的卡片，下面四个小的卡片
  CommonModel bigCard1;
  CommonModel bigCard2;
  CommonModel smallCard1;
  CommonModel smallCard2;
  CommonModel smallCard3;
  CommonModel smallCard4;

  SalesBoxModel(
      {this.icon,
      this.moreUrl,
      this.bigCard1,
      this.bigCard2,
      this.smallCard1,
      this.smallCard2,
      this.smallCard3,
      this.smallCard4});

  SalesBoxModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    icon = json['icon'];
    moreUrl = json['moreUrl'];
    bigCard1 = json['bigCard1'] != null
        ? new CommonModel.fromJson(json['bigCard1'])
        : null;
    bigCard2 = json['bigCard2'] != null
        ? new CommonModel.fromJson(json['bigCard2'])
        : null;
    smallCard1 = json['smallCard1'] != null
        ? new CommonModel.fromJson(json['smallCard1'])
        : null;
    smallCard2 = json['smallCard2'] != null
        ? new CommonModel.fromJson(json['smallCard2'])
        : null;
    smallCard3 = json['smallCard3'] != null
        ? new CommonModel.fromJson(json['smallCard3'])
        : null;
    smallCard4 = json['smallCard4'] != null
        ? new CommonModel.fromJson(json['smallCard4'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['moreUrl'] = this.moreUrl;
    if (this.bigCard1 != null) {
      data['bigCard1'] = this.bigCard1.toJson();
    }
    if (this.bigCard2 != null) {
      data['bigCard2'] = this.bigCard2.toJson();
    }
    if (this.smallCard1 != null) {
      data['smallCard1'] = this.smallCard1.toJson();
    }
    if (this.smallCard2 != null) {
      data['smallCard2'] = this.smallCard2.toJson();
    }
    if (this.smallCard3 != null) {
      data['smallCard3'] = this.smallCard3.toJson();
    }
    if (this.smallCard4 != null) {
      data['smallCard4'] = this.smallCard4.toJson();
    }
    return data;
  }
}

class CommonModel {
  String icon; //图片
  String title; //标题
  String url; //跳转地址
  String statusBarColor; // 跳转H5顶部状态导航栏颜色
  bool hideAppBar; //跳转H5 是否隐藏导航栏

  CommonModel(
      {this.icon, this.title, this.url, this.statusBarColor, this.hideAppBar});

  CommonModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    icon = json['icon'];
    title = json['title'];
    url = json['url'];
    statusBarColor = json['statusBarColor'];
    hideAppBar = json['hideAppBar'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['title'] = this.title;
    data['url'] = this.url;
    data['statusBarColor'] = this.statusBarColor;
    data['hideAppBar'] = this.hideAppBar;
    return data;
  }
}
