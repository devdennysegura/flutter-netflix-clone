part of netflix;

class TvShowState extends State<TvShow> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            primary: true,
            expandedHeight: screenSize.height * 0.50,
            backgroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: Container(
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Image.network(
                      widget.item.image,
                      fit: BoxFit.fitWidth,
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        // image: DecorationImage(
                        //   image: NetworkImage(widget.item.image),
                        //   fit: BoxFit.fitWidth,
                        // ),
                        gradient: LinearGradient(
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                          stops: [0.1, 0.4, 1.0],
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(bottom: 8.0),
                              child: Container(
                                child: Text(
                                  widget.item.name,
                                  maxLines: 3,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 24.0,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  '${widget.match}% de coicidencia',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Color.fromRGBO(0, 255, 0, 0.8),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.0,
                                  ),
                                ),
                                Text(
                                  widget.item.date.year.toString(),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 0.3),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.0,
                                  ),
                                ),
                                Text(
                                  '16 +',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 0.3),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.0,
                                  ),
                                ),
                                Text(
                                  '${widget.item.seasons.length} temporadas',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 0.3),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Container(
                                child: Text(
                                  widget.item.description,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 0.8),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Container(
                                child: RichText(
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                    style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 0.3),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.0,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Protagonizada por: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(
                                          text: widget.item.cast.join(', ')),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                FlatButton(
                                  textColor: Colors.white70,
                                  onPressed: () => print('Mi Lista'),
                                  child: Column(
                                    children: <Widget>[
                                      Icon(Icons.add, size: 32.0,),
                                      Text(
                                        'Mi Lista',
                                        style: TextStyle(fontSize: 10.0),
                                      )
                                    ],
                                  ),
                                ),
                                FlatButton(
                                  textColor: Colors.white70,
                                  onPressed: () => print('calificar'),
                                  child: Column(
                                    children: <Widget>[
                                      Icon(Icons.thumb_up, size: 32.0,),
                                      Text(
                                        'Calificar',
                                        style: TextStyle(fontSize: 10.0),
                                      )
                                    ],
                                  ),
                                ),
                                FlatButton(
                                  textColor: Colors.white70,
                                  onPressed: () => print('Compartir'),
                                  child: Column(
                                    children: <Widget>[
                                      Icon(Icons.share, size: 32.0,),
                                      Text(
                                        'Compartir',
                                        style: TextStyle(fontSize: 10.0),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        height: 64.0,
                        width: 64.0,
                        child: OutlineButton(
                          padding: EdgeInsets.all(0.0),
                          onPressed: () => print('play'),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(32.0),
                            ),
                          ),
                          child: Container(
                            height: 64.0,
                            width: 64.0,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(0, 0, 0, 0.3),
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                            child: Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 48.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // SliverList(
          //   delegate: SliverChildBuilderDelegate(
          //     (context, index) => ShowsList(
          //           items: snapshot.data[index].results,
          //           onTap: goToDetail,
          //           title: snapshot.data[index].title,
          //         ),
          //     childCount: snapshot.data.length,
          //   ),
          // )
        ],
      ),
    );
  }
}
