import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:muhsin01/page01.dart';
import 'package:muhsin01/add_page.dart';
import 'provider1.dart';
import 'package:provider/provider.dart';


class Podcast extends StatefulWidget {
  const Podcast({Key? key}) : super(key: key);
  @override
  _PodcastState createState() => _PodcastState();
}
class _PodcastState extends State<Podcast> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<PodcastDemo>(context, listen: false);
    return MaterialApp(debugShowCheckedModeBanner: false,e
      home: Scaffold(
        floatingActionButton: Builder(
          builder: (context)=>
              FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () {
                    Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => AddPage()),
                    );
                  }
              ),),
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text('Podcast', style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),),
          centerTitle: true,
          leading: Icon(Icons.arrow_back, color: Colors.black,),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(child:
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
          ),
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(8, 10, 0, 8),
                child: Text('Top Sci-Fi Podcast', style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 17,
                ),),),
              StreamBuilder<QuerySnapshot>(
                  stream: user.db.collection('Podcast').snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot ds = snapshot.data!.docs[index];
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
                                          borderRadius: BorderRadius.circular(
                                              5.0),
                                          child: Image.asset(
                                              'image/podcast.jpg'),),
                                        padding: EdgeInsets.all(3.0),
                                      ),
                                      IconButton(
                                          icon: new Icon(
                                            Icons.play_circle_fill_outlined,
                                            color: Colors.white, size: 40.0,),
                                          onPressed: () {
                                            String pName = ds['Name'];
                                            user.pname(pName);
                                            String docid = ds.id;
                                            user.snapDocId(docid);
                                            Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) => PodcastDetail()),
                                            );
                                          }
                                      ),
                                    ],
                                  ),
                                  Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          8, 20, 0, 0),
                                      child:
                                      Text(ds['Name'], style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),)
                                  ),
                                ],
                              ),
                            );
                          }
                      );
                    }
                    else
                      return Text('The List is Empty Please Add Podcast',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      );
                  }
              ),


              SizedBox(
                width: 0.0,
                height: 10.0,)
            ],
          ),
        ),
        ),

      ),
    );
  }
}
