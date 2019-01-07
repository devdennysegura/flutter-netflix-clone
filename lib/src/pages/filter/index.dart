part of netflix;

class Filter extends StatefulWidget {
  final String title;
  final String type;
  Filter({
    Key key,
    this.title,
    this.type,
  }) : super(key: key);

  @override
  FilterState createState() => FilterState();
}
