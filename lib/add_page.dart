import 'package:flutter/material.dart';
import 'podcast.dart';
import 'provider1.dart';
import 'package:provider/provider.dart';
//GlobalKey<FormState> form1 = GlobalKey<FormState>();

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  int count=1;
  var enam =new List.filled(10,"", growable: true);
  GlobalKey<FormState> form1 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    List<Widget> children = new List.generate(count, (int f) => new AddTextField(f));
    final user=Provider.of<PodcastDemo>(context,listen: false);
    return new Scaffold(
            appBar: AppBar(
                title: Text('Add Podcast', style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),),
                centerTitle: true,
                backgroundColor: Colors.white,
                leading: IconButton(onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Podcast()),
                  );
                }, icon: Icon(Icons.arrow_back, color: Colors.black,),)
            ),
            body: SingleChildScrollView(
              child: Container(
                child: Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [ Container(
                          padding: EdgeInsets.all(8.0),
                          child: Form(
                              key: form1,
                              //autovalidate: true,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    PodClass(),
                                    Container(
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            IconButton(
                                              icon: Icon(Icons.add),
                                              onPressed: () {
                                                setState(() {
                                                  count = count + 1;
                                                });
                                              },
                                            ),

                                          ],),
                                      ),
                                    ),


                                    Column(
                                      children:
                                      children,

                                    ),


                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          if (form1.currentState!.validate()) {
                                            user.addData();
                                            Navigator.push(context,
                                              MaterialPageRoute(builder: (_) => Podcast()),);
                                          }
                                        },

                                        child: Text('Submit'),
                                      ),

                                    ),

                                  ])
                          ))
                      ]
                  ),
                ),
              ),
            ),);


  }
  }
  //-------------------inputWidget------------------

class AddTextField extends StatefulWidget {

  final int index;

  AddTextField(this.index);

  @override
  _AddTextFieldState createState() => _AddTextFieldState();
}

class _AddTextFieldState extends State<AddTextField> {
  @override
  Widget build(BuildContext context) {
    var enam =new List.filled(10,"", growable: true);
    final user=Provider.of<PodcastDemo>(context,listen: false);
    return new Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              child: Text('Episode ${widget.index+1} Title', style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,)),),
            Container(
              padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  //controller: field2,
                  autofocus: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  validator: (_val) {
                    if (_val!.isEmpty) {
                      return "Can't be Empty";
                    }
                  },
                  onChanged: (_val) {
                    enam[widget.index] = _val;
                    user.episodeNum(widget.index, enam[widget.index]);
                  }
                  ),


            ),

          ],
        )
    );
  }
}
//-------------------podClass------------------

class PodClass extends StatefulWidget {
  const PodClass({Key? key}) : super(key: key);

  @override
  _PodClassState createState() => _PodClassState();
}

class _PodClassState extends State<PodClass> {
  @override
  Widget build(BuildContext context) {
    final count=Provider.of<PodcastDemo>(context,listen: false);

    return Column(
      children:[
      Container(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Podcast Name', style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      ),
    ),
      Container(
        padding: EdgeInsets.all(8.0),
        child: TextFormField(
            autofocus: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            validator: (_val) {
              if (_val!.isEmpty) {
                return "Can't be Empty";
              } else {
                return null;
              }
            },
            onChanged: (_val) {
              count.pname(_val);
              //print(form1);
            },
          ),
        ),



    ],);
  }
}
