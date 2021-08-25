import 'package:flutter/material.dart';

//weiget 生命周期
class WidgetLife extends StatefulWidget {
  //立即调用  1
  @override
  _WidgetLifeState createState() => _WidgetLifeState();
}

class _WidgetLifeState extends State<WidgetLife> {
  //创建 2
  //oncreate 做初始化
  @override
  void initState() {
    print("-----initState-----");
    super.initState();
  }

//依赖的State对象改变时会调用 initstate => 3
  @override
  void didChangeDependencies() {
    // 改变依赖
    print("-----didChangeDependencies-----");
    super.didChangeDependencies();
  }

  int temp = 0;

  //更新期间 4
  @override
  Widget build(BuildContext context) {
    print("-----build-----");
    return Scaffold(
      appBar: AppBar(
        title: Text("获取组件生命周期"),
        leading: BackButton(),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                setState(() {
                  temp++;
                });
              },
              child: Text("+1+1", style: TextStyle(fontSize: 14)),
            ),
            Text(temp.toString())
          ],
        ),
      ),
    );
  }

//父组件需要重新绘制时才会调用
  @override
  void didUpdateWidget(WidgetLife oldWidget) {
    // 更新组件
    print("-----didUpdateWidget-----");
    super.didUpdateWidget(oldWidget);
  }

/*  销毁期*/
  @override
  void deactivate() {
    //禁用
    print("-----deactivate-----");
    super.deactivate();
  }

  @override
  void dispose() {
    // 处理释放
    print("-----dispose-----");
    super.dispose();
  }
}
