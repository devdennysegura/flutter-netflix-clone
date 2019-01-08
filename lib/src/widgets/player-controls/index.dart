part of netflix;

class PlayerControl extends StatefulWidget {
  final VideoPlayerController controller;
  final String title;
  final bool visible;

  PlayerControl(this.controller, {this.visible, this.title, Key key}) : super(key: key);

  @override
  PlayerControlState createState() => PlayerControlState();
}
