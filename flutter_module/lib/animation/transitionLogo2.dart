import 'package:flutter/material.dart';

/*
 *  animationWidget
 *  自带渲染简化transitionLogo
 */
class transitionLogo2 extends StatefulWidget {
  @override
  _transitionLogo2State createState() => _transitionLogo2State();
}

class _animationLogo extends AnimatedWidget {
  _animationLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }
}

class _transitionLogo2State extends State<transitionLogo2>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //vsync 页面不可见动画资源的回收
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = Tween<double>(begin: 0, end: 300).animate(controller);
    //AnimatedWidget 拥有重绘监听 不需要setState
    controller.forward();
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
      body: _animationLogo(
        animation: animation,
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
