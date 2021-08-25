import 'package:flutter/material.dart';

/*
 * 点击事件监听 GestureDetector
 */
class GesturePage extends StatefulWidget {
  @override
  _GestureDetectorState createState() => _GestureDetectorState();
}

class _GestureDetectorState extends State<GesturePage> {
  String printString = '';
  double moveX = 0, moveY = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('如何检测用户手势以及处理点击事件？'),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back),
            ),
          ),
          body: FractionallySizedBox(
            widthFactor: 1,
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => _updateEvent('点击'),
                      onDoubleTap: () => _updateEvent('双击'),
                      onLongPress: () => _updateEvent('长按'),
                      onTapCancel: () => _updateEvent('取消'),
                      onTapUp: (e) => _updateEvent('松开'),
                      onTapDown: (e) => _updateEvent('按下'),
                      child: Container(
                        padding: EdgeInsets.all(60),
                        decoration: BoxDecoration(color: Colors.blueAccent),
                        child: Text(
                          '点我',
                          style: TextStyle(fontSize: 36, color: Colors.white),
                        ),
                      ),
                    ),
                    Text(printString)
                  ],
                ),
                Positioned(
                  //跟着手指滑动的小球
                  left: moveX,
                  top: moveY,
                  child: GestureDetector(
                    onPanUpdate: (e) => _updateMoveEvent(e),
                    child: Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(36)),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }

  _updateEvent(String updateContent) {
    setState(() {
      printString += ' ,$updateContent';
    });
  }

  _updateMoveEvent(DragUpdateDetails e) {
    setState(() {
      moveY += e.delta.dy;
      moveX += e.delta.dx;
    });
  }
}
