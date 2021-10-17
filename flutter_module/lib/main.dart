import 'package:flutter/material.dart';
import 'package:flutter_module/animation/listWidget.dart';
import 'dart:ui';

import 'package:flutter_module/screens/HomePage.dart';
import 'package:flutter_module/animation/appBarAlpha.dart';
import 'package:flutter_module/animation/hero.dart';
import 'package:flutter_module/animation/transitionLogo.dart';
import 'package:flutter_module/animation/transitionLogo2.dart';
import 'package:flutter_module/screens/imagePicker.dart';
import 'package:flutter_module/screens/urlLaunch.dart';
import 'package:flutter_module/screens/widgetLife.dart';

import 'screens/GetAppLifecycle.dart';
import 'animation/hero2.dart';
import 'animation/transitionLogo3.dart';
import 'screens/gestureDetector.dart';

void main() => runApp(MyApp()); //独立运行传入默认路由

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //路由表
      routes: <String, WidgetBuilder>{
        "getAppLife": (BuildContext context) => GetAppLife(),
        "homePage": (BuildContext context) => HomePage(),
        "widgetLife": (BuildContext context) => WidgetLife(),
        "urlLaunch": (BuildContext context) => UrlLaunch(),
        "gesture": (BuildContext context) => GesturePage(),
        "imgPick": (BuildContext context) => ImagePickerWidget(),
        "animation": (BuildContext context) => transitionLogo(),
        "animation2": (BuildContext context) => transitionLogo2(),
        "animation3": (BuildContext context) => transitionLogo3(),
        "heros": (BuildContext context) => hero(),
        "heros2": (BuildContext context) => hero2(),
        "appBar": (BuildContext context) => AppBarAlpha(),
        "listWidget": (BuildContext context) => ListWidget(),
      },
      home: Scaffold(
        appBar: AppBar(
          title: Text('Demo'),
        ),
        body: RouteNavigator(),
      ),
    );
  }
}

class RouteNavigator extends StatefulWidget {
  @override
  _RouteNavigatorState createState() => _RouteNavigatorState();
}

class _RouteNavigatorState extends State<RouteNavigator> {
  int _cullIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //添加一个侧边栏
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text("drawer header"),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              onTap: () => Navigator.pop(context),
              title: Text("list title 1"),
            ),
            ListTile(
              onTap: () => Navigator.pop(context),
              title: Text("list title 2"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text("float Btn"),
        onPressed: null,
      ),
      body: _cullIndex == 0
          ? Column(
              children: <Widget>[
                Text("page 1"),
                _buildConstrainedBox(context),
                Container(
                  height: 100,
                  child: PageView(
                    children: <Widget>[
                      _pageitem("pageview", Colors.red),
                      _pageitem("pageview", Colors.green),
                      _pageitem("pageview", Colors.grey),
                    ],
                  ),
                ),
              ],
            )
          : RefreshIndicator(
              child: ListView(
                children: <Widget>[
                  Text("page2"),
                  _crenterBtn("getAppLife", "getAppLife"),
                  _crenterBtn("do home", "homePage"),
                  _crenterBtn("do widgetLife", "widgetLife"),
                  _crenterBtn("打开外部应用", "urlLaunch"),
                  _crenterBtn("监测手势和点击", "gesture"),
                  _crenterBtn("选择图片和拍照", "imgPick"),
                  _crenterBtn("动画演示", "animation"),
                  _crenterBtn("动画演示 优化setState", "animation2"),
                  _crenterBtn("动画演示 animatedBuilder", "animation3"),
                  _crenterBtn("动画演示 heros", "heros"),
                  _crenterBtn("渐变的appBar", "appBar"),
                  _crenterBtn("常用的列表组件", "listWidget"),
                ],
              ),
              onRefresh: _handlerRefresh,
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _cullIndex,
        onTap: (index) {
          setState(() {
            _cullIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              label: "首页",
              icon: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.home,
                color: Colors.blue,
              )),
          BottomNavigationBarItem(
              label: "我的",
              icon: Icon(
                Icons.assignment_ind,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.assignment_ind,
                color: Colors.blue,
              ))
        ],
      ),
    );
  }

  //使用swiper banner 空安全注释
  /*ConstrainedBox _buildConstrainedBox(BuildContext context) {
    return new ConstrainedBox(
        child: new Swiper(
          outer: false,
          itemBuilder: (c, i) {
            return new Wrap(
              runSpacing: 6.0,
              children: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].map((i) {
                return new SizedBox(
                  width: MediaQuery.of(context).size.width / 5,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new SizedBox(
                        child: new Container(
                          child: new Image.network(
                              "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3363295869,2467511306&fm=26&gp=0.jpg"),
                        ),
                        height: MediaQuery.of(context).size.width * 0.12,
                        width: MediaQuery.of(context).size.width * 0.12,
                      ),
                      new Padding(
                        padding: new EdgeInsets.only(top: 6.0),
                        child: new Text("$i"),
                      )
                    ],
                  ),
                );
              }).toList(),
            );
          },
          pagination: new SwiperPagination(margin: new EdgeInsets.all(5.0)),
          itemCount: 5,
        ),
        constraints: new BoxConstraints.loose(new Size(170.0, 100)));
  }*/
  ConstrainedBox _buildConstrainedBox(BuildContext context) {
    return new ConstrainedBox(
        child: new Wrap(
          runSpacing: 6.0,
          children: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].map((i) {
            return new SizedBox(
              width: MediaQuery.of(context).size.width / 5,
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new SizedBox(
                    child: new Container(
                      child: new Image.network(
                          "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3363295869,2467511306&fm=26&gp=0.jpg"),
                    ),
                    height: MediaQuery.of(context).size.width * 0.12,
                    width: MediaQuery.of(context).size.width * 0.12,
                  ),
                  new Padding(
                    padding: new EdgeInsets.only(top: 6.0),
                    child: new Text("$i"),
                  )
                ],
              ),
            );
          }).toList(),
        ),
        constraints: new BoxConstraints.loose(new Size(170.0, 100)));
  }

  _crenterBtn(String btnText, String routeName) {
    return MaterialButton(
      color: Colors.grey,
      child: Text(btnText),
      onPressed: () {
        Navigator.pushNamed(context, routeName);
      },
    );
  }
}

_pageitem(String text, MaterialColor colors) {
  return Container(
      alignment: AlignmentDirectional.center,
      width: 90,
      color: colors,
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 24, shadows: [
          Shadow(color: Colors.black, offset: Offset(.5, .5), blurRadius: 2)
        ]),
      ));
}

Future<Null> _handlerRefresh() async {
  await Future.delayed(Duration(milliseconds: 200));
  return null;
}
