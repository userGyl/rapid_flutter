import 'package:flutter/material.dart';

/*
 * 常用的列表组件
 * listview expansionTitle gridview
 */
const CITY_NAMES = {
  '北京': ['东城区', '西城区', '朝阳区', '丰台区', '石景山区', '海淀区', '顺义区'],
  '上海': ['黄浦区', '徐汇区', '长宁区', '静安区', '普陀区', '闸北区', '虹口区'],
  '广州': ['越秀', '海珠', '荔湾', '天河', '白云', '黄埔', '南沙', '番禺'],
  '深圳': ['南山', '福田', '罗湖', '盐田', '龙岗', '宝安', '龙华'],
  '杭州': ['上城区', '下城区', '江干区', '拱墅区', '西湖区', '滨江区'],
  '苏州': ['姑苏区', '吴中区', '相城区', '高新区', '虎丘区', '工业园区', '吴江区']
};

class ListWidget extends StatelessWidget {
  const ListWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(250, 250, 250, 1),
        appBar: AppBar(
            toolbarHeight: 46,
            title: Text(
              "常用的列表组件",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            )),
        body: _buildBody());
  }

  Widget _buildBody() {
    List<String> cityList = [];
    CITY_NAMES.keys.forEach((element) {
      cityList.add(element);
    });
    return SingleChildScrollView(
      child: Column(children: [
        Container(
          height: 100,
          color: Colors.grey,
          child: ListView.builder(
            itemCount: cityList.length,
            itemBuilder: (BuildContext context, int index) {
              return Text(cityList[index]);
            },
          ),
        ),
        Container(
          height: 400,
          child: ListView(
            children: _buildExpansionTitle(cityList),
          ),
        ),
        Container(
          height: 400,
          child: GridView.count(
            //一行几列
            crossAxisCount: 2,
            //x轴间距
            crossAxisSpacing: 5.0,
            //y轴间距
            mainAxisSpacing: 2.0,
            children: _buildGridItem(cityList),
          ),
        )
      ]),
    );
  }

  List<Widget> _buildExpansionTitle(List<String> cityList) {
    List<Widget> widgets = [];
    cityList.forEach((element) {
      widgets.add(ExpansionTile(
        title: Text(element),
        //标题左组件
        leading: Icon(Icons.star),
        //标题右组件
        trailing: Icon(Icons.arrow_forward),
        //默认是否展开
        initiallyExpanded: false,
        onExpansionChanged: (value) {
          print("ExpansionTitle展开状态$value");
        },
        children: CITY_NAMES[element]
            .map((cityList) => _buildExpansionTitleItem(element))
            .toList(),
      ));
    });
    return widgets;
  }

  Widget _buildExpansionTitleItem(String city) {
    //指定子组件宽高分率
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        height: 50,
        alignment: Alignment.center,
        margin: EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(color: Colors.lightBlueAccent),
        child: Text(city),
      ),
    );
  }

  List<Widget> _buildGridItem(List<String> cityList) {
    List<Widget> list = [];
    cityList.forEach((element) {
      list.add(Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(color: Colors.lightBlueAccent),
        child: Text(element),
      ));
    });
    return list;
  }
}
