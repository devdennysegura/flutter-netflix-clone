part of netflix;

class LoginState extends State<Login> with SingleTickerProviderStateMixin {
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  @override
  void initState() {
    super.initState();
    _iconAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _iconAnimation = CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.bounceOut,
    );
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: AssetImage('assets/images/girl.jpeg'),
            fit: BoxFit.cover,
            colorBlendMode: BlendMode.darken,
            color: Colors.black54,
          ),
          Theme(
            data: ThemeData(
                brightness: Brightness.dark,
                inputDecorationTheme: InputDecorationTheme(
                  labelStyle:
                      TextStyle(color: Colors.tealAccent, fontSize: 25.0),
                )),
            isMaterialAppTheme: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlutterLogo(
                  size: _iconAnimation.value * 140.0,
                ),
                Container(
                  padding: const EdgeInsets.all(40.0),
                  child: Form(
                    autovalidate: true,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        TextField(
                          style: TextTheme.subtitle1,
                          decoration: InputDecoration(
                            labelText: 'Usuario',
                            labelStyle: TextTheme.body2,
                          ),
                          keyboardType: TextInputType.text,
                        ),
                        TextField(
                          style: TextTheme.subtitle1,
                          decoration: InputDecoration(
                            labelText: 'Contraseña',
                            labelStyle: TextTheme.body2,
                          ),
                          obscureText: true,
                          keyboardType: TextInputType.text,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 60.0),
                        ),
                        MaterialButton(
                          height: size.height * 0.10,
                          minWidth: size.height * 0.30,
                          color: Palette.yellowOrange,
                          splashColor: Colors.black26,
                          highlightColor: Colors.black12,
                          textColor: Colors.white,
                          child: Text(
                            'INGRESAR',
                            style: TextTheme.button,
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
