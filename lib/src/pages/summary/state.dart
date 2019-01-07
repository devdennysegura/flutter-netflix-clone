part of netflix;

class SummaryState extends State<Summary> {
  dynamic tvShow = {
    "details": {
      "genres": ["Drama", "Crime"],
      "year": "2011-09-20",
      "description":
          "<p><b>Unforgettable</b> follows Carrie Wells, an enigmatic former police detective with a rare condition that makes her memory so flawless that every place, every conversation, every moment of joy and every heartbreak is forever embedded in her mind. It's not just that she doesn't forget anything - she can't; except for one thing: the details that would help solve her sister's long-ago murder. Carrie has tried to put her past behind her, but she's unexpectedly reunited with her ex-boyfriend and partner, NYPD Detective Al Burns when she consults on a homicide case.</p>"
    },
    "_id": "5bedbf00a70245f2bbdd6a64",
    "id": 89,
    "name": "Unforgettable",
    "image":
        "http://static.tvmaze.com/uploads/images/original_untouched/0/663.jpg"
  };

  void goTo(String type) {
    Application.router.navigateTo(
      context,
      '${Routes.filter}',
      transition: TransitionType.nativeModal,
      transitionDuration: const Duration(milliseconds: 200),
      object: {'type': type},
    );
  }

  void goToDetail(Result item, double match) {
    Application.router.navigateTo(
      context,
      '${Routes.detail}',
      transition: TransitionType.inFromRight,
      transitionDuration: const Duration(milliseconds: 200),
      object: {'match': match, 'show': item},
    );
  }

  List<Widget> renderMainGenres() {
    List<Widget> genres = List.from(tvShow['details']['genres'].map((g) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          g,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 12.0,
          ),
        ),
      );
    }).toList());
    return genres;
  }

  Widget renderTitle(String tag, String text) {
    return Hero(
      tag: tag,
      child: FlatButton(
        onPressed: () => goTo(tag),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    bloc.fetchAllMovies();
    return StreamBuilder(
      stream: bloc.allMovies,
      builder: (context, AsyncSnapshot<List<ItemModel>> snapshot) {
        if (snapshot.hasData) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                primary: true,
                expandedHeight: screenSize.height * 0.65,
                backgroundColor: Colors.black,
                leading: Image.asset('assets/images/netflix_icon.png'),
                titleSpacing: 20.0,
                title: Title(
                  color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      renderTitle('Series', 'Series'),
                      renderTitle('Películas', 'Películas'),
                      renderTitle('Mi-lista', 'Mi lista'),
                    ],
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Container(
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Image.network(
                          tvShow['image'],
                          fit: BoxFit.cover,
                        ),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: FractionalOffset.topCenter,
                              end: FractionalOffset.bottomCenter,
                              stops: [0.1, 0.6, 1.0],
                              colors: [
                                Colors.black54,
                                Colors.transparent,
                                Colors.black
                              ],
                            ),
                          ),
                          child: Container(
                            height: 40.0,
                            width: screenSize.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          width: 3.0,
                                          color:
                                              Color.fromRGBO(185, 3, 12, 1.0),
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      tvShow['name'].replaceAll(' ', '\n'),
                                      maxLines: 3,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        height: 0.65,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 30.0,
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: renderMainGenres(),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      FlatButton(
                                        textColor: Colors.white,
                                        child: Column(
                                          children: <Widget>[
                                            Icon(Icons.add),
                                            Text(
                                              'Mi lista',
                                              style: TextStyle(
                                                  fontSize: 10.0,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                          ],
                                        ),
                                        onPressed: () => print('mi lista'),
                                      ),
                                      RaisedButton(
                                        textColor: Colors.black,
                                        color: Colors.white,
                                        child: Row(
                                          children: <Widget>[
                                            Icon(Icons.play_arrow),
                                            Text(
                                              'Reproducir',
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        onPressed: () => print('Reproducir'),
                                      ),
                                      FlatButton(
                                        textColor: Colors.white,
                                        child: Column(
                                          children: <Widget>[
                                            Icon(Icons.info_outline),
                                            Text(
                                              'Información',
                                              style: TextStyle(
                                                  fontSize: 10.0,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                          ],
                                        ),
                                        onPressed: () => print('informacion'),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => ShowsList(
                        items: snapshot.data[index].results,
                        onTap: goToDetail,
                        title: snapshot.data[index].title,
                      ),
                  childCount: snapshot.data.length,
                ),
              )
            ],
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
