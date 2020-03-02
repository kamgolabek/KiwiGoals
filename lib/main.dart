import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getflutter/getflutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:section_7_project/screens/goal_manage_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      routes: {
        GoalManageScreen.routeName: (ctx) => GoalManageScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2d3436),
        title: Text(
          'KiwiGoals',
          style: GoogleFonts.indieFlower(
            color: Color(0xffdfe6e9),
            fontSize: 25,
          ),
        ),
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FaIcon(FontAwesomeIcons.kiwiBird),
          ],
        ),
      ),
      backgroundColor: Color(0xff212121),
      body: GFTabBarView(controller: tabController, children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              color: Color(0xff2d3436),
              child: Expanded(
                child: FlareActor(
                  "assets/flare/kiwi_bird.flr",
                  alignment: Alignment.center,
                  fit: BoxFit.scaleDown,
                  animation: 'go',
                  controller: null,
                  sizeFromArtboard: false,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You haven\'t add any goals yet  :( ',
                    style: TextStyle(
                      fontSize: 23,
                      color: Color(0xffdfe6e9),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Kiwi is so hungry... ;(',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xffdfe6e9),
                    ),
                  ),
                  SizedBox(height: 50),
                  GFButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        GoalManageScreen.routeName,
                      );
                    },
                    text: "Add your first goals here",
                    color: Color(0xff00b894),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          color: Color(0xff2d3436),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: <Widget>[
                GFListTile(
                    color: Colors.white,
                    avatar: GFAvatar(),
                    titleText: 'Title',
                    subtitleText:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing',
                    icon: Icon(Icons.favorite)),
              ],
            ),
          ),
        ),
        Container(
          color: Color(0xff2d3436),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CircularPercentIndicator(
                radius: 100.0,
                lineWidth: 10.0,
                percent: 0.8,
                header: new Text("Icon header"),
                center: new Icon(
                  Icons.person_pin,
                  size: 50.0,
                  color: Colors.blue,
                ),
                backgroundColor: Colors.grey,
                progressColor: Colors.blue,
              ),
            ],
          ),
        )
      ]),
      bottomNavigationBar: GFTabBar(
        initialIndex: 0,
        length: 3,
        controller: tabController,
        tabBarColor: Color(0xff2d3436),
        tabs: [
          Tab(
            icon: Icon(FontAwesomeIcons.tasks),
            child: const Text(
              'On track',
            ),
          ),
          Tab(
            icon: Icon(LineAwesomeIcons.dashboard),
            child: const Text(
              'Dashboard',
            ),
          ),
          Tab(
            icon: Icon(LineAwesomeIcons.line_chart),
            child: const Text(
              'Statistics',
            ),
          ),
        ],
      ),
    );
  }
}
