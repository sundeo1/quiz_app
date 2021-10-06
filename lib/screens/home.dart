import 'package:flutter/material.dart';
import 'package:heathyent/screens/dis.dart';
import '../services/services.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          child: Card(
            child: FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return Container(
                    child: Center(
                      child: Text('Loading...'),
                    ),
                  );
                } else
                  return ListView.builder(
                      padding: const EdgeInsets.all(10.0),
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        if (index.isOdd) return Divider();
                        //return Text(snapshot.data[index].fullname);
                        return ListTile(
                          title: GestureDetector(
                              child: Text(snapshot.data[index].fullname,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  )),
                              onTap: () => fetchData(
                                  snapshot.data[index].link.substring(57)),
                              onDoubleTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return HelpScreen();
                                }));
                              }),
                          subtitle: Text(
                            snapshot.data[index].summaryCustome,
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                          trailing: Image(
                              image: NetworkImage(
                                  snapshot.data[index].imageUrlSmall)),
                        );
                      });
              },
            ),
          ),
        ));
  }
}
