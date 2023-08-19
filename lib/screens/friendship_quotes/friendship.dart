import 'package:flutter/material.dart';
import 'package:random_qoutes/constants.dart';
import 'package:share/share.dart';
class FriendShip extends StatefulWidget {
  const FriendShip({Key? key}) : super(key: key);

  @override
  State<FriendShip> createState() => _FriendShipState();
}

class _FriendShipState extends State<FriendShip> {
  int _currentIndex = 0;
  List<String> favourite=[];
  int colorIndex=0;

  void _nextQuote() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % friendShipQuotes.length;
    });
  }
  void _shareQuote() {
     String quote = friendShipQuotes[_currentIndex]["Quotes"]!;
     String author = friendShipQuotes[_currentIndex]["Author"]!;
    String text = '"$quote" - $author';

    Share.share(text);  // Use the share package to open the sharing dialog
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Friendship',
          style: kTextStyleSmall2,
        ),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10,),
          Flexible(
            flex: 2,
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width: 2
                )
              ),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                  bottom: 20,
                ),
                child: Column(
                  children: [
                 Text(
                   friendShipQuotes[_currentIndex]['Quotes']!,
                  style:kTextStyleLarge2,
                  textAlign: TextAlign.center,
                 ),
                    Text(
                      friendShipQuotes[_currentIndex]['Author']!,
                      textAlign: TextAlign.center,
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: (){
                            _shareQuote();
                          },
                          icon: const Icon(Icons.share),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white
                          ),

                        ),
                        IconButton(
                          onPressed: (){
                            if(favourite.contains(friendShipQuotes[_currentIndex]['Quotes'])){
                              favourite.remove(friendShipQuotes[_currentIndex]['Quotes']!);

                            }
                            else{
                              favourite.add(
                                  friendShipQuotes[_currentIndex]['Quotes']!);
                            }

                            setState(() {

                            });
                          },
                          icon:favourite.contains(friendShipQuotes[_currentIndex]['Quotes']!)
                              ?
                          const Icon(
                            Icons.favorite,
                          color: Colors.red,):
                             const Icon(
                               Icons.favorite_border_outlined,
                               color: Colors.black,
                             ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,

                          ),

                        ),
                        TextButton(
                            onPressed: (){
                              _nextQuote();
                              colorIndex +1;
                              setState(() {

                              });
                            },
                            child: const Text(
                                'Next',
                              style: kTextStyleLarge2,
                            ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Divider(
            thickness: 3,
            color: Colors.amber,
          ),
          const Text(
              'LIST OF FAVOURITE',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: favourite.length,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 10,
                    ),
                    child: Flexible(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 2,
                            color: Colors.black,

                          ),
                          color: Colors.amber,
                        ),

                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child:  Text(
                            favourite[index],
                            style: kTextStyleLarge2,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),

        ],
      ),
    );
  }
  List<Map<String,String>> friendShipQuotes=[
    {
      'Quotes':'A friend is someone who gives you total freedom to be yourself',
      'Author':'Jim Morrison',

    },
    {
      'Quotes':'A brother may not be a friend, but a friend will always be a brother.',
      'Author': 'Benjamin Franklin',
    },
    {
     'Quotes': 'I have never considered a difference of opinion in politics, in religion, '
          'in philosophy, as a cause for withdrawing from a friend.',
      'Author': 'Thomas Jefferson',
    },
    {
      'Quotes': 'A man must eat a peck of salt with his friend before he knows him.',
      'Author': 'Miguel de Cervantes',
    },
    {
      'Quotes':  'Friendship is the hardest thing in the world to explain. Its not something you learn in school,'
          ' But if you havent learned the meaning of friendship you really havent learned anything.',
      'Author':   'Muhammad Ali',
    },
  ];

}
