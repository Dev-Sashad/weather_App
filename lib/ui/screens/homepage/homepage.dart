import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:weather/ui/screens/sideNav/sideNav.dart';
import 'package:weather/ui/screens/today/today.dart';
import 'package:weather/ui/screens/weekly/weekly.dart';
import 'homepage_view_model.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  TabController tabController;
  @override
  void initState() {
    super.initState();

    tabController = new TabController(length: 3, vsync: this);
  }

  int selectedIndex = 0;
  Color textColor = Colors.green;
  List<NavigationItem> items = [
    NavigationItem(Icons.calendar_today_outlined, 'Today'),
    NavigationItem(Icons.calendar_view_day_outlined, 'Weekly'),
    NavigationItem(Icons.share, 'Share'),
  ];

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HomepageViewModel>.withConsumer(
        viewModelBuilder: () => HomepageViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            key: _scaffoldKey,
            extendBodyBehindAppBar: true,
            extendBody: true,
            drawer: SideNavpage(),
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                  icon: Icon(
                    Icons.menu,
                    size: 30,
                    color: Colors.grey[50],
                  ),
                  onPressed: () {
                    _scaffoldKey.currentState.openDrawer();
                  }),
              actions: [
                IconButton(
                    icon: Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.grey[50],
                    ),
                    onPressed: () {})
              ],
            ),
            bottomNavigationBar: new Material(
              elevation: 0.0,
              color: Colors.grey[50],
              child: TabBar(
                  indicatorWeight: 1.0,
                  indicatorColor: Colors.transparent,
                  controller: tabController,
                  onTap: (value) {
                    setState(() {
                      selectedIndex = tabController.index;
                    });
                  },
                  tabs: [
                    _buildItem(
                        selectedIndex == items.indexOf(items.elementAt(0)),
                        items.elementAt(0)),
                        // model.newTab(0, tabController)),
                    _buildItem(
                        selectedIndex == items.indexOf(items.elementAt(1)),
                        items.elementAt(1)),
                        // model.newTab(1, tabController)),
                    _buildItem(
                        selectedIndex == items.indexOf(items.elementAt(2)),
                        items.elementAt(2)),
                        // model.newTab(2, tabController)),
                  ]),
            ),
            body: TabBarView(
                controller: tabController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Today(),
                  Weekly(),
                  InkWell(
                    onTap: () {},
                  ),
                ]),
          );
        });
  }

  Widget _buildItem(bool isSelected, NavigationItem item) {
    return GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              icon: Icon(
                item.icon,
                size: 25,
                color: isSelected ? Colors.blue : Colors.black,
              ),
              onPressed: () {}),
          Text(
            item.title,
            style: TextStyle(
                color: isSelected ? Colors.blue : Colors.black,
                fontFamily: 'Caros',
                fontSize: 17.0,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}

class NavigationItem {
  final IconData icon;
  final String title;

  NavigationItem(this.icon, this.title);
}
