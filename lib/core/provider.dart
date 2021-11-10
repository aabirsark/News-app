import 'package:flutter/cupertino.dart';
import 'package:newfeed/model/headlines.dart';

class TopHeadlines with ChangeNotifier {
  // variable
  Headlines? _headlines;

  // getter
  Headlines? get headlines => _headlines;

  // setter
  void setHeadlines(Headlines hd) {
    _headlines = hd;
    notifyListeners();
  }
}

class SearchFeed with ChangeNotifier {
  // variable
  Headlines? _feed;

  // getter
  Headlines? get feed => _feed;

  // setter
  void setFeed(Headlines hd) {
    _feed = hd;
    notifyListeners();
  }
}
