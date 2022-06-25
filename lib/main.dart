import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );

  }}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double rating = 0;

  Widget buildSheet() => DraggableScrollableSheet(
    initialChildSize: 1,
    minChildSize: 1,
    maxChildSize: 1,
    builder:(_, container) => Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20,),
          Text(
            'Вы хотите оставить ',
            style: TextStyle(fontSize: 22),
          ),
          Text(
            'комментарий',
            style: TextStyle(fontSize: 22),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Комментарий на книгу ',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          SizedBox(height: 15,),
          Container(
            width: 331,
            height: 433,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xffF0F0F6)
            ),
            child: TextFormField(
              decoration: const InputDecoration(

                hintText: 'оставить комментарий',

              ),
            ),
          ),
          SizedBox(height: 15,),
          RatingBar.builder(minRating: 1,
              itemSize: 46,
              itemBuilder: (context, _) =>
                  Icon(Icons.star, color: Colors.amber,),
              updateOnDrag: true,
              onRatingUpdate: (rating) =>
                  setState(() {
                    this.rating = rating;
                  })
          ),
          buildButton(
              text: 'Отправить',
              onClicked: () => showModalBottomSheet(
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20)
                      )
                  ),
                  context: context,
                  builder: (context) => HomePage())

          ),
        ],
      )
    ),
  );

  Widget buildButton({
  required String text,
    required VoidCallback onClicked,


}) => ElevatedButton(
    style: ElevatedButton.styleFrom(



      shape: StadiumBorder(),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15)
    ),

      onPressed: onClicked,
      child: Text(
    text,
    style: TextStyle(fontSize: 20),
  ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('dfdgdfsg'),
        centerTitle: true,

      ),
      body: Stack(
          children: [
          Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


    Text(
    'Taring: $rating',
    style: TextStyle(fontSize: 40),
    ),
    const SizedBox(height: 32,),
    RatingBar.builder(minRating: 1,
    itemSize: 46,
    itemBuilder: (context, _) =>
    Icon(Icons.star, color: Colors.amber,),
    updateOnDrag: true,
    onRatingUpdate: (rating) =>
    setState(() {
    this.rating = rating;
    })
    ),
           SizedBox(height: 30,) ,

            buildButton(
                text: 'оставить комментарий',

                onClicked: () => showModalBottomSheet(
                  isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20)
                      )
                    ),
                    context: context,
                    builder: (context) => buildSheet()),

            ),
    ],
    ),

    ]
    )
    );
  }


}