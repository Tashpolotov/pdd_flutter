import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideoView extends StatelessWidget {
  const VideoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Align(
            alignment: Alignment.center,
            child: Text("Video"),
          ),
        )
    );
  }
}
