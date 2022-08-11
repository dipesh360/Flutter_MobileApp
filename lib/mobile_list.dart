import 'package:flutter/material.dart';
import 'package:mobile_app/singleMobile.dart';
import 'package:mobile_app/widgets/mobileCard.dart';
import 'Services/api_service.dart';
import 'model/mobile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MobileList());
  }
}

class MobileList extends StatefulWidget {
  const MobileList({Key? key}) : super(key: key);

  @override
  State<MobileList> createState() => _MobileListState();
}

class _MobileListState extends State<MobileList> {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Mobile List"),
        ),
        body: FutureBuilder(
            future: apiService.getMobile(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Mobile>> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                          child: MobileCard(mobile: snapshot.data![index]),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    SingleMobile(mobile: snapshot.data![index]),
                              ),
                            );
                          });
                    });
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
    ;
  }
}
