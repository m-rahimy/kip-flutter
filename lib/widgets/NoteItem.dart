import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kip/widgets/BorderedContainer.dart';

class NoteItem extends StatelessWidget{
  final Widget child;

  const NoteItem({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(left:8.0, right:8.0, top:8.0, bottom:0.0),
      child: BorderedContainer(child: this.child),
    );
  }
}