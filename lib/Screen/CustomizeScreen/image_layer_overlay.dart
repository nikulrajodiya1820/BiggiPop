import 'package:biggi_pop/Screen/CustomizeScreen/layer.dart';
import 'package:flutter/material.dart';

class ImageLayerOverlay extends StatefulWidget {
  final int index;
  final ImageLayerData layerData;
  final Function onUpdate;
  final Function? onRemoveLayer;

  const ImageLayerOverlay({
    super.key,
    required this.layerData,
    required this.index,
    required this.onUpdate,
    this.onRemoveLayer,
  });

  @override
  createState() => _ImageLayerOverlayState();
}

class _ImageLayerOverlayState extends State<ImageLayerOverlay> {
  double slider = 0.0;

  @override
  void initState() {
    //  slider = widget.sizevalue;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(10), topLeft: Radius.circular(10)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Center(
            child: Text(
              'Size Adjust'.toUpperCase(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Slider(
              activeColor: Colors.white,
              inactiveColor: Colors.grey,
              value: widget.layerData.scale,
              min: 0,
              max: 2,
              divisions: 100,
              onChangeEnd: (v) {
                setState(() {
                  widget.layerData.scale = v.toDouble();
                  widget.onUpdate();
                });
              },
              onChanged: (v) {
                setState(() {
                  slider = v;
                  // print(v.toDouble());
                  widget.layerData.scale = v.toDouble();
                  widget.onUpdate();
                });
              }),
          const SizedBox(height: 10),
          // Row(children: [
          //   Expanded(
          //     child: TextButton(
          //       onPressed: () {
          //         // removedLayers.add(layers.removeAt(widget.index));
          //         widget.onRemoveLayer!();
          //         widget.onUpdate();
          //         Navigator.pop(context);
          //         // back(context);
          //         // setState(() {});
          //       },
          //       child: const Text(
          //         'Remove',
          //         style: TextStyle(color: Colors.white),
          //       ),
          //     ),
          //   ),
          // ]),
        ],
      ),
    );
  }
}
