part of netflix;

class MovieApiProvider {
  Client client = Client();

  Future<List<ItemModel>> fetchMovieList() async {
    final response = await client.get('https://701f018f.ngrok.io/api/Home');
    if (response.statusCode == 200) {
      return List.from(json.decode(response.body))
          .map((m) => ItemModel.fromJson(m))
          .toList();
    } else {
      throw Exception('Failed to load post');
    }
  }
}
