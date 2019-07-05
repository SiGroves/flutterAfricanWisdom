import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'African Wisdom',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'African Wisdom'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _selectMusing=0;
  Random rnd;
  int _min = 0;
  var fruits = [
    'The axe forgets, the tree remembers',
    'He who thinks he is leading and has no one following him is only taking a walk',
    'Hunt in every forest for there is wisdom in them all',
    'A man who uses force is afraid of reasoning',
    'The African race is a rubber ball. The harder you dash it to the ground, the higher it will rise',
    'He who is destined for power does not have to fight for it',
    "A chick that will grow into a cock can be spotted the very day it hatches",
    "A child's fingers are not scalded by a piece of hot yam which his mother puts into his palm",
    "Do not look where you fell, but where you slipped",
    "It takes a whole village to raise a child",
    "The lizard that jumped from the high iroko tree to the ground said he would praise himself if no one else did",
    "The mouth which eats does not talk",
    "The sun will shine on those who stand before it shines on those who kneel under them",
    "Those whose palm-kernels were cracked for them by a benevolent spirit should not forget to be humble",
    "You must judge a man by the work of his hands",
    "By the time the fool has learned the game, the players have dispersed",
    "Do not call the forest that shelters you a jungle",
    "Even though the old man is strong and hearty, he will not live forever",
    "Fire and gunpowder do not sleep together",
    "Hunger is felt by a slave and hunger is felt by a king",
    "If you are in hiding, don't light a fire",
    "It is no shame at all to work for money",
    "It is the calm and silent water that drowns a man",
    "No one tests the depth of a river with both feet",
    "One falsehood spoils a thousand truths",
    "The moon moves slowly, but it crosses the town",
    "There is no medicine to cure hatred",
    "When a king has good counselors, his reign is peaceful",
    "When a man is wealthy, he may wear an old cloth",
    "When a woman is hungry, she says, 'Roast something for the children that they might eat.' ",
    "When the fool is told a proverb, its meaning has to be explained to him",
    "When you follow in the path of your father, you learn to walk like him",
    "A bird will always use another bird's feathers to feather its own nest",
    "He that digs a grave for his enemy, may be digging it for himself",
    "A person is a person because of other persons",
    "If you don't stand for something, you will fall for anything",
    "You overcame the rain, but what about the dew?",
    "As soon as you experience hunger, why do you always want to eat?",
    "Water follows the slope",
    "If the day of harvesting or eating yams is the same as the day of planting yams, even goats will not be allowed to eat the yam peels",
    "Big fish are caught with big fish hooks",
    "If the young are not initiated into the village, they will burn it down just to feel its warmth",
    "When deeds speak, words are nothing",
    "Never make the mistake of thinking it is easy to be capable. Overt Competency may be your greatest struggle in life",
    "To love someone who does not love you is like shaking a tree to make the dew drops fall",
    "If you can't resolve your problems in peace, you can't solve war",
    "I pointed out to you the stars and all you saw was my fingertip",
    "A beautiful woman is not without defects",
    "If you want to go fast, go alone. If you want to go far, go together",
    "Songs learnt from outside sources are not used at a dance for long",
    "Do not follow the path. Go where there is no path to begin the trail",
    "The habit of thinking is the habit of gaining strength",
    "Wealth, if you use it, comes to an end; learning, if you use it, increases",
    "The pillar of the world is hope",
    "Until lions write their own history, the tale of the hunt will always glorify the hunter",
    "Tomorrow belongs to the people who prepare for it today",
    "If the chicken attacks you in the morning, RUN first because it may have grown teeth overnight",
    "I always get confused when there’s a proverb sourced as an African proverb. There’s hundreds of different ethno-cultural groupings on the continent with varied languages and histories of interactions with each other and with non-African groups. It’s not like there’s some sort of single wise old person somewhere who spouts all the proverbs for all Africans",
    "He who learns, teaches",
    "If you close your eyes to facts, you will learn through accidents",
    "Every morning in Africa a gazelle awakens knowing it must today run faster than the fastest lion or it will be eaten. Every morning a lion awakens knowing it must outrun the slowest gazelle or it will starve. It matters not whether you are a gazelle or a lion, when the sun rises you had better be running",
    "The truth is like a baobab tree, you cannot embrace it with one pair of arms",
    "Moonlight does not enable one to see to gather firewood",
    "What suffices for a small project won't do for an enormous project",
    "The salt we have for seasoning the chicken is insufficient, and you go and kill a goat!",
    "The foolish little antelope cut firewood for the leopard",
    "The small spotted wild cat mistook the leopard for a relative!",
    "An antelope wouldn't be strong enough to carry the tusks an elephant bears",
    "One does not set out for a hunting camp with nothing but bananas",
    "As the ocimbamba seeks the low lying tree so friends gather to the friendly person",
    "What the guest would like is what the host is ashamed to offer as not being good enough and the guest is disappointed",
    "If heedless of warning it is you who will suffer, not I",
    "It makes a difference whose ox is gored",
    "Burning charcoal always turns to ashes",
    "People working on the slope of a mountain do not look at the buttocks of one another",
    "If two selfish young men sit next to a pot of water, the water spills out on the ground",
    "If an opportunity is not taken when it comes, it passes away",
    "Little palm tree, stop crying, your child is the tall palm tree",
    "If the young palm tree wants to stay alive, it grows next to the odum tree",
    "One palm nut cannot be peeled twice",
    "Even though the sound of the horn is not pleasant, it is still blown by a man's mouth",
    "You make a new arrow by comparing it to an old one",
    "The witch is going! The witch is going! but if you are not a witch you don't turn around to look"
                ];
  int _max = 8;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
      rnd = new Random();
      _max=fruits.length;
      _selectMusing = _min + rnd.nextInt(_max - _min);
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: <Widget>[

            Image.asset(
              'images/eyeOfAfrica.png',
              fit: BoxFit.fitWidth,
            ),
            AutoSizeText(
              fruits[_selectMusing],
              maxLines: 5,
              style: Theme.of(context).textTheme.display1,
            ),
            Text(
              'Wisdom $_selectMusing of ' + fruits.length.toString(),
              style: Theme.of(context).textTheme.body2,
            ),
            Text(
              'You have asked for wisdom many times: $_counter',
              style: Theme.of(context).textTheme.body1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'One More',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
