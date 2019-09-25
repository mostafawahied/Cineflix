import 'package:cineflix/widget/MovieDetails/models.dart';

final Movie series = Movie(
  bannerUrl: 'assets/bad/BREAKING-600x382.jpg',
  posterUrl: 'assets/art-0181218713-x300.jpg',
  title: 'Breaking Bad',
  rating: 9.5,
  starRating: 5,
  categories: ['Crime', 'Drama','Thriller'],
  storyline: 'A high school chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine in order to secure his family\'s future....',
  photoUrls: [
    'assets/bad/1.jpg',
    'assets/bad/2.jpg',
    'assets/bad/3.jpg',
    'assets/bad/4.jpg',
  ],

  seasonUrls: [
    'assets/bad/111.jpg',
    'assets/bad/222.jpg',
    'assets/bad/333.jpg',
    'assets/bad/444.jpg',
    'assets/bad/555.jpg',
  ],

  actors: [
    Actor(
      name: 'Bryan Cranston',
      avatarUrl: 'assets/bad/12.jpg',
    ),
    Actor(
      name: 'Anna Gunn',
      avatarUrl: 'assets/bad/13.jpg',
    ),
    Actor(
      name: 'Aaron Paul',
      avatarUrl: 'assets/bad/14.jpg',
    ),
    Actor(
      name: 'Dean Norris',
      avatarUrl: 'assets/bad/15.jpg',
    ),
    Actor(
      name: 'Betsy Brandt',
      avatarUrl: 'assets/bad/11.jpg',
    ),
  ],
);
