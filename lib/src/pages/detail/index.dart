part of netflix;

class TvShow extends StatefulWidget {
  final double match;
  final Result item;

  TvShow({
    Key key,
    this.match,
    this.item,
  }) : super(key: key);

  @override
  TvShowState createState() => TvShowState();
}
