import 'package:flutter/material.dart';
import 'package:news/pages/catagories.dart';
import 'package:news/services/api.dart';
import 'package:share_extend/share_extend.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

Api api = Api();

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      backgroundColor: Colors.grey[150],
      appBar: AppBar(
        backgroundColor: const Color(0xff02092A),
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text('كايرو اليوم',
                style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 0,
                    fontSize: 24,
                    fontWeight: FontWeight.bold)),
          )
        ],
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          border: Border.all(
                              width: 2.2, color: const Color(0xff02092A))),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Categories(category: 'business');
                            }));
                          },
                          child: const Text('business',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          border: Border.all(
                              width: 2.2, color: const Color(0xff02092A))),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Categories(category: 'entertainment');
                            }));
                          },
                          child: const Text('entertainment',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          border: Border.all(
                              width: 2.2, color: const Color(0xff02092A))),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Categories(category: 'health');
                            }));
                          },
                          child: const Text('health',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          border: Border.all(
                              width: 2.2, color: const Color(0xff02092A))),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Categories(category: 'science');
                            }));
                          },
                          child: const Text('science',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          border: Border.all(
                              width: 2.2, color: const Color(0xff02092A))),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Categories(category: 'sports');
                            }));
                          },
                          child: const Text('sports',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          border: Border.all(
                              width: 2.2, color: const Color(0xff02092A))),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Categories(category: 'technology');
                            }));
                          },
                          child: const Text('technology',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18))),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Top News',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                  future: api.GetGenralNews(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        width: 2,
                                        color: const Color(0xff02092A)),
                                    color: Colors.white),
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        launch(snapshot.data[index].url);
                                      },
                                      child: Container(
                                          width: double.infinity,
                                          height: 190,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                15,
                                              ),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                    snapshot
                                                        .data[index].urlToImage,
                                                  ),
                                                  fit: BoxFit.fill))),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        snapshot.data[index].title,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: IconButton(
                                          onPressed: () {
                                            ShareExtend.share(
                                                snapshot.data[index].url,
                                                'text');
                                          },
                                          icon: const Icon(Icons.share)),
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
