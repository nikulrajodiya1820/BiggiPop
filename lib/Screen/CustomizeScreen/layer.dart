import 'package:biggi_pop/Screen/CustomizeScreen/image_item.dart';
import 'package:flutter/material.dart';

/// Layer class with some common properties
class Layer {
  Offset offset;
  late double rotation, scale, opacity, lastScale;

  Layer({
    this.offset = const Offset(0, 0),
    this.opacity = 1,
    this.rotation = 0,
    this.scale = 0.5,
    this.lastScale = 1
  });

  copyFrom(Map json) {
    offset = Offset(json['offset'][0], json['offset'][1]);
    opacity = json['opacity'];
    rotation = json['rotation'];
    scale = json['scale'];
    lastScale = json['lastScale'];
  }

  static Layer fromJson(Map json) {
    switch (json['type']) {
      case 'BackgroundLayer':
        return BackgroundLayerData.fromJson(json);
      case 'ImageLayer':
        return ImageLayerData.fromJson(json);
      case 'TextLayer':
        return TextLayerData.fromJson(json);
      default:
        return Layer();
    }
  }

  Map toJson() {
    return {
      'offset': [offset.dx, offset.dy],
      'opacity': opacity,
      'rotation': rotation,
      'scale': scale,
      'lastScale': lastScale,
    };
  }
}

/// Attributes used by [BackgroundLayer]
class BackgroundLayerData extends Layer {
  ImageItem image;

  BackgroundLayerData({
    required this.image,
  });

  static BackgroundLayerData fromJson(Map json) {
    return BackgroundLayerData(
      image: ImageItem.fromJson(json['image']),
    );
  }

  @override
  Map toJson() {
    return {
      'type': 'BackgroundLayer',
      'image': image.toJson(),
    };
  }
}



/// Attributes used by [ImageLayer]
class ImageLayerData extends Layer {
  ImageItem image;
  double size;
  double flip;

  ImageLayerData({
    required this.image,
    this.flip = 0.0,
    this.size = 64,
    super.offset,
    super.opacity,
    super.rotation,
    super.scale,
  });

  static ImageLayerData fromJson(Map json) {
    var layer = ImageLayerData(
      image: ImageItem.fromJson(json['image']),
      size: json['size'],
      flip: json['flip'],
    );

    layer.copyFrom(json);
    return layer;
  }

  @override
  Map toJson() {
    return {
      'type': 'ImageLayer',
      'image': image.toJson(),
      'size': size,
      'flip':flip,
      ...super.toJson(),
    };
  }
}

/// Attributes used by [TextLayer]
class TextLayerData extends Layer {
  String text;
  double size;
  Color color, background;
  double backgroundOpacity;
  TextAlign align;

  TextLayerData({
    required this.text,
    this.size = 64,
    this.color = Colors.white,
    this.background = Colors.transparent,
    this.backgroundOpacity = 0,
    this.align = TextAlign.left,
    super.offset,
    super.opacity,
    super.rotation,
    super.scale,
  });

  static TextLayerData fromJson(Map json) {
    var layer = TextLayerData(
      text: json['text'],
      size: json['size'],
      color: Color(json['color']),
      background: Color(json['background']),
      backgroundOpacity: json['backgroundOpacity'],
      align: TextAlign.values.firstWhere((e) => e.name == json['align']),
    );

    layer.copyFrom(json);
    return layer;
  }

  @override
  Map toJson() {
    return {
      'type': 'TextLayer',
      'text': text,
      'size': size,
      'color': color.value,
      'background': background.value,
      'backgroundOpacity': backgroundOpacity,
      'align': align.name,
      ...super.toJson(),
    };
  }
}

/// Attributes used by [EmojiLayer]
class SizeModel {
  String label;
  int qty;

  SizeModel({
    this.label = '',
    this.qty = 0,
  });

  static SizeModel fromJson(Map json) {
    var layer = SizeModel(
      label: json['label'],
      qty: json['qty'],
    );
    return layer;
  }

  @override
  Map toJson() {
    return {
      'label': label,
      'qty': qty,
    };
  }
}