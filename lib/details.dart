




import 'package:flutter/material.dart';

class details extends StatefulWidget {
  final dataitems;
const details ({super.key, this.dataitems });
  @override
  State<details> createState() => _MyAppState();
}

class _MyAppState extends State<details> {
  @override
  Widget build(BuildContext context) {
    return
       Scaffold(
         appBar: AppBar(

       title: Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [ Icon(Icons.shop_outlined,color: Colors.black,),
           Text(" Gipsy ",style: TextStyle(color: Colors.black),),Text("Bee",style: TextStyle(color: Colors.orange),),

         ],
       ),
             backgroundColor: Colors.grey[200],
             elevation: 0.0,
             iconTheme: IconThemeData(color: Colors.grey),centerTitle: true,

              ),
       endDrawer: Drawer(),
      body: ListView(
  children: [
    Image.asset(widget.dataitems['image']),

  Container(height: 30,),
    Center(child:
    Text(widget.dataitems['name'] , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
       ),
    Container(height: 10,),

    Center(child: Text(widget.dataitems['description'], style: TextStyle(color: Colors.grey ),)),
    Container(height: 40,),
    Center(child: Text(widget.dataitems['price'], style: TextStyle(color: Colors.orange, fontSize: 30 ),)),
    Container(height: 40,),
Center(
  child:   Container(
    child:   Row(children: [
      Text(   "Color:",style: TextStyle(color: Colors.grey, fontSize: 30 ),),
    Container(height: 20,width: 20, decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(100)) ),
      Text("Blue",style: TextStyle(color: Colors.grey, fontSize: 30 ),),
      Container(height: 20,width: 20, decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(100)) ),
      Text("Black",style: TextStyle(color: Colors.grey, fontSize: 30 ),),
    ],),
  ),
)
  ],
),
      );
  }
}





