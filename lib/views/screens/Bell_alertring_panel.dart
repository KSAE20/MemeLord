import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:memelord/views/screens/inbox.dart';
import 'package:memelord/views/screens/notification_panel.dart';
class Bell_alerting_panel extends StatefulWidget {
  const Bell_alerting_panel({Key? key}) : super(key: key);

  @override
  State<Bell_alerting_panel> createState() => _Bell_alerting_panelState();
}

class _Bell_alerting_panelState extends State<Bell_alerting_panel> 
  with SingleTickerProviderStateMixin{
  late TabController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 2 , vsync: this);

  
  }

  void dispose(){

    controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Center(
        child: Text('Upcomings',
        style: TextStyle(
        color: Colors.black),
        ),
        ),
        backgroundColor: Color.fromARGB(255, 243, 240, 240),
        elevation: 2.0, 
        bottom: TabBar(
        controller: controller,
        tabs: [Tab(
        text: 'Notifications'),
               Tab(
        text: 'Messages')],
        indicatorColor:Colors.cyan ,
        labelColor: Colors.black),
        
      ),

      body: TabBarView(
        
          controller: controller,
        
          children: [
        
  notification_panel(),
  
inbox(),]
  ),
  );
  
  }