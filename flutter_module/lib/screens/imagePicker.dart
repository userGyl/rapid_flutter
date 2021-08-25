import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatefulWidget {
  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

/*
 * 展示图片，可添加，可删除
 * tips:clip Stack GestureDetector
 */
class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  List<File> _image = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () => Navigator.pop(context),
        ),
      ),
      body: Center(
          child: Wrap(
        //水平间距
        spacing: 5,
        //垂直间距
        runSpacing: 5,
        children: _showImage(),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickImage,
        tooltip: '选择图片',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  _showImage() {
    return _image.map((file) {
      return Stack(
        children: <Widget>[
          //背景为圆角矩形
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.file(
              file,
              width: 120,
              height: 80,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            right: 5,
            top: 5,
            child: GestureDetector(
              onTap: () => setState(() {
                _image.remove(file);
              }),
              //圆角按钮
              child: ClipOval(
                child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(color: Colors.black38),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
            ),
          )
        ],
      );
    }).toList();
  }

  Future getImage(bool isTakePhoto) async {
    Navigator.pop(context);
    var image = await ImagePicker.pickImage(
        source: isTakePhoto ? ImageSource.camera : ImageSource.gallery);

    setState(() {
      _image.add(image);
    });
  }

  _pickImage() {
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              height: 160,
              child: Column(
                children: <Widget>[_item(true, "拍摄"), _item(false, "相册")],
              ),
            ));
  }

  /*
   * 创建条目
   */
  _item(bool isTakePhoto, String title) {
    return GestureDetector(
      child: ListTile(
        onTap: () => getImage(isTakePhoto),
        title: Text(title),
        leading: Icon(isTakePhoto ? Icons.camera : Icons.photo_library),
      ),
    );
  }
}
