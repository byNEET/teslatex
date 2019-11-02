import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:teslatex/latexhtml.dart';

import 'package:http/http.dart' as http;

main() async {
  runApp(FlutterTeX());
}

class FlutterTeX extends StatefulWidget {
  @override
  _FlutterTeXState createState() => _FlutterTeXState();
}

class _FlutterTeXState extends State<FlutterTeX> {
  String text = "Old Text (Press refresh)";
  String coeg="oke";
  String ini;

  TextEditingController textEditingController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController =TextEditingController(text: "");
    ini = r"""
  Jika 
$$\left(x+a\right)^n=\sum_{k=0}^{n}{\binom{n}{k}x^ka^{n-k}}$$
<b>maka ?</b><br>
ya sudahlah <br>
<img src="https://media.moddb.com/cache/images/members/1/408/407933/thumb_620x2000/Harirer_mecha_musume.jpg" width=200px> <br>

  """;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter TeX Example"),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  setState(() {
                    text = "New Text (After refresh)";
                  });
                }),
            IconButton(
                icon: Icon(Icons.save_alt),
                onPressed: ()async {
                 Apicoeg().getTex().then((onValue){
                   setState(() {
                    coeg=onValue; 
                   });
                 });
                })
          ],
        ),
        body: SingleChildScrollView(
                  child: Column(
            children: <Widget>[
              TextFormField(
                minLines: 3,
                maxLines: 5,
                controller: textEditingController,
              ),
              RaisedButton(child: Text('proses'),onPressed: (){setState(() {
               ini = textEditingController.text; 
              });},),
              Divider(),
              Text('text biase:'),
              Text(ini),
              Divider(),
              Text('flutter_tex:'),
              TeXView(teXHTML: ini,),
              // TeXView(
              //   teXHTML: text,
              //   onRenderFinished: (height) {
              //     print("Height is : $height");
              //   },
              //   onPageFinished: (string) {
              //     print("Page Loading finished");
              //   },
              // ),
              // TeXView(
              //   teXHTML: teXHTML,
              // ),
              // TeXView(
              //   teXHTML: coeg,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class Apicoeg{
var url = "https://kursusnya.firebaseio.com/latex.json";
Future<String> getTex()async{
  var asle = await http.get(url);
  var oke =jsonDecode(asle.body)  ;
  String lah = oke["tex"];
  print(asle.toString());

    String decodedText  = utf8.decode(base64.decode(lah));
	
  print('text: $decodedText');

  return decodedText;
}
}
// void unesekape(){
//   var uskup = new HtmlUnescape();
//   var text = uskup.convert(data)
// }
