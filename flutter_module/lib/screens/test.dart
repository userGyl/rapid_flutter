
//无interface
class Spacecraft {
  String? name;
  DateTime? launchDate;
  int? age;

  // 构造函数，使用语法糖设置成员变量。
  Spacecraft(this.name, this.launchDate) {
    // 这里编写初始化代码。

  }

  // 命名构造函数，最终调用默认构造函数。
  Spacecraft.unlaunched(String name) : this(name, null);

  int get launchYear => launchDate!.year; // read-only non-final 属性

  // 函数。
  void describe() {
    print('Spacecraft: $name');
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate!).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }

  int? ppage(int temp) {
    var gifts = new Map<String, String>();
    gifts = {"k": "v"};
    gifts.remove("k");

    age = (age! + temp);
    return age;
  }

  bool isName(String temp) {
    if (name == temp) {
      return true;
    }else{
      return false;
    }
  }
}
