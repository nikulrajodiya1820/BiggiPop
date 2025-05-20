import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';

class ImageItem {
  int? width = 300;
  int? height = 300;
  Color color = Colors.transparent;
  Uint8List bytes = Uint8List.fromList([]);
  Completer loader = Completer();

  ImageItem([dynamic img]) {
    if (img != null) load(img);
  }

  Future load(dynamic imageFile) async {
    loader = Completer();

    if (imageFile is ImageItem) {
      height = imageFile.height;
      width = imageFile.width;

      bytes = imageFile.bytes;
      loader.complete(true);
    } else {
      bytes =
          imageFile is Uint8List ? imageFile : await imageFile.readAsBytes();
      var decodedImage = await decodeImageFromList(bytes);

      // image was decoded
      // print(['height', viewportSize.height, decodedImage.height]);
      // print(['width', viewportSize.width, decodedImage.width]);

      height = decodedImage.height;
      width = decodedImage.width;

      loader.complete(decodedImage);
    }

    return true;
  }

  static ImageItem fromJson(Map json) {
    var image = ImageItem(json['image']);

    image.width = json['width'];
    image.height = json['height'];
    image.color = json['color']??Colors.transparent;

    return image;
  }

  Map toJson() {
    return {
      'height': height,
      'width': width,
      // 'color': color,
      'bytes': bytes,
    };
  }
}
