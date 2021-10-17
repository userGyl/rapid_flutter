import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

const APPBAR_SCROLL_OFFSET = 100;

/*
 * appbar 滚动渐变
 */
class AppBarAlpha extends StatefulWidget {
  @override
  _AppBarAlpha createState() => _AppBarAlpha();
}

class _AppBarAlpha extends State<AppBarAlpha> {
  List _image = [
    'http://pages.ctrip.com/commerce/promote/20180718/yxzy/img/640sygd.jpg',
    'https://dimg04.c-ctrip.com/images/700u0r000000gxvb93E54_810_235_85.jpg',
    'https://dimg04.c-ctrip.com/images/700c10000000pdili7D8B_780_235_57.jpg'
  ];

  double appBarAlpha = 0;
  String showResult = '';

  //http实现异步
  /*Future<CommonModel> fetchPost() async {
    final response = await http
        .get('http://www.devio.org/io/flutter_app/json/test_common_model.json');
    //utf-8乱码
    Utf8Decoder utf8decoder = Utf8Decoder();
    final result = json.decode(utf8decoder.convert(response.bodyBytes));
    return CommonModel.fromJson(result);
  }*/
  Future<CommonModel> fetchPost() async {
    var dio = Dio();
    final response = await dio.get('http://www.devio.org/io/flutter_app/json/test_common_model.json');
    Utf8Decoder utf8decoder = Utf8Decoder();
    final result = json.decode(utf8decoder.convert(response.data));
    return CommonModel.fromJson(result);
  }


  _onScroll(offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;

    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }

    setState(() {
      appBarAlpha = alpha;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('app bar渐变&FutureBuild'),
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: <Widget>[
          _buildMediaQuery(context),
          //将子组件透明度进行更改
          _buildOpacity()
        ],
      ),
    );
  }

  MediaQuery _buildMediaQuery(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      child: NotificationListener(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollUpdateNotification &&
              scrollNotification.depth == 0) {
            _onScroll(scrollNotification.metrics.pixels);
            return true;
          }
          return false;
        },
        child: ListView(
          children: <Widget>[
            Container(
              height: 160,
              child:  Image.network(
                _image[0],
                fit: BoxFit.fill,
              )/*
              ///不支持空安全注释 演示部分需要更换sdk
              Swiper(
                itemCount: _image.length,
                autoplay: true,
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(
                    _image[index],
                    fit: BoxFit.fill,
                  );
                },
                pagination: SwiperPagination(),
              )*/,
            ),
            Column(
              children: <Widget>[
                Container(
                  height: 100,
                  child: ListTile(
                    title: Text("list title"),
                  ),
                ),
                InkWell(
                  onTap: () => fetchPost().then((CommonModel value) {
                    setState(() {
                      showResult =
                          '请求结果:${value.title.toString()}-\n${value.url}';
                    });
                  }, onError: (e) {
                    //如果catchError与onError同时存在，则会只调用onError；
                    showResult += '------on error';
                  }).catchError((e) {
                    //catch
                    showResult += '------catch error';
                  }).whenComplete(() {
                    //finally
                    showResult += '------when complete';
                  }).timeout(new Duration(seconds: 2)),
                  child: Text("get 请求", style: TextStyle(fontSize: 16)),
                ),
                Text(showResult),
                Container(
                  child: FutureBuilder<CommonModel>(
                    //连接的异步计算
                    future: fetchPost(),
                    builder: (BuildContext context,
                        AsyncSnapshot<CommonModel> snapshot) {
                      //异步计算的连接状态
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                          return new Text("input a url to start");
                        case ConnectionState.waiting:
                          return new Center(
                              child: new CircularProgressIndicator());
                        case ConnectionState.active:
                          {
                            return new Text("active");
                          }
                        case ConnectionState.done:
                          {
                            if (snapshot.hasError) {
                              return new Text("${snapshot.error}");
                            } else {
                              return new Text(
                                  'FutureBuilder:${snapshot.data!.title}-\n${snapshot.data!.url}');
                            }
                          }
                      }
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
      removeTop: true,
    );
  }

  Opacity _buildOpacity() {
    return Opacity(
      opacity: appBarAlpha,
      child: Container(
        height: 80,
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text("首页"),
          ),
        ),
      ),
    );
  }
}

class CommonModel {
   String? icon;
   String? title;
   String? url;
   String? statusBarColor;
   bool? hideAppBar;

  CommonModel(
      {this.icon, this.title, this.url, this.statusBarColor, this.hideAppBar});

  //单例公开访问点
  factory CommonModel.fromJson(Map<String, dynamic> json) {
    return CommonModel(
        icon: json['icon'],
        title: json['title'],
        url: json['url'],
        statusBarColor: json['statusBarColor'],
        hideAppBar: json['hideAppBar']);
  }
}
