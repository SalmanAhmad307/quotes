import 'package:flutter/material.dart';
import 'package:random_qoutes/constants.dart';
import 'package:share/share.dart';
class LoveQuotesScreen extends StatefulWidget {
  const LoveQuotesScreen({Key? key}) : super(key: key);

  @override
  State<LoveQuotesScreen> createState() => _LoveQuotesScreenState();
}

class _LoveQuotesScreenState extends State<LoveQuotesScreen> {
  int _currentIndex = 0;
  List<String> favourite=[];
  int colorIndex=0;

  void _nextQuote() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % loveQuotes.length;
    });
  }
  void _shareQuote() {
    String quote = loveQuotes[_currentIndex]["Quotes"]!;
    String author = loveQuotes[_currentIndex]["Author"]!;
    String text = '"$quote" - $author';

    Share.share(text);  // Use the share package to open the sharing dialog
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'LOVE QUOTES',
          style: kTextStyleLarge,
        ),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          const SizedBox(height: 30,),
          Flexible(
            flex: 3,
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
                      loveQuotes[_currentIndex]['Quotes']!,
                      style:kTextStyleLarge2,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      loveQuotes[_currentIndex]['Author']!,
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
                            if(favourite.contains(loveQuotes[_currentIndex]['Quotes'])){
                              favourite.remove(loveQuotes[_currentIndex]['Quotes']!);

                            }
                            else{
                              favourite.add(
                                  loveQuotes[_currentIndex]['Quotes']!);
                            }

                            setState(() {

                            });
                          },
                          icon:favourite.contains(loveQuotes[_currentIndex]['Quotes']!)
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
            thickness: 2,
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
  List<Map<String,String>> loveQuotes=[
    {
      'Quotes':'You say you love rain, but you open your umbrella. '
          'You say you love the sun, but you find a shadow spot. You say you love the wind,'
          ' but you close your windows. This is why I am afraid, you say that you love me too.',
      'Author':'William Shakespeare',

    },
    {
      'Quotes':'A dog is the only thing on earth that loves you more than he loves himself.',
      'Author': 'Josh Billings',
    },
    {
      'Quotes': 'All love is sweet, Given or returned. Common as light is love, And its familiar voice wearies not ever. '
          'They who inspire is most are fortunate, As I am now: but those who feel it most Are happier still.',
      'Author': 'Percy Bysshe Shelley',
    },
    {
      'Quotes': 'When a man finds a good woman and treats her the way she deserves to be treated it will change his Life. '
          'God favors a man that finds his wife and Loves her the way God Loves her',
      'Author': 'Tony Gaskins',
    },
    {
      'Quotes':  'Only from the heart Can you touch the sky.',
      'Author':   'Rumi',
    },
  ];

}
