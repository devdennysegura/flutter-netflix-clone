part of netflix;

class MovieApiProvider {
  final String host = 'https://your-host';
  Client client = Client();

  Future<List<ItemModel>> fetchMovieList() async {
    final response = await client.get('$host/api/Home');
    if (response.statusCode == 200) {
      return List.from(json.decode(response.body))
          .map((m) => ItemModel.fromJson(m))
          .toList();
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<Result> fetchOne(int id) async {
    final response = await client.get('$host/api/show/$id');
    if (response.statusCode == 200) {
      return Result.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
