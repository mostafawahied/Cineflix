import 'package:cineflix/widget/MovieDetails/models.dart';

final Movie testMovie = Movie(
  bannerUrl: 'assets/theSecret/banner.png',
  posterUrl: 'assets/theSecret/poster.png',
  title: 'The Secret Life of Pets',
  rating: 6.5,
  starRating: 3,
  categories: ['Animation', 'Comedy'],
  storyline: 'For their fifth fully-animated feature-film '
      'collaboration, Illumination Entertainment and Universal '
      'Pictures present The Secret Life of Pets, a comedy about '
      'the lives our...',
  photoUrls: [
    'assets/theSecret/1.png',
    'assets/theSecret/2.png',
    'assets/theSecret/3.png',
    'assets/theSecret/4.png',
  ],
  actors: [
    Actor(
      name: 'Louis C.K.',
      avatarUrl: 'assets/theSecret/louis.png',
    ),
    Actor(
      name: 'Eric Stonestreet',
      avatarUrl: 'assets/theSecret/eric.png',
    ),
    Actor(
      name: 'Kevin Hart',
      avatarUrl: 'assets/theSecret/kevin.png',
    ),
    Actor(
      name: 'Jenny Slate',
      avatarUrl: 'assets/theSecret/jenny.png',
    ),
    Actor(
      name: 'Ellie Kemper',
      avatarUrl: 'assets/theSecret/ellie.png',
    ),
  ],
);
