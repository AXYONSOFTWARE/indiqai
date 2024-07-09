// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math';

Future returnRandom() async {
  // return from a list of products one product randomly every time it runs
// Assuming that the list of products is stored in a Firestore collection called "products"

  // Get a reference to the "products" collection
  CollectionReference productsRef =
      FirebaseFirestore.instance.collection('Produtos');

  // Get all the documents in the "products" collection
  QuerySnapshot querySnapshot = await productsRef.get();

  // Get the number of documents in the "products" collection
  int numProducts = querySnapshot.docs.length;

  // Generate a random index between 0 and numProducts-1
  int randomIndex = Random().nextInt(numProducts);

  // Get the document at the random index
  DocumentSnapshot randomProductDoc = querySnapshot.docs[randomIndex];

  // Return the reference to the random product document
  return randomProductDoc;
}
