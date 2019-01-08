part of netflix;

class Video extends StatefulWidget {
  final String title;
  Video({Key key, this.title}) : super(key: key);

  @override
  VideoState createState() => VideoState();
}
