part of netflix;

class Routes {
  static String root = '/';
  static String summary = '/summary';
  static String detail = '/detail';
  static String filter = '/filter';
  static String video = '/trailer';

  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(handlerFunc:
        (BuildContext context, Map<String, List<String>> params,
            [dynamic object]) {
      print('ROUTE WAS NOT FOUND !!!');
      return null;
    });
    router.define(root, handler: rootHandler);
    router.define(summary, handler: summaryRouteHandler);
    router.define(detail, handler: detailRouteHandler);
    router.define(filter, handler: filterRouteHandler);
    router.define(video, handler: trailerRouteHandler);
  }
}
