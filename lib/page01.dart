import 'dart:io';
import 'play01.dart';
import 'package:flutter/material.dart';
import 'package:muhsin01/main.dart';
import 'package:muhsin01/play01.dart';
class page01 extends StatefulWidget {
  const page01({Key? key}) : super(key: key);

  @override
  _page01State createState() => _page01State();
}

class _page01State extends State<page01> {
  @override
  Widget build(BuildContext context) {
    const Key centerKey = ValueKey<String>('bottom-sliver-list');
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed:(){
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => podcast()),
          );
        }, icon: Icon(Icons.arrow_back,color: Colors.black,),)
      ),
      body:SingleChildScrollView(child:
          Expanded(


      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(80.0, 30.0, 80.0, 0.0),
      child: ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Image.asset('image/podcast.jpg',),
      )
      ),
      Container(
      color: Colors.white,
      padding: const EdgeInsets.all(22),
      child: Row(
      children: [
      Expanded(
      /*1*/
      child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
      /*2*/
      Container(

      child: Text(
      'Yasamac',
      style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 25.0,
      ),
      ),
      ),
      Text(
      'Author Name',
      style: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,

      ),
      ),
      ],
      ),
      ),
      /*3*/

      ],
      ),
      ),

      Container(
      padding: const EdgeInsets.fromLTRB(8.0, 12, 0, 3),
      child: Text('About the Book', style: TextStyle(
      fontWeight: FontWeight.bold, fontSize: 15,
      ),),),
      Container(
      padding: const EdgeInsets.all(8.0),
      child: Text(
      'Mass jhoa kaknajj hijuhiu mkoij ium m oijh \nmgnuj uh iuh hshhssksjshu',
      style: TextStyle(
      fontWeight: FontWeight.bold, fontSize: 13,
      ),),),
      Container(

      padding: const EdgeInsets.fromLTRB(8, 10, 0, 5),
      child: Text('All Episode', style: TextStyle(
      fontWeight: FontWeight.bold, fontSize: 15,
      ),),),
      Container(
      child:
      ListView.builder(
        physics: ScrollPhysics(),
      itemCount: 10,
          shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
      return new
      Container(
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,),
      margin: const EdgeInsets.all(8.0),

      padding: const EdgeInsets.all(8.0),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment
          .spaceEvenly,
      children: [
      Row(

      mainAxisSize: MainAxisSize.min,
      children: [
      Container(

      constraints: BoxConstraints(
      maxHeight: 90, maxWidth: 90),
      child:
      ClipRRect(
      borderRadius: BorderRadius.circular(
      15.0),
      child:
      Image.asset('image/podcast.jpg',
      alignment: Alignment
          .topLeft,),),),
      Column(
      crossAxisAlignment: CrossAxisAlignment
          .start,
      children: [
      Container(
      padding: const EdgeInsets.fromLTRB(
      8, 3, 0, 3),

      child:
      Text(
      'Lorem Ipsum dolor sit\nAll is well',
      style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
      ),),),
      Container(
      padding: const EdgeInsets
          .fromLTRB(8, 0, 0, 3),
      child: Text('12 min',
      style: TextStyle(
      fontSize: 11,),)
      ),
      ],
      ),
      ],
      ),
      Container(
      padding: const EdgeInsets.fromLTRB(
      0, 8, 0, 8),
      child:
      Text(
      'The Hero of the Jungle\nThe mougly The un Told Story',
      style: TextStyle(fontSize: 14),),),
      Row(
      children: [
      Container(
      padding: const EdgeInsets.fromLTRB(
      10, 0, 0, 0),
      child: Icon(
      Icons.headset_rounded, size: 22,),
      ),
      Container(
      padding: const EdgeInsets.fromLTRB(
      20, 0, 0, 0),
      child: Icon(Icons.share, size: 22,),
      ),
      Container(
      padding: const EdgeInsets.fromLTRB(
      257, 0, 0, 0),
      child: IconButton(
      icon: new Icon(Icons.play_circle_fill_outlined,
      color: Colors.blue, size: 35.0,),
      onPressed: () {
      Navigator.push(context,
      MaterialPageRoute(builder: (context) => play01()),
      );
      }
      ),
      )
      ],
      )
      ],
      ),

      );
      }
      ),),
      SizedBox(
      width: 0.0,
      height: 10.0,)

      ],),

      ),


      ),);
  }
}
