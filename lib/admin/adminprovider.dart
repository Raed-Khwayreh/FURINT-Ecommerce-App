import 'dart:io';

import 'package:firstui_project/models/category_model.dart';
import 'package:firstui_project/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../Helpers/firestore_helper.dart';
import '../Helpers/storage_helper.dart';

class AdminProvider extends ChangeNotifier {
  AdminProvider() {
    getAllCategories();
  }

  File? imageFile;
  GlobalKey<FormState> categoryFormKey = GlobalKey<FormState>();
  pickImageForCategory() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      notifyListeners();
    }
  }

  clearImage() {
    imageFile = null;

    notifyListeners();
  }

  List<CateModel> allCategories = [];
  addNewCategory(String name) async {
    if (imageFile != null) {
      String imageUrl = await StorageHelper.storageHelper
          .uploadNewImage("cats_images", imageFile!);
      CateModel category =
          CateModel(image: imageUrl, name: name, isSelected: false);

      String? id =
          await FirestoreHelper.firestoreHelper.addNewCategory(category);

      if (id != null) {
        category.id = id;

        notifyListeners();
        imageFile = null;

        notifyListeners();
        allCategories
            .add(CateModel(image: imageUrl, name: name, isSelected: false));
        return true;
      }
    } else {
      return false;
    }
  }

  getAllCategories() async {
    allCategories = await FirestoreHelper.firestoreHelper.getAllCategories();
    notifyListeners();
  }

  // delete category
  deleteCategory(CateModel category) async {
    bool deleteSuccess =
        await FirestoreHelper.firestoreHelper.deleteCategoey(category.id!);
    if (deleteSuccess) {
      allCategories.remove(category);
      notifyListeners();
    }
  }

  updateCategory(CateModel category, String name) async {
    if (imageFile != null) {
      String imageUrl = await StorageHelper.storageHelper
          .uploadNewImage("cats_images", imageFile!);
      category.image = imageUrl;
    }
    CateModel newCategory = CateModel(
      id: category.id,
      image: category.image,
      name: name,
    );

    bool? isUpdated =
        await FirestoreHelper.firestoreHelper.updateCategory(newCategory);

    if (isUpdated != null && isUpdated) {
      int index = allCategories.indexOf(category);
      allCategories[index] = newCategory;
      imageFile = null;
      notifyListeners();
    }
  }

  TextEditingController productNameController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  GlobalKey<FormState> addProductKey = GlobalKey();
  List<ProductModel> allProducts = [];
  addNewProduct(String catId) async {
    if (imageFile != null) {
      if (addProductKey.currentState!.validate()) {
        String imageUrl = await StorageHelper.storageHelper
            .uploadNewImage("products_images", imageFile!);
        ProductModel product = ProductModel(
            image: imageUrl,
            name: productNameController.text,
            catId: catId,
            oldPrice: "",
            newPrice: "",
            category: "");

        String? id =
            await FirestoreHelper.firestoreHelper.addNewProduct(product);

        if (id != null) {
          product.id = id;
          allProducts.add(product);
          notifyListeners();
          productNameController.clear();
          productDescriptionController.clear();
          productPriceController.clear();
          imageFile = null;
          notifyListeners();
        }
      }
    } else {}
  }

  getAllProducts(String catId) async {
    allProducts = [];
    notifyListeners();
    List<ProductModel> products =
        await FirestoreHelper.firestoreHelper.getAllProducts(catId);

    allProducts = products;
    notifyListeners();
  }
}
