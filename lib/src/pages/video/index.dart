part of netflix;

class Video extends StatefulWidget {
  Video({Key key, this.title}) : super(key: key);
  final String title;

  @override
  VideoState createState() => VideoState();
}