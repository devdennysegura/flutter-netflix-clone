part of netflix;

class MoviesBloc {
  final _repository = Repository();
  final _moviesFetcher = PublishSubject<List<ItemModel>>();
  final _movieFetcher = PublishSubject<Result>();

  Observable<List<ItemModel>> get allMovies => _moviesFetcher.stream;
  Observable<Result> get oneMovie => _movieFetcher.stream;

  fetchAllMovies() async {
    List<ItemModel> items = await _repository.fetchAllMovies();
    _moviesFetcher.sink.add(items);
  }

  fetchOneMovie(int id) async {
    Result item = await _repository.fetchMovie(id);
    _movieFetcher.sink.add(item);
  }

  dispose() {
    _moviesFetcher.close();
    _movieFetcher.close();
  }
}

final bloc = MoviesBloc();
