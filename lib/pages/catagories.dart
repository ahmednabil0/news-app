import 'package:flutter/material.dart';
import 'package:news/services/api.dart';
import 'package:share_extend/share_extend.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class Categories extends StatefulWidget {
  Categories({Key? key, required this.category}) : super(key: key);
  String category;

  @override
  State<Categories> createState() => _CategoriesState();
}

Api api = Api();

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff02092A),
        elevation: 0,
        title: const Text(
          'News',
          style: TextStyle(
              letterSpacing: 1.2, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.info_outline))
        ],
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xff02092A),
                    border:
                        Border.all(width: 2.2, color: const Color(0xff02092A))),
                child: Text(
                  widget.category,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                  future: api.GetCatgoriesNews(widget.category),
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
                                                12,
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
