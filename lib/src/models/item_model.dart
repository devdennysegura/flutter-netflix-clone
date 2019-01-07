part of netflix;

class ItemModel {
  String _title;
  List<Result> _results = [];

  ItemModel.fromJson(Map<String, dynamic> parsedJson) {
    _title = parsedJson['title'];
    _results = List.from(parsedJson['items'])
        .map(
          (r) => Result.fromJson(r),
        )
        .toList();
  }

  List<Result> get results => _results;
  String get title => _title;
}
