import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:portfolio/constants.dart';

class mongoDb {

  static connect() async {

    var db = await Db.create(MONGO_URL);
    await db.open();
    inspect(db);
    var status = db.serverStatus();
    // print(status);
    var collection = db.collection(COLLECTION_NAME);
    print(await collection.find().toList());


    var document = {
      "_id": ObjectId(),  // Create a new ObjectId
      "name": "John",
      // ... other fields
    };

    collection.insertOne(document);

    print(collection.findOne({"name":"John"}));

    print("done");

  }
}