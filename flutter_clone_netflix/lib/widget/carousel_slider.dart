import 'package:flutter/cupertino.dart';
import 'package:flutter_clone_netflix/model/model_movie.dart';

class CarouseImage extends StatefulWidget {
  final List<Movie> movies;
  CarouseImage({required this.movies});
  _CarouseImageState createState() => _CarouseImageState();
}

class _CarouseImageState extends State<CarouseImage> {
  late List<Movie> movies;
  late List<Widget> images;
  late List<String> keywords;
  late List<bool> likes;

  int _currentPage = 0;
  late String _currentKeyword;


  //movie 관리하는 State를 통해 변수들의 초기값 선언
  @override
  void initState() {
    super.initState();
    movies = widget.movies;
    images = movies.map((m) => Image.asset('./images/' + m.poster)).toList();
    keywords = movies.map((m) => m.keyword).toList();
    likes = movies.map((m) => m.like).toList();
    _currentKeyword = keywords[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}