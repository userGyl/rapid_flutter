import 'package:flutter/material.dart';

/*
 * 缩放logo 动画demo
 */
class transitionLogo extends StatefulWidget {
  @override
  _transitionLogoState createState() => _transitionLogoState();
}

class _transitionLogoState extends State<transitionLogo>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  AnimationStatus animationStatus;
  double animationValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //vsync 页面不可见动画资源的回收
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addListener(() {
        setState(() {
          animationValue = animation.value;
        });
      })
      ..addStatusListener((status) {
        setState(() {
          animationStatus = status;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('transition logo'),
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                //重置 播放
                controller.reset();
                controller.forward();
              },
              child: Text(
                "start animation",
                textDirection: TextDirection.ltr,
              ),
            ),
            Text(
              "staet" + animationStatus.toString(),
              textDirection: TextDirection.ltr,
            ),
            Text(
              "value" + animationValue.toString(),
              textDirection: TextDirection.ltr,
            ),
            Container(
              width: animation.value,
              height: animation.value,
              child: FlutterLogo(),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
}
