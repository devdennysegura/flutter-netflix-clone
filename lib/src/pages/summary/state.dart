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
  List<dynamic> showsFirst = [
    {
      'key': 1,
      'name': 'Suits',
      'image':
          'https://static.tvmaze.com/uploads/images/medium_portrait/0/2432.jpg'
    },
    {
      'key': 2,
      'name': 'Modern Family',
      'image':
          'https://static.tvmaze.com/uploads/images/medium_portrait/0/628.jpg'
    },
    {
      'key': 3,
      'name': 'The Flash',
      'image':
          'https://static.tvmaze.com/uploads/images/medium_portrait/78/195988.jpg'
    },
    {
      'key': 4,
      'name': 'Supergirl',
      'image':
          'https://static.tvmaze.com/uploads/images/medium_portrait/83/209955.jpg'
    },
    {
      'key': 5,
      'name': 'Designated Survivor',
      'image':
          'https://static.tvmaze.com/uploads/images/medium_portrait/101/253490.jpg'
    },
    {
      'key': 6,
      'name': '24: Legacy',
      'image':
          'https://static.tvmaze.com/uploads/images/medium_portrait/90/225030.jpg'
    }
  ];

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

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
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
                Text(
                  'Series',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0,
                  ),
                ),
                Text(
                  'Películas',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0,
                  ),
                ),
                Text(
                  'Mi lista',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0,
                  ),
                ),
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
                                    color: Color.fromRGBO(185, 3, 12, 1.0),
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
                  items: showsFirst,
                  onTap: () => print('show tapped'),
                  title: 'Nuevos Lanzamientos',
                ),
          ),
        )
      ],
    );
  }
}
