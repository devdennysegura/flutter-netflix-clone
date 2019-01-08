part of netflix;

class TvShow extends StatefulWidget {
  final int match;
  final Result item;

  TvShow({
    Key key,
    this.match,
    this.item,
  }) : super(key: key);

  @override
  TvShowState createState() => TvShowState();
}
