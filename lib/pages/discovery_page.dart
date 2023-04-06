import 'package:flutter/material.dart';
import 'package:cater/pages/common_web_page.dart';
import 'package:cater/pages/shake_page.dart';

class DiscoveryPage extends StatefulWidget {
  @override
  _DiscoveryPageState createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> {
  List<Map<String, IconData>> blocks = [
    {
      'aaa': Icons.pageview,
      'bbb': Icons.speaker_notes_off,
      'aaa': Icons.screen_share,
      'aaa': Icons.assignment,
    },
    {
      'aaa': Icons.camera_alt,
      'aaa': Icons.camera,
    },
    {
      'aaa': Icons.person,
      'aaa': Icons.android,
    }
  ];

  Future scan() async {

  }

  void _handleItemClick(String title) {
    switch (title) {
      case '开源众包':
        _navToWebPage(title, 'https://zb.oschina.net/');
        break;
      case '扫一扫':
        scan();
        break;
      case '摇一摇':
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ShakePage()));
        break;
    }
  }

  void _navToWebPage(String title, String url) {
    if (title != null && url != null) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CommonWebPage(
                title: title,
                url: url,
              )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: blocks.length,
        itemBuilder: (context, bolockIndex) {
          return Container(
//            height: 200.0,
//            color: Color(0xffff0000),
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 1.0,
                  color: Color(0xffaaaaaa),
                ),
                bottom: BorderSide(
                  width: 1.0,
                  color: Color(0xffaaaaaa),
                ),
              ),
            ),
            child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                //滑动冲突
                shrinkWrap: true,
                itemBuilder: (context, mapIndex) {
                  return InkWell(
                    onTap: () {
                      _handleItemClick(
                          blocks[bolockIndex].keys.elementAt(mapIndex));
                    },
                    child: Container(
                      height: 60.0,
                      child: ListTile(
                        leading: Icon(
                            blocks[bolockIndex].values.elementAt(mapIndex)),
                        title:
                            Text(blocks[bolockIndex].keys.elementAt(mapIndex)),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, mapIndex) {
                  return Divider(
                    height: 2.0,
                    color: Color(0xffff0000),
                  );
                },
                itemCount: blocks[bolockIndex].length),
          );
        });
  }
}
