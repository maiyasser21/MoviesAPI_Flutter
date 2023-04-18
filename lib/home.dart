import 'dart:js';

import 'package:flutter/material.dart';
import 'package:task/data/datasource/remote/api.dart';
import 'package:task/data/model/Movies.dart';
import 'package:task/movie.dart';
import 'data/datasource/remote/constants.dart';

class MyHomePage extends StatelessWidget {
  void _movieData(Results response) {
    Navigator.push(
        context as BuildContext,
        MaterialPageRoute(
          builder: (context) => Movie(response),
        ));
  }

  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ApiService.api.fetchdata();
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(children: [
            FutureBuilder(
                future: ApiService.api.fetchdata(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    Movies movies = snapshot.data!;
                    List<Results>? movielist = movies.results;
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: movielist?.length,
                        itemBuilder: (context, index) => ListTile(
                              onTap: () {
                                _movieData(movielist![index]);
                              },
                              leading: Image.network(
                                  "${imgurl}${movielist?[index].posterPath}"),
                              title: Text(
                                  "${movielist?[index].title} (${movielist?[index].releaseDate})"),
                              subtitle:
                                  Text("${movielist?[index].voteAverage}"),
                            ));
                  } else if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else {
                    return CircularProgressIndicator();
                  }
                })
          ]),
        ),
      )),
    );
  }
}
