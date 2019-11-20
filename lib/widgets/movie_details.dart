import 'package:flutter/material.dart';

import '../movie.dart';

class MovieDetailPage extends StatefulWidget {
  Movie movie;
  MovieDetailPage(this.movie);

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.title),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.grey[350],
      body: _body(),
    );
  }
   final url = 'https://image.tmdb.org/t/p/w500/';
   bool _isFavorite = false;  
    _body()
  {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.black45,
          centerTitle: false,
          expandedHeight: 250,
          leading: Container(),
          floating: false,
          pinned: true,
          flexibleSpace: new FlexibleSpaceBar(
            background: Image.network(
                widget.movie.backdropPath == null ? "https://sanitationsolutions.net/wp-content/uploads/2015/05/empty-image.png" : url + widget.movie.backdropPath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverFillRemaining(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Icon( widget.movie.voteAverage > 2 ? Icons.star :Icons.star_border , size: 30, color: widget.movie.voteAverage > 2 ?  Colors.amber[400] : Colors.grey[700] ,) ,
                                    Icon( widget.movie.voteAverage > 4 ? Icons.star :Icons.star_border , size: 30, color: widget.movie.voteAverage > 4 ?  Colors.amber[400] : Colors.grey[700] ,) ,
                                    Icon( widget.movie.voteAverage > 6 ? Icons.star :Icons.star_border , size: 30, color: widget.movie.voteAverage > 6 ?  Colors.amber[400] : Colors.grey[700] ,) ,
                                    Icon( widget.movie.voteAverage > 8 ? Icons.star :Icons.star_border , size: 30, color: widget.movie.voteAverage > 8 ?  Colors.amber[400] : Colors.grey[700] ,) ,
                                    Icon( widget.movie.voteAverage > 9 ? Icons.star :Icons.star_border , size: 30, color: widget.movie.voteAverage > 9 ?  Colors.amber[400] : Colors.grey[700] ,) ,
                                  ],
                                ),
                              )
                            ],
                          ),
                          Divider(color: Colors.black45),
                          Text(
                            widget.movie.overview,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
