import 'dart:async';
import 'package:dsc_hackathon/models/sentence_model.dart';
import 'package:dsc_hackathon/screens/card_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _message = '📲';
  String emojiMessage = '';
  var parser = EmojiParser();

  int _selectedIndex = 0;
  int _currentTab = 0;
  List<Sentence> sentences = travelList;
  List<String> _icons = [
    '🏢', '🏠', '🚆', '🆘'
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
          if (index == 0) {
            sentences = workList;
          } else if (index == 1) {
            sentences = homeList;
          } else if (index == 2) {
            sentences = travelList;
          } else {
            sentences = sosList;
          }
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? Theme.of(context).accentColor
              : Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Center (child: Text(
          _icons[index],
          style: TextStyle(
            fontSize: 25,
            color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : Color(0xFFB4C1C4),
            ),
        ),
        )
      ),
    );
  }

  Future<String> _promptForString(String label, { String hintText }) {
    final TextEditingController controller = new TextEditingController();
    return showDialog(
      context: context,
      child: new AlertDialog(
        title: new Text(label),
        content: new TextFormField(
          controller: controller,
          decoration: new InputDecoration(hintText: hintText),
        ),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('CANCEL'),
          ),
          new FlatButton(
            onPressed: () => Navigator.pop(context, controller.text),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget> [
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 120.0, top: 20.0, bottom: 20.0),
              child: Text(
                '👋 Hi, My name is Matthew!',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
                  .asMap()
                  .entries
                  .map(
                    (MapEntry map) => _buildIcon(map.key),
                  )
                  .toList(),
            ),

            SizedBox(height: 20.0),

            Center(
              child: Card(
                child: Container(
                  width: 500,
                  height: 120,
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 100.0, right: 100.0, top: 30.0),
                          child: Text(
                            emojiMessage,
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5.0),
                          child: Text(
                            _message,
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ] 
                    )                  
                  )
                ),
              )
            ),

            SizedBox(height: 20.0,),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '🎙️ Top sentences',
                    style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),

                GestureDetector(
                  onTap: () => print('See All'),
                  child: Text(
                    'See All',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ],
              ),
            ),

            Container(
              height: 300.0,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: sentences.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card (
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        print('Card tapped.');
                        setState(() {
                          emojiMessage = sentences[index].emojiString;
                          _message = sentences[index].description;
                        });
                        
                      },
                      child : ListTile(
                        title: Text(sentences[index].emojiString, style: TextStyle(fontSize: 21)),
                        subtitle: Text(sentences[index].description)
                      ),
                    )
                  );
                }
              )
            )
          ]
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (int value) {
          setState(() {
            _currentTab = value; 
            if (value == 1) {
              sentences = homeList;
              _selectedIndex = 1;
            }
            if (value == 2) {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CardScreen();
              }));
            }
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30.0,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.location_on,
              size: 30.0,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15.0,
              backgroundImage: NetworkImage('https://media-exp1.licdn.com/dms/image/C5103AQHrFhkkI9Ed-A/profile-displayphoto-shrink_200_200/0?e=1590019200&v=beta&t=XWav0srCR9X-Rhd9sGzofXfZqTjouHBmxRwJsIxOEK0'),
            ),
            title: SizedBox.shrink(),
          )
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.edit),
        onPressed: () async {
          String message = await _promptForString('New message', hintText: 'Type your message here');
          if (!mounted)
            return;
          setState(() {
            _message = parser.unemojify(message).replaceAll(':', ' ');
            emojiMessage = message;

          });
        },
      ),
    );
  }
}