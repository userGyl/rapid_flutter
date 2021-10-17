import 'package:flutter/material.dart';

/*
 * hero跳转动画
 * 通过唯一tag链接两个weidget实现过渡
 */
class hero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hero的基本跳转实例'),
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () => Navigator.pop(context),
        ),
      ),
      body: HeroWidget('https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3363295869,2467511306&fm=26&gp=0.jpg'),
    );
  }
}

class HeroWidget extends StatelessWidget {
  final String photoUrl;

  HeroWidget(this.photoUrl , {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            child: InkWell(
          child: Hero(
              tag: "avatar",
              child: Material(
                child: Image.network(
                  photoUrl,
                  fit: BoxFit.contain,
                ),
              )),
          onTap: () {
            Navigator.pushNamed(context, "animation3");
          },
        )),
        MaterialButton(
          onPressed: () {
            Navigator.pushNamed(context, "heros2");
          },
          color: Colors.grey,
          child: Text("垂直的hero动画实例"),
        )
      ],
    );
  }
}
