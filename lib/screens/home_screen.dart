import 'package:flutter/material.dart';
import 'package:random_qoutes/constants.dart';
import 'package:random_qoutes/screens/attitude_quotes/attitude_quotes.dart';
import 'package:random_qoutes/screens/friendship_quotes/friendship.dart';
import 'package:random_qoutes/screens/love_quotes/love_quotes.dart';
import 'package:random_qoutes/screens/motivation_quotes/motivational_quotes.dart';
import 'package:random_qoutes/widgets/home_widget.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Select Category',
          style: kTextStyleLarge,
        ),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: GridView(
            gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                     crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
              ),
              children: [
                HomeItemWidget(
                    title: 'Friendship',
                   picture: 'assets/svg/friendship.svg',
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (ctx){
                        return const FriendShip();
                      }));
                    }
                ),
                HomeItemWidget(
                    title: 'Attitude',
                    picture: 'assets/svg/attitude.svg',
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (ctx){
                        return const AttitudeScreen();
                      }));
                    }
                ),
                HomeItemWidget(
                    title: 'Love',
                    picture: 'assets/svg/love_svg.svg',
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (ctx){
                        return LoveQuotesScreen();
                      }));

                    }
                ),
                HomeItemWidget(
                    title: 'Motivational',
                    picture: 'assets/svg/moti2.svg',
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (ctx)
                          =>const Motivational(),
                      ));
                    }
                ),
             ],
    ),
      ),
    );
  }
}
