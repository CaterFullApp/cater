import 'package:flutter/material.dart';
import 'package:cater/constants/constants.dart' show AppColors;
import 'package:cater/pages/discovery_page.dart';
import 'package:cater/pages/news_list_page.dart';
import 'package:cater/pages/profile_page.dart';
import 'package:cater/pages/tweet_page.dart';
import 'package:cater/widgets/my_drawer.dart';
import 'package:cater/widgets/navigation_icon_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _appBarTitle = ['menu', 'shop', 'discover', 'mine'];
  List<NavigationIconView> _navigationIconViews;
  var _currentIndex = 0;
  List<Widget> _pages;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _navigationIconViews = [
      NavigationIconView(
          title: 'menu',
          iconPath: 'assets/images/ic_nav_news_normal.png',
          activeIconPath: 'assets/images/ic_nav_news_actived.png'),
      NavigationIconView(
          title: 'shop',
          iconPath: 'assets/images/ic_nav_tweet_normal.png',
          activeIconPath: 'assets/images/ic_nav_tweet_actived.png'),
      NavigationIconView(
          title: 'discover',
          iconPath: 'assets/images/ic_nav_discover_normal.png',
          activeIconPath: 'assets/images/ic_nav_discover_actived.png'),
      NavigationIconView(
          title: 'mine',
          iconPath: 'assets/images/ic_nav_my_normal.png',
          activeIconPath: 'assets/images/ic_nav_my_pressed.png'),
    ];

    _pages = [
      NewsListPage(),
      TweetPage(),
      DiscoveryPage(),
      ProfilePage(),
    ];

    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    //SafeArea 可以适配刘海屏等异形屏
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          _appBarTitle[_currentIndex],
          style: TextStyle(color: Color(AppColors.APPBAR)),
        ),
        iconTheme: IconThemeData(color: Color(AppColors.APPBAR)),
      ),
      body: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        //禁止滑动
        itemBuilder: (BuildContext context, int index) {
          return _pages[index];
        },
        controller: _pageController,
        itemCount: _pages.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: _navigationIconViews.map((view) => view.item).toList(),
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _pageController.animateToPage(index,
              duration: Duration(microseconds: 1), curve: Curves.ease);
        },
      ),
      drawer: MyDrawer(
        headImgPath: 'assets/images/cover_img.jpg',
        menuIcons: [Icons.send, Icons.home, Icons.error, Icons.settings],
        menuTitles: ['aaa', 'bbb', '关于', '设置'],
      ),
    );
  }
}
