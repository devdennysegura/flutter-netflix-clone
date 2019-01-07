part of netflix;

class Repository {
  final moviesApiProvider = MovieApiProvider();

  Future<List<ItemModel>> fetchAllMovies() => moviesApiProvider.fetchMovieList();
}
