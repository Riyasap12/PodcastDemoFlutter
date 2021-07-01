import 'package:flutter/cupertino.dart';
import 'package:muhsin01/provider1.dart';
import 'package:provider/provider.dart';
import 'podcast.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      ChangeNotifierProvider<PodcastDemo>(
      create: (_)=>PodcastDemo(),
      child: Podcast()));
}

