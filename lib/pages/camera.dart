import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:async';



class CameraApp extends StatefulWidget{
  var cameras;
  CameraApp(this.cameras);
  @override

   CameraAppState createState() => CameraAppState();
}


class CameraAppState extends State<CameraApp>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Camscreen(widget.cameras);
  }
    
}

class Camscreen extends StatefulWidget{
  List<CameraDescription> cameras;
  Camscreen(this.cameras);
  @override
  CamscreenState createState() {
    return new CamscreenState();
  }

}

class CamscreenState extends State<Camscreen> {
  CameraController controller;
  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      controller = new CameraController(widget.cameras[0], ResolutionPreset.medium);
      controller.initialize().then((_){
        if(!mounted){
          return;
        }
        setState(() {
                  
                });
      });
    }

  @override
    void dispose() {
      // TODO: implement dispose
      controller?.dispose();
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(!controller.value.isInitialized){
      return new Container();
    }
    return new AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: new CameraPreview(controller),
    );
  }
}