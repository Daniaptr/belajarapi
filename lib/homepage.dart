import 'package:belajarapi/apifetch.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List datalist = [];

  void setupdata() async {
    ApiFetch fetch = new ApiFetch();
    await fetch.getapiData();
    setState(() {
      datalist = fetch.data_api;
    });
    if (datalist.isEmpty) {
      print('data kosong');
    } else {
      print('data ada');
    }
  }

  @override
  void initState() {
    setupdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Belajar API"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: ApiFetch().getapiData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error");
          } else {
            return ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => ListTile(
                      title: Text(
                        snapshot.data?[index]["title"],
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900),
                      ),
                    ));
          }
        },
      ),
    );
  }
}
