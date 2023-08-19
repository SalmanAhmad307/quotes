import 'package:flutter/material.dart';
import 'package:random_qoutes/constants.dart';
import 'package:share/share.dart';
class AttitudeScreen extends StatefulWidget {
  const AttitudeScreen({Key? key}) : super(key: key);

  @override
  State<AttitudeScreen> createState() => _AttitudeScreenState();
}

class _AttitudeScreenState extends State<AttitudeScreen> {
  int _currentIndex = 0;
  List<String> favourite=[];
  int colorIndex=0;

  void _nextQuote() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % attitudeQuotes.length;
    });
  }
  void _shareQuote() {
    String quote = attitudeQuotes[_currentIndex]["Quotes"]!;
    String author = attitudeQuotes[_currentIndex]["Author"]!;
    String text = '"$quote" - $author';

    Share.share(text);  // Use the share package to open the sharing dialog
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ATTITUDE QUOTES',
          style: kTextStyleSmall2,
        ),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          const SizedBox(height: 30,),
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
                      attitudeQuotes[_currentIndex]['Quotes']!,
                      style:kTextStyleLarge2,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      attitudeQuotes[_currentIndex]['Author']!,
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
                            if(favourite.contains(attitudeQuotes[_currentIndex]['Quotes'])){
                              favourite.remove(attitudeQuotes[_currentIndex]['Quotes']!);

                            }
                            else{
                              favourite.add(
                                  attitudeQuotes[_currentIndex]['Quotes']!);
                            }

                            setState(() {

                            });
                          },
                          icon:favourite.contains(attitudeQuotes[_currentIndex]['Quotes']!)
                              ?
                          const Icon(
                            Icons.favorite,
                            color: Colors.red,):
                          Icon(
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
                  return  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 10,
                    ),
                    child: Container(
                      height: 100,
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
                        child: favourite.isNotEmpty
                            ?  Text(
                          favourite[index],
                          style: kTextStyleLarge2,
                        ) :
                        const Text(
                          'No Favourite yet',
                          style: TextStyle(
                            color: Colors.black,
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
  List<Map<String,String>> attitudeQuotes=[
    {
      'Quotes':'Style is a reflection of your attitude and your personality.',
      'Author':'Shawn Ashmore',

    },
    {
      'Quotes':'All things are ready if our mind be so.',
      'Author': 'William Shakespeare',
    },
    {
      'Quotes': 'Leadership is practiced not so much in words as in attitude and in actions.',
      'Author': 'Harold S. Geneen',
    },
    {
      'Quotes': 'All Birds find shelter during a rain. But Eagle avoids rain by flying above the Clouds.'
          ' Problems are common, but attitude makes the difference!!!',
      'Author': 'Abdul Kalam',
    },
    {
      'Quotes':  'Coolness and absence of heat and haste indicate fine qualities.',
      'Author':   'Ralph Waldo Emerson',
    },
  ];

}
