import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kip/pages/DrawingPage.dart';

class GridTypeItem extends StatelessWidget {
  final VoidCallback onPress;
  final GridTypeModel item;

  GridTypeItem({Key key, this.onPress, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemSize = 64.0;
    const padding = 18.0;

    return InkWell(
      onTap: () {
        onPress();
      },
      child: Stack(
        children: <Widget>[
          ///actual circle
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(padding),
              child: Container(
                height: itemSize,
                width: itemSize,
                child: Align(
                  ///inside circle
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                        border: Border.all()),
                  ),
                ),

                ///outer border
                decoration:
                    BoxDecoration(shape: BoxShape.circle, border: Border.all()),
              ),
            ),
          ),

          ///selected indicator
          item.isSelected
              ? Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.all(padding),
                    child: Container(
                      height: itemSize,
                      width: itemSize,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.blue, width: 2.0)),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}