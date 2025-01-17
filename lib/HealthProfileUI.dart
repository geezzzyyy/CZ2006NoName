import 'package:data_connection/HealthDiseaseHandler.dart';
import 'package:data_connection/UserProfileHandler.dart';
import 'package:flutter/material.dart';
import 'expansionTile.dart';

void main() {
  runApp(UserProfile());
}

class DiseaseListScreen extends StatefulWidget {
  @override
  _DiseaseListScreenState createState() => _DiseaseListScreenState();
}

class _DiseaseListScreenState extends State<DiseaseListScreen> {
  HealthDiseaseHandler h = new HealthDiseaseHandler();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('List of diseases'),
        ),
        body: FutureBuilder<List>(
          future: h.getListOfObjects('/healthDisease'),
          initialData: [],
          builder: (context, snapshot) {
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (_, int position) {
                      final item = snapshot.data[position];
                      //get your item data here ...
                      return Card(
                        child: ListTile(
                          title: Text("Disease Name: " + item.getDiseaseName()),
                        ),
                      );
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  UserProfileHandler u = new UserProfileHandler();
  //Future<dynamic> user =UserProfileHandler().getObject('/userProfile/:604fd4812630973608ce2e35');
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Single user'),
        ),
        body: FutureBuilder(
          future: u.getObject('/userProfile/:604fd4812630973608ce2e35'),
          //initialData: [],
          builder: (context, snapshot) {
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (_, int position) {
                      final item = snapshot.data[position];
                      //get your item data here ...
                      return Card(
                        child: ListTile(
                          title:
                              Text("User ID: " + item.getUserID().toString()),
                        ),
                      );
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}
