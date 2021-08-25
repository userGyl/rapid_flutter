import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/*
 * 通过插件跳转外部应用
 */
class UrlLaunch extends StatefulWidget {
  @override
  _UrlLaunchState createState() => _UrlLaunchState();
}

class _UrlLaunchState extends State<UrlLaunch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text("do url launch"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: _openMap,
              child: Text('do map'),
            ),
            ElevatedButton(
              onPressed: _launchURL,
              child: Text('do web'),
            )
          ],
        ),
      ),
    );
  }

  _launchURL() async {
    const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _openMap() async {
    // Android
    const url = 'geo:52.32,4.917'; //APP提供者提供的 schema
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      //iOS
      const url = 'http://maps.apple.com/?ll=52.32,4.917';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }
}
