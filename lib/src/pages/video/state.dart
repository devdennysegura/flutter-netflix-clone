part of netflix;

class VideoState extends State<Video> {
  VideoPlayerController vcontroller;
  bool controlVisible;
  Timer timer;

  @override
  void initState() {
    controlVisible = true;
    vcontroller = VideoPlayerController.asset('assets/video/promo.mp4');
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
    ));
    super.initState();
    autoHide();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    vcontroller?.dispose();
    timer?.cancel();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  void handlerGesture() {
    setState(() {
      controlVisible = !controlVisible;
    });
    autoHide();
  }

  void autoHide() {
    if (controlVisible) {
      timer = Timer(
          Duration(seconds: 5), () => setState(() => controlVisible = false));
    } else {
      timer?.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    final aspectRatio = 0.75;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          PlayerLifeCycle(
            vcontroller,
            (BuildContext context, VideoPlayerController controller) =>
                AspectRatio(
                  aspectRatio: aspectRatio,
                  child: VideoPlayer(vcontroller),
                ),
          ),
          GestureDetector(
            child: PlayerControl(
              vcontroller,
              visible: controlVisible,
              title: widget.title,
            ),
            onTap: handlerGesture,
          ),
        ],
      ),
    );
  }
}
