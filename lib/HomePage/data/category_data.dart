import 'package:firstui_project/HomePage/models/category_model.dart';

List<CateModel> category = [
  CateModel(image: '', name: 'All', isSelected: true),
  CateModel(image: 'images/kit.png', name: 'Kitchen', isSelected: false),
  CateModel(image: 'images/room1.png', name: 'Living Room', isSelected: false),
  CateModel(image: 'images/bed.png', name: 'Bedroom', isSelected: false),
  CateModel(image: 'images/bath.png', name: 'Bathroom', isSelected: false),
  CateModel(image: 'images/fer.png', name: 'Furniture', isSelected: false),
  CateModel(
      image: 'images/appl.png',
      name: 'Electronics & Gadgets',
      isSelected: false),
  CateModel(image: 'images/ne.png', name: 'New Arrivals', isSelected: false),
  CateModel(image: 'images/bes.png', name: 'Best Deals', isSelected: false),
];
String cateSelect = '';
bool allSelect = true;
