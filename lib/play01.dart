import 'package:flutter/material.dart';
import 'package:muhsin01/provider1.dart';
import 'package:provider/provider.dart';
import 'package:muhsin01/page01.dart';
class PlayEpisode extends StatefulWidget {
  const PlayEpisode({Key? key}) : super(key: key);

  @override
  _PlayEpisodeState createState() => _PlayEpisodeState();
}

class _PlayEpisodeState extends State<PlayEpisode> {
  @override
  Widget build(BuildContext context) {
    double _currentSliderValue = 0;
    final user=Provider.of<PodcastDemo>(context,listen: false);
    return Scaffold(
      backgroundColor: Colors.blue[700],
      appBar: AppBar(
          backgroundColor: Colors.blue[700],
          leading: IconButton(onPressed:(){
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => PodcastDetail()),
            );
          }, icon: Icon(Icons.arrow_back,color: Colors.white,),),
          actions: [
        Icon(
        Icons.menu_open_outlined,
        ),

        ],
      ),
      body: Container(


        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(

                padding: EdgeInsets.fromLTRB(80.0, 40.0, 80.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset('image/podcast.jpg',),
                )
            ),
            Container(

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
                          padding:const EdgeInsets.fromLTRB(0,20,0,8),
                          child: Text(
                            user.eptitle,
                            style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                            ),
                          ),
                        ),

                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(8.0),
                          child:

                          Text(
                            'Sim, já faz um tempo que eu to te olhando'
                              'Hoje eu só danço com você',
                            style: TextStyle(color: Colors.white,wordSpacing: 2.0,
                               fontSize: 13,),textAlign: TextAlign.center)
                            ),
                      ],
                    ),
                  ),
                  /*3*/

                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(
                        40, 100, 0, 0),
                    child: Icon(
                      Icons.headset_rounded,color: Colors.white, size: 25,),
                  ),
                  Container(

                    padding: const EdgeInsets.fromLTRB(
                        280, 100, 0, 0),
                    child: Icon(
                      Icons.share,color: Colors.white, size: 25,),
                  ),

                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(
                  35, 20, 35, 0),
              child:
            Slider(value: _currentSliderValue,
              inactiveColor: Colors.white,
              activeColor: Colors.white,
              min: 0,
              max: 100,
              divisions: 5,
              label: _currentSliderValue.round().toString(),
              onChanged: (double value) {

              },
            ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(
                        45, 0, 0, 0),
                    child: Text('0.0',style: TextStyle(color: Colors.white,),),),
                  Container(

                    padding: const EdgeInsets.fromLTRB(
                        280, 0, 0, 0),
                    child: Text('4.0',style: TextStyle(color: Colors.white,),
                  ),)

                ],
              ),
            ),
            Container(
              child:
              Row(
                children: [
                  Container(

                    padding: const EdgeInsets.fromLTRB(
                        83, 10, 0, 0),
                    child: Icon(
                      Icons.skip_previous_outlined,color: Colors.white, size: 35,),
                  ),
                  Container(

                    padding: const EdgeInsets.fromLTRB(
                        50, 10, 0, 0),
                    child: Icon(
                      Icons.play_circle_fill,color: Colors.white, size: 70,),
                  ),
                  Container(

                    padding: const EdgeInsets.fromLTRB(
                        50, 10, 0, 0),
                    child: Icon(
                      Icons.skip_next_outlined,color: Colors.white, size: 35,),
                  ),
                ],
              ),
            ),
            Container(
              child: IconButton(
                  icon: new Icon(
                    Icons.add,color: Colors.white, size: 30,),

                  onPressed: null
              ),
            ),

            SizedBox(
              width: 0.0,
              height: 10.0,)

          ],),
      ),
    );
  }
}
