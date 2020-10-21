import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kip/widgets/bordered_container.dart';

import 'profile_widget.dart';

class KipBar extends StatefulWidget {
  final VoidCallback onRequestLogin;
  final GlobalKey<ScaffoldState> gKey;

  const KipBar({Key key, this.onRequestLogin, this.gKey}) : super(key: key);

  KipBarState createState() => KipBarState();
}

class KipBarState extends State<KipBar> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: BorderedContainer(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  widget.gKey.currentState.openDrawer();
                },
              ),
              Flexible(
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "Search in notes"),
                ),
              ),
              IconButton(
                icon: Icon(Icons.border_all),
                onPressed: () {
                  //TODO: tile/table view
                },
              ),
              ProfileWidget(
                onPress: widget.onRequestLogin,
              )
            ],
          ),
        ),
      ),
    );
  }
}
