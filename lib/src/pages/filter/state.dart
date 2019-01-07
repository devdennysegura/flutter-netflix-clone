part of netflix;

class FilterState extends State<Filter> {
  String filterSelected;
  List<String> options = ['Series', 'Películas', 'Mi-lista'];
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
  @override
  void initState() {
    filterSelected = widget.type;
    super.initState();
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
          // titleSpacing: 20.0,
          title: Title(
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Hero(
                  tag: widget.type,
                  child: FlatButton(
                    onPressed: () => print(widget.type),
                    child: Text(
                      widget.type.replaceAll('-', ' '),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                      ),
                    ),
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
