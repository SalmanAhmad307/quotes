import 'package:flutter/material.dart';
import 'package:random_qoutes/constants.dart';
import 'package:share/share.dart';
class Motivational extends StatefulWidget {
  const Motivational({Key? key}) : super(key: key);

  @override
  State<Motivational> createState() => _MotivationalState();
}

class _MotivationalState extends State<Motivational> {
  int _currentIndex = 0;
  List<String> favourite=[];
  int colorIndex=0;

  void _nextQuote() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % motivationalQuotes.length;
    });
  }
  void _shareQuote() {
    String quote = motivationalQuotes[_currentIndex]["Quotes"]!;
    String author = motivationalQuotes[_currentIndex]["Author"]!;
    String text = '"$quote" - $author';

    Share.share(text);  // Use the share package to open the sharing dialog
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Motivational',
          style: kTextStyleSmall2,
        ),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          const SizedBox(height: 30,),
          Flexible(
            flex: 3,
            child: Container(
              height: 300,
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
                      motivationalQuotes[_currentIndex]['Quotes']!,
                      style:kTextStyleLarge2,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      motivationalQuotes[_currentIndex]['Author']!,
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
                            if(favourite.contains(motivationalQuotes[_currentIndex]['Quotes'])){
                              favourite.remove(motivationalQuotes[_currentIndex]['Quotes']!);

                            }
                            else{
                              favourite.add(
                                  motivationalQuotes[_currentIndex]['Quotes']!);
                            }

                            setState(() {

                            });
                          },
                          icon:favourite.contains(motivationalQuotes[_currentIndex]['Quotes']!)
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
                          child: Text(
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
                          color: Colors.amber.shade300,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: favourite.isNotEmpty
                              ?Text(
                            favourite[index],
                            style: kTextStyleLarge3,
                          ) :
                          const Text(
                            'No Favourite yet',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),

                        ),
                      ),
                    ),
                  );
                }),
          )

        ],
      ),
    );
  }
  List<Map<String,String>> motivationalQuotes=[
    {
      'Quotes':'Life is like a steering wheel, it only takes '
          'one small move to change your entire direction.',
      'Author':'Kellie Elmore',

    },
    {
      'Quotes':'You make the world a better place by making yourself a better person.',
      'Author': 'Scott Sorrell',
    },
    {
      'Quotes': 'Changes are inevitable and not always controllable. What can be controlled is how you '
          'manage react to and work through the change process.',
      'Author': 'Kelly A. Morgan',
    },
    {
      'Quotes': 'There is no fire like passion no crime like hatred, no sorrow like separation, '
          'no sickness like hunger, and no joy like the joy of freedom.',
      'Author': 'Gautama Buddha',
    },
    {
      'Quotes':  '“I refuse to be limited and defined by my height, '
          'weight, skin colour, hair texture, circumstances and where I come from.”',
      'Author':   'Thabisile Ledwaba',
    },
  ];

}
