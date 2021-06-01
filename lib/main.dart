import 'package:flutter/material.dart';
import 'package:muhsin01/page01.dart';

void main() {
  runApp(podcast());
}

class podcast extends StatefulWidget {
  const podcast({Key? key}) : super(key: key);

  @override
  _podcastState createState() => _podcastState();
}



class _podcastState extends State<podcast> {


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(

        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text('Podcast',style: TextStyle(
            color: Colors.black,
                fontWeight: FontWeight.bold,
          ),),
          centerTitle: true,
          leading: Icon(Icons.arrow_back,color: Colors.black,),
          backgroundColor: Colors.white,
        ),
      body:Container(
      child:

          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
            padding: const EdgeInsets.all(5.0),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Container(

            padding: const EdgeInsets.fromLTRB(8, 10, 0, 8),
            child:Text('Top Sci-Fi Podcast',style: TextStyle(
              fontWeight: FontWeight.bold,fontSize: 17,
            ),),),
          Expanded(child:
      GridView.builder(
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: 10,
        itemBuilder: (BuildContext context, int _index) {
          return new Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: Colors.white,
            margin: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child:Image.asset('image/podcast.jpg'),),

                      padding: EdgeInsets.all(3.0),
                    ),

                    IconButton(
                        icon: new Icon(Icons.play_circle_fill_outlined,
                          color: Colors.white, size: 40.0,),
                        onPressed: () {
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => page01()),
                          );
                        }
                    ),

                  ],
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(8, 20, 0, 0),
                    child:
                    Text('Turpis a amet amet', style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,

                    ),)
                ),
              ],
            ),


          );
        }

    ),),

          SizedBox(
            width: 0.0,
            height: 10.0,)
    ],
      ),


      ),
    ),),
    );

  }
}
