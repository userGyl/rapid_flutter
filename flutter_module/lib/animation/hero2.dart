import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class hero2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('垂直的hero动画实例'),
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () => Navigator.pop(context),
        ),
      ),
      body: _radiaExpansionDemo(),
    );
  }
}

class _radiaExpansionDemo extends StatelessWidget {
  static const double kMinRadius = 32.0;

  static const double kMaxRadius = 128.0;

  static const opactyCurve =
      const Interval(0.0, 0.75, curve: Curves.fastOutSlowIn);

  @override
  Widget build(BuildContext context) {
    timeDilation = 5.0;

    return Container(
      padding: const EdgeInsets.all(32.0),
      alignment: FractionalOffset.bottomLeft,
      //横向排列
      child: Row(
        //主轴对齐 均匀
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildHero(
              context,
              'https://raw.githubusercontent.com/flutter/website/master/examples/_animation/radial_hero_animation/images/chair-alpha.png',
              'Chair'),
          _buildHero(
              context,
              'https://raw.githubusercontent.com/flutter/website/master/examples/_animation/radial_hero_animation/images/binoculars-alpha.png',
              'Binoculars'),
          _buildHero(
              context,
              'https://raw.githubusercontent.com/flutter/website/master/examples/_animation/radial_hero_animation/images/beachball-alpha.png',
              'Beach ball'),
        ],
      ),
    );
  }



  //动画跳转页面
   Widget _buildPage(BuildContext context, String imageName, String des) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Card(
          elevation: 8.0,
          child: Column(
            //轴尺寸
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: kMaxRadius * 2.0,
                height: kMaxRadius * 2.0,
                child: Hero(
                  tag: imageName,
                  child: _radiaExpansion(
                    maxRadius: kMaxRadius,
                    child: _photo(
                      photo: imageName,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
              ),
              Text(
                des,
                style: TextStyle(fontWeight: FontWeight.bold),
                textScaleFactor: 3.0,
              ),
              const SizedBox(
                height: 16.0,
              )
            ],
          ),
        ),
      ),
    );
  }

  //动画
  Widget _buildHero(BuildContext context, String imageName, String des) {
    return Container(
      width: kMinRadius * 2.0,
      height: kMinRadius * 2.0,
      child: Hero(
        tag: imageName,
        child: _radiaExpansion(
          maxRadius: kMaxRadius,
          child: _photo(
            photo: imageName,
            onTap: () {
              Navigator.of(context).push(PageRouteBuilder(pageBuilder:
                  (BuildContext context, Animation<double> animation,
                      Animation<double> secondaryAnimation) {
                return AnimatedBuilder(
                    animation: animation,
                    builder: (BuildContext context, Widget? child) {
                      //可更改子组件透明度
                      return Opacity(
                        opacity: opactyCurve.transform(animation.value),
                        child: _buildPage(context, imageName, des),
                      );
                    });
              }));
            },
          ),
        ),
      ),
    );
  }
}

class _photo extends StatelessWidget {
   String? photo="";
   Color? color;
   VoidCallback? onTap;

   _photo({Key? key,required this.photo, this.color, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      //稍微不透明的颜色出现在图像有透明度的地方   原色与不透明度
      color: Theme.of(context).primaryColor.withOpacity(0.25),
      //水波纹
      child: InkWell(
        onTap: onTap,
        //监测父容器大小，
        //根据区域大小进行组件展示设计
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints size) {
            return Image.network(
              photo!,
              //尽量大
              fit: BoxFit.contain,
            );
          },
        ),
      ),
    );
  }
}

//扩张样式
class _radiaExpansion extends StatelessWidget {
  final double? maxRadius;
  final clipRectSize;
  final Widget? child;

   _radiaExpansion(
      {Key? key, this.maxRadius, this.clipRectSize, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //椭圆裁剪
    return ClipOval(
      child: Center(
        child: SizedBox(
          width: clipRectSize,
          height: clipRectSize,
          //矩形裁剪
          child: ClipRect(
            child: child,
          ),
        ),
      ),
    );
  }
}
