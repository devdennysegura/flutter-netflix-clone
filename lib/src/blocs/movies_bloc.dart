part of netflix;

class MoviesBloc {
  final _repository = Repository();
  final _moviesFetcher = PublishSubject<List<ItemModel>>();

  Observable<List<ItemModel>> get allMovies => _moviesFetcher.stream;

  fetchAllMovies() async {
    List<ItemModel> items = await _repository.fetchAllMovies();
    _moviesFetcher.sink.add(items);
  }

  dispose() {
    _moviesFetcher.close();
  }
}

final bloc = MoviesBloc();
