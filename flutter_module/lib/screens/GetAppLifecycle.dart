import 'package:flutter/material.dart';

class GetAppLife extends StatefulWidget {
  @override
  _GetAppLifeState createState() => _GetAppLifeState();
}

//WidgetsBindingObserver 监听应用生命周期变化
class _GetAppLifeState extends State<GetAppLife> with WidgetsBindingObserver {
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addObserver(this);
    print("initState");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text("getapplife"),
      ),
      body: Container(
        child: Text("getapplife"),
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    print("didChangeAppLifecycleState");
    switch (state) {
      case AppLifecycleState.paused: //暂停 后台常用
        print("暂停 后台");
        break;
      case AppLifecycleState.resumed: //恢复 显示常用
        print("恢复 显示");
        break;
      case AppLifecycleState.inactive: //不活跃
        print("不活跃");
        break;
      case AppLifecycleState.detached: //分离
        print("分离");
        break;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
