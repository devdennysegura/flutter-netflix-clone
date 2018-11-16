library netflix;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'src/utils/theme/color.dart';
part 'src/utils/theme/typography.dart';
part 'src/pages/home/index.dart';
part 'src/pages/home/state.dart';
part 'src/pages/summary/index.dart';
part 'src/pages/summary/state.dart';
part 'src/widgets/tvshow-list/index.dart';

class Netflix extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Netflix',
      theme: ThemeData(
        fontFamily: 'GoogleSans',
        primaryColor: Colors.black,
      ),
      home: Home(),
    );
  }
}
