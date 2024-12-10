import 'package:flutter/material.dart';
import 'package:untitled2/model/model.dart';
import 'package:untitled2/server/http_server.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var itms = [];
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    _apiList();
  }

  void _apiList() async {
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    try {
      if (response != null) {
        itms = Network.parerPostList(response);
        print(response);
      } else {
        print("HTTP da xato bor");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test APi"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10, right: 20, left: 20),
        child: ListView.builder(
            itemCount: itms.length,
            itemBuilder: (context, index) {
              return itmsHome(itms[index]);
            }),
      ),
    );
  }
  Widget itmsHome(Post post){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(post.title),
        Text(post.id.toString()),
        Image.network(post.image),
        Text(post.rating.toString())
      ],
    );
  }
}
