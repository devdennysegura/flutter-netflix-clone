part of netflix;

var rootHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params,
      [dynamic object]) {
    return Home();
  },
);
var summaryRouteHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params,
      [dynamic object]) {
    return Summary();
  },
);
var detailRouteHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params,
      [dynamic object]) {
    return TvShow(match: object['match'], item: object['show']);
  },
);
var trailerRouteHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params,
      [dynamic object]) {
    return Video(title: object['title']);
  },
);
var filterRouteHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params,
      [dynamic object]) {
    return Filter(
      type: object['type'],
    );
  },
);
