part of netflix;

class Result {
  int id;
  String _name;
  String _image;
  List<String> _genres;
  List<String> _cast;
  List<Episode> _episodes;
  List<int> _seasons = [];
  DateTime _date;
  String _description;

  Result.fromJson(Map<String, dynamic> parsedJson) {
    _name = parsedJson['name'];
    _image = parsedJson['image'];
    _genres = List.from(parsedJson['details']['genres'])
        .map((genre) => genre.toString())
        .toList();
    _cast = List.from(parsedJson['details']['cast'])
        .map((cast) => cast['person']['name'].toString())
        .toList();
    _date = parsedJson['year'] != null
        ? DateTime.parse(parsedJson['year'].toString())
        : DateTime.now();
    RegExp exp = new RegExp(r"<[^>]*>");
    _description = parsedJson['details']['description'].replaceAll(exp, '');
    _episodes = List.from(parsedJson['details']['episodes'])
        .map((e) => Episode.fromJson(e))
        .toList();
    List.from(parsedJson['details']['episodes']).forEach((s) {
      int seasonNumber = int.parse(s['season'].toString());
      if (!_seasons.contains(seasonNumber)) _seasons.add(seasonNumber);
    });
  }

  String get name => _name;
  String get image => _image;
  List<String> get genres => _genres;
  List<String> get cast => _cast;
  DateTime get date => _date;
  String get description => _description;
  List<Episode> get episodes => _episodes;
  List<int> get seasons => _seasons;
}
