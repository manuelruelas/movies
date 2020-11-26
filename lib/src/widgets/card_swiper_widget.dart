import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:movies/src/models/movie.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;

  CardSwiper({@required this.movies});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Swiper(
        itemBuilder: (context, index) {
          movies[index].uniqueId = '${movies[index].id}-poster';
          return ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: InkWell(
              onTap: () => Navigator.pushNamed(context, 'detail',
                  arguments: movies[index]),
              child: Hero(
                tag: movies[index].uniqueId,
                child: FadeInImage(
                  placeholder: AssetImage('assets/loading.gif'),
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    movies[index].getPosterImg(),
                  ),
                ),
              ),
            ),
          );
        },
        itemWidth: _screenSize.width * 0.6,
        itemHeight: _screenSize.height * 0.5,
        itemCount: this.movies.length,
        layout: SwiperLayout.STACK,
      ),
    );
  }
}
