import 'package:cloud_firestore/cloud_firestore.dart';
import 'play01.dart';
import 'package:flutter/material.dart';
import 'package:muhsin01/play01.dart';
import 'podcast.dart';
import 'package:provider/provider.dart';
import 'provider1.dart';

class PodcastDetail extends StatefulWidget {
  const PodcastDetail({Key? key}) : super(key: key);
  @override
  _PodcastDetailState createState() => _PodcastDetailState();
}
class _PodcastDetailState extends State<PodcastDetail> {
  @override
  Widget build(BuildContext context) {
    final user=Provider.of<PodcastDemo>(context,listen: false);
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed:(){
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => Podcast()),
          );
        }, icon: Icon(Icons.arrow_back,color: Colors.black,),)
      ),
      body:SingleChildScrollView(child:
          Column(
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(

                            child: Text(user.podName, style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0,),
                            ),
                          ),
                          Text('Author Name',
                            style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            ),),
                        ],),
                    ),
                  ],),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(8.0, 12, 0, 3),
                child: Text('About the Book',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,),),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Text('Mass jhoa kaknajj hijuhiu mkoij ium m oijh \nmgnuj uh iuh hshhssksjshu',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13,),),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(8, 10, 0, 5),
                child: Text('All Episode',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,),),
              ),
              Container(
                child: StreamBuilder<QuerySnapshot>(
                    stream: user.db.collection('Podcast').doc(user.docId).collection('Episode').orderBy("Episode Number", descending: false).snapshots(),
                    builder: (context,snapshot){
                      if(snapshot.hasData){
                        return ListView.builder(
                            physics: ScrollPhysics(),
                            itemCount: snapshot.data!.docs.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              DocumentSnapshot ds = snapshot.data!.docs[index];
                              return new
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,),
                                margin: const EdgeInsets.all(8.0),

                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          constraints: BoxConstraints(
                                              maxHeight: 90, maxWidth: 90),
                                          child:
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(15.0),
                                            child: Image.asset('image/podcast.jpg',
                                              alignment: Alignment.topLeft,),),
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.fromLTRB(8, 3, 0, 3),
                                              child: Text(ds['Episode Number'],
                                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14,),),
                                            ),
                                            Container(
                                                padding: const EdgeInsets.fromLTRB(8, 0, 0, 3),
                                                child: Text(ds['Episode Name'],
                                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14,),)
                                            ),
                                          ],),
                                      ],),
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                                      child: Text('The Hero of the Jungle\nThe mougly The un Told Story',
                                        style: TextStyle(fontSize: 14),),),
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                          child: Icon(Icons.headset_rounded, size: 22,),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                          child: Icon(Icons.share, size: 22,),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.fromLTRB(257, 0, 0, 0),
                                          child: IconButton(
                                              icon: new Icon(Icons.play_circle_fill_outlined,
                                                color: Colors.blue, size: 35.0,),
                                              onPressed: () {
                                                user.episodeDetail(ds['Episode Name'], ds['Episode Number']);
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => PlayEpisode()),
                                                );}
                                                ),)
                                      ],)
                                  ],),
                              );}
                              );}
                      else{
                        return Text('The List is Empty Please Add Podcast',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black,),);}
                    }
                    ),
              ),
              SizedBox(
                width: 0.0,
                height: 10.0,)
            ],),
      ),);
  }
}
