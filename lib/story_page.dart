import 'package:flutter/material.dart';
import 'package:review_app/review_page.dart';

class StoryPage extends StatelessWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Read",
          style: TextStyle(
            color: Colors.black,
            fontSize: 40,
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
              image: AssetImage("images/bg_read.jpg"),
              fit: BoxFit.cover,
            )
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.amber[50]?.withOpacity(0.5),
              ),
              width: 200,
              child: const Text(
                "Alex and his grandmother always had a unique bond with each other. He would spend hours with her, listening to his grandmother’s stories of a lifetime. She once told him that she had met his grandfather a long time after graduating from high school. This was also the reason why she was never asked out to go to prom. When the day of Alex’s prom had arrived, his grandmother was so excited for him. She had watched him save money for months so that he could afford a tuxedo and even a limousine. His grandmother eagerly waited to find out who Alex would be taking to the prom. But to her great surprise, he told her that he would be taking her to prom. He told her that every woman deserves to go to prom, no matter if they are 18 or 80.",
                style: TextStyle(
                  fontFamily: 'PatrickHand',
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 50,),
            ElevatedButton(
              child: const Text(
                "Write your review",
                style: TextStyle(
                  fontFamily: 'Acme',
                ),
              ),
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: (_) => const ReviewPage(),
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
