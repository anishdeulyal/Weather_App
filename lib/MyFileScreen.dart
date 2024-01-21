import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyListScreen extends StatelessWidget {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firestore Data List'),
      ),
      /*
      for normal list
       */
      // body : FutureBuilder<QuerySnapshot>(
      //   future: firestore.collection('User').get(), // Replace with your collection name
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Center(child: CircularProgressIndicator());
      //     } else if (snapshot.hasError) {
      //       return Text('Error: ${snapshot.error}');
      //     } else {
      //       List<DocumentSnapshot> documents = snapshot.data!.docs;
      //
      //       return ListView.builder(
      //         itemCount: documents.length,
      //         itemBuilder: (context, index) {
      //           Map<String, dynamic> data = documents[index].data() as Map<String, dynamic>;
      //
      //           return ListTile(
      //             title: Text(data['name']), // Replace with your field name
      //             subtitle: Text(data['email']), // Replace with your field name
      //           );
      //         },
      //       );
      //     }
      //   },
      // )
      body: StreamBuilder<QuerySnapshot>(
        stream: firestore.collection('User').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<DocumentSnapshot> documents = snapshot.data!.docs;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Set the number of columns you want
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: documents.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> data =
                      documents[index].data() as Map<String, dynamic>;
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 2,
                    child: Column(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            child: Image.network(data["imageURL"],
                                fit: BoxFit.cover),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(data['name']),
                        )
                      ],
                    ),
                  );
                },
              ),
            );

            // return ListView.builder(
            //   itemCount: documents.length,
            //   itemBuilder: (context, index) {
            //     Map<String, dynamic> data = documents[index].data() as Map<String, dynamic>;
            //
            //     return Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Card(
            //         elevation: 2,
            //         child: ListTile(
            //           title: Text(data['name']), // Replace with your field name
            //           subtitle: Text(data['email']),
            //           trailing: Text(data["phone"]),// Replace with your field name
            //           leading: SizedBox(
            //             height: 100,
            //               width: 50,
            //               child: Image.network(data["imageURL"],fit: BoxFit.cover,)),
            //         ),
            //       ),
            //     );
            //   },
            // );
          }
        },
      ),
    );
  }
}
