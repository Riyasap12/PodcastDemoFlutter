import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class PodcastDemo with ChangeNotifier {
  final db = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('Podcast');
  int i = 0;   //Episode Index
  String docId = "";
  String podName = '';
  String eptitle = '';
  String epnum = "";
  var enam = new List.filled(10, "", growable: true);
  GlobalKey<FormState> form1 = GlobalKey<FormState>();

  void addData() {
    docId = users.doc().id;
    users.doc(docId).set({'Name': podName});
    for (int k = 0; k <=i; k++) {
      String sam = (k + 1).toString();
      users.doc(docId).collection('Episode').doc().set(
          {'Episode Number': 'Episode Number $sam', 'Episode Name': enam[k]});
    }
  }

  void pname(String name) {
    podName = name;
    notifyListeners();
  }

  void snapDocId(String id) {
    docId = id;
    print(docId);
    notifyListeners();
  }

  void episodeDetail(String name, String num) {
    eptitle = name;
    epnum = num;
    notifyListeners();
  }

  void episodeNum(int j, String sam) {
    enam[j] = sam;
    if(j>i){
    i=j;}
    notifyListeners();
  }

}