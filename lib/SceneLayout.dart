
import 'dart:ui';

import 'package:clock/ClockUiInheritedModel.dart';
import 'package:clock/TexturePainter.dart';
import 'package:flutter/material.dart' hide Image;
import 'LayersLayout.dart';

class SceneLayout extends StatelessWidget {

  const SceneLayout({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return
      Center(
        child: AspectRatio(
          aspectRatio: 5 / 3,
          child: FutureBuilder(
            future: ClockUiInheritedModel.of(context, 'imagesFuture').imagesFuture,
            builder: (BuildContext c, AsyncSnapshot<List<Image>> snapshot){
              if(snapshot.connectionState == ConnectionState.done){
                return
                  CustomPaint(
                    foregroundPainter: TexturePainter(
                      screenTexture: snapshot.data[1],
                      multiplyTexture: snapshot.data[2],
                    ),
                    child: const LayersLayout(),
                  );
              } else {
                return
                  Center(
                    child: const Text('Just a sec!'),
                  );
              }
          }
        )
      )
    );
  }
}
