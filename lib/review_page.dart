import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const ReviewPage());
// }

class ReviewPage extends StatefulWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final _myController = TextEditingController();

  void _addFact() async {
    await FirebaseFirestore.instance
        .collection("StoryReviews")
        .add({'text': _myController.text});
    _myController.clear();
  }

  //static const routeName = '/open';


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text(
              "   Review",
              style: TextStyle(
                fontFamily: 'PlayfairDisplay',
                fontSize: 40,
                fontWeight: FontWeight.w600,
                color: Colors.black,
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
                  image: AssetImage("images/bg_1.jpg"),
                  fit: BoxFit.cover,
                )
            ),
            child: Column(
              children: [
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream:
                    FirebaseFirestore.instance.collection("StoryReviews").snapshots(),
                    builder:
                        (BuildContext ctx, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (ctx, pos) => InkWell(
                                onTap: () {
                                  //_deleteFact(snapshot.data!.docs.elementAt(pos).id);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10.0, top: 20.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.amber[50],
                                      border: Border.all(width: 2, color: Colors.amber),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      (snapshot.data!.docs.elementAt(pos).data()
                                      as Map)['text'],
                                      style: const TextStyle(
                                        //backgroundColor: Colors.yellow[100],
                                        fontSize: 20,
                                        fontFamily: 'Karla',
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                )
                            )
                        );
                      }
                      return const CircularProgressIndicator();
                    },
                  ),
                ),
                TextField(
                  style: const TextStyle(color: Colors.white),
                  controller: _myController,
                  decoration: const InputDecoration(
                    labelText: "Add your review here",
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      gapPadding: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
                _addFact();
                },
            child: const Icon(Icons.add),
            backgroundColor: Colors.amber,
          ),
        )
    );
  }
}
