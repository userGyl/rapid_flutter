import 'package:flutter/material.dart';

/*
 *   animationBuilder
 *  拆分动画的工具类 可以将动画和widget进行分离
 */

class transitionLogo3 extends StatefulWidget {
  @override
  _transitionLogo3State createState() => _transitionLogo3State();
}

class LogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlutterLogo(),
    );
  }
}

class GrowTransition extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;

  GrowTransition({Key key, this.animation, this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        child: child,
        builder: (context, child) => Container(
          height: animation.value,
          width: animation.value,
          child: child,
        ),
      ),
    );
  }
}

class _transitionLogo3State extends State<transitionLogo3>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = Tween<double>(begin: 0, end: 300).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('transition logo3'),
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: <Widget>[
           GrowTransition(
            animation: animation,
            child: LogWidget(),
          ),
          Center(
            child: Hero(
              tag: "avatar",
              child: GestureDetector(
                child: Image.network(
                  'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3363295869,2467511306&fm=26&gp=0.jpg',
                  width: 100.0,
                ),
                onTap: () => Navigator.of(context).pop(),
              ),
            ),
          )
        ],
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
