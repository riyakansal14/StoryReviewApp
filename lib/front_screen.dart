import 'package:flutter/material.dart';
import 'package:review_app/story_page.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "  Read-O-Review",
          style: TextStyle(
            color: Colors.black,
            fontSize: 35,
            fontWeight: FontWeight.bold,
            fontFamily: 'PlayfairDisplay',
            letterSpacing: 2.0,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(1.4, 1.4),
                blurRadius: 3.0,
                color: Color.fromARGB(200, 0, 0, 0),
              ),
            ],
          ),
        ),
        elevation: 10,
        backgroundColor: Colors.amber,
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/bg_front.jpg"),
              fit: BoxFit.cover,
            )
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          children: [
            const SizedBox(height: 250,),
            ElevatedButton(
              child: const Text(
                "Let's Read..",
                style: TextStyle(
                  fontFamily: 'Acme',
                ),
              ),
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: (_) => const StoryPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.black.withOpacity(0.5),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  padding: const EdgeInsets.all(30),
                  textStyle: const TextStyle(
                    fontSize: 30,
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}
