import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _StateFullGroup createState() => new _StateFullGroup();
}

class _StateFullGroup extends State<HomePage> {
  int _cullIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Text("float Btn"),
        onPressed: null,
      ),
      body: _cullIndex == 0
          ? Column(
              children: <Widget>[
                Text("page1"),
                Container(
                  height: 100,
                  child: PageView(
                    children: <Widget>[
                      _pageitem("红色", Colors.red),
                      _pageitem("绿色", Colors.green),
                      _pageitem("灰色", Colors.grey),
                    ],
                  ),
                )
              ],
            )
          : RefreshIndicator(
              child: ListView(
                children: <Widget>[Text("page2")],
              ),
              onRefresh: _handlerRefresh,
            ),
      appBar: AppBar(
        title: Text(""),
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
