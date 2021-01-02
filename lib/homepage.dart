import 'package:flip_coin/Models/outcomes.dart';
import 'package:flutter/material.dart';
import './services/result.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isloading = false;
  String display = "";
  String headurl =
      'https://cdn.pixabay.com/photo/2013/07/12/14/27/bronze-148228_960_720.png';
  String tailurl =
      'https://cdn.pixabay.com/photo/2013/07/12/14/27/franc-148229_960_720.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                child: Image(
                  // DecorationImage(
                  //   image: _image == null ? AssetImage('assets/images/avatar.jpg') : Image.file(_image),),
                  image: NetworkImage(
                      'https://media.istockphoto.com/photos/coin-toss-picture-id460171067?b=1&k=6&m=460171067&s=170667a&w=0&h=BbQ-YdeoOvEayM_QhF3qKuPK1xCm9i_xd-4Ionx4WB4='),
                  //fit: BoxFit.cover,
                ),
              ),
              Container(
                child: Text(_isloading ? 'Loading...' : display),
              ),
              display==""? Container(): Container(
                child: Image.asset( display == "Tails" ? "assets/images/tails.png" : "assets/images/heads.png"
                ),
              ),
              FloatingActionButton(
                onPressed: () async {
                  setState(() {
                    _isloading = true;
                  });
                  final Outcomes call = await calculate();
                  setState(() {
                    display = call.outcome;
                    _isloading = false;
                  });
                },
                child: Text('Flip'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
