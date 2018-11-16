part of netflix;

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  HomeState createState() => HomeState();
}