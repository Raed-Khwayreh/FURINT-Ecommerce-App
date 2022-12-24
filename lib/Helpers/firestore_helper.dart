import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firstui_project/models/category_model.dart';
import 'package:firstui_project/models/product_model.dart';

import '../models/app_user.dart';

class FirestoreHelper {
  FirestoreHelper._();
  static FirestoreHelper firestoreHelper = FirestoreHelper._();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  //register
  addNewUser(AppUser appUser) async {
    firestore.collection('users').doc(appUser.id).set(appUser.toMap());
  }

  //login
  Future<AppUser> getUserFromFirestore(String id) async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await firestore.collection('users').doc(id).get();
    Map<String, dynamic>? data = documentSnapshot.data();
    AppUser appUser = AppUser.fromMap(data!);
    return appUser;
  }

  updateTheUser(AppUser appUser) async {
    await firestore.collection('users').doc(appUser.id).update(appUser.toMap());
  }

  //// admin methods
  Future<String?> addNewCategory(CateModel category) async {
    try {
      DocumentReference<Map<String, dynamic>> categoryDocument =
          await firestore.collection('categories').add(category.toMap());

      return categoryDocument.id;
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  Future<bool> deleteCategoey(String catId) async {
    try {
      await firestore.collection('categories').doc(catId).delete();
      return true;
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<List<CateModel>> getAllCategories() async {
    try {
      QuerySnapshot<Map<String, dynamic>> catsSnapshot =
          await firestore.collection('categories').get();
      List<CateModel> categories = catsSnapshot.docs.map((doc) {
        CateModel category = CateModel.fromMap(doc.data());
        category.id = doc.id;
        return category;
      }).toList();
      return categories;
    } on Exception catch (e) {
      log(e.toString());
    }
    return [];
  }

  Future<bool?> updateCategory(CateModel category) async {
    try {
      await firestore
          .collection('categories')
          .doc(category.id)
          .update(category.toMap());
      return true;
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  /// products functions
  Future<String?> addNewProduct(ProductModel product) async {
    try {
      // DocumentReference<Map<String, dynamic>> documentReference =
      //     await firestore
      //         .collection('categories')
      //         .doc(product.catId)
      //         .collection('products')
      //         .add(product.toMap());
      // return documentReference.id;
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  Future<List<ProductModel>?> getAllProducts(String catId) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
        .collection('categories')
        .doc(catId)
        .collection('products')
        .get();
    // return querySnapshot.docs.map((e) {
    //   ProductModel product = ProductModel.fromMap(e.data());
    //   product.id = e.id;
    //   return product;
    // }).toList();
  }

  Future<bool?> deleteProduct(ProductModel product) async {}
  Future<bool?> updateProduct(ProductModel product) async {}
}
