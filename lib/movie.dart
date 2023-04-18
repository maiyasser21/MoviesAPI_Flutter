import 'package:flutter/material.dart';

import 'data/datasource/remote/constants.dart';
import 'data/model/Movies.dart';

class Movie extends StatelessWidget {
  final Results movieInfo;
  const Movie(this.movieInfo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.network("${imgurl}${movieInfo.posterPath}"),
          Text("${movieInfo.title} (${movieInfo.releaseDate})"),
          Text("${movieInfo.voteAverage}"),
          Text("${movieInfo.overview}"),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back))
        ]),
      )),
    );
  }
}
