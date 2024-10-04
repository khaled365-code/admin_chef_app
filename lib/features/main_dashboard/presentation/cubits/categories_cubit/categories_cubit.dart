import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/categories_data_model.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());


  static CategoriesCubit get(context) => BlocProvider.of(context);

  List<CategoriesDataModel> categoriesList =
  [
    CategoriesDataModel(categoryName: 'Beef'),
    CategoriesDataModel(categoryName: 'Chicken'),
    CategoriesDataModel(categoryName: 'Fish'),
    CategoriesDataModel(categoryName: 'Seafood'),
    CategoriesDataModel(categoryName: 'Pork'),
    CategoriesDataModel(categoryName: 'Lamb'),
    CategoriesDataModel(categoryName: 'Vegetarian'),
    CategoriesDataModel(categoryName: 'Vegan'),
    CategoriesDataModel(categoryName: 'Gluten-free'),
    CategoriesDataModel(categoryName: 'Dairy-free'),
    CategoriesDataModel(categoryName: 'Breakfast'),
    CategoriesDataModel(categoryName: 'Lunch'),
    CategoriesDataModel(categoryName: 'Dinner'),
    CategoriesDataModel(categoryName: 'Appetizers'),
    CategoriesDataModel(categoryName: 'Salads'),
    CategoriesDataModel(categoryName: 'Soups'),
    CategoriesDataModel(categoryName: 'Sandwiches'),
    CategoriesDataModel(categoryName: 'Pasta'),
    CategoriesDataModel(categoryName: 'Pizza'),
    CategoriesDataModel(categoryName: 'Rice dishes'),
    CategoriesDataModel(categoryName: 'Stir-fries'),
    CategoriesDataModel(categoryName: 'Curries'),
    CategoriesDataModel(categoryName: 'Desserts'),
    CategoriesDataModel(categoryName: 'Baked goods'),
    CategoriesDataModel(categoryName: 'Snacks')
  ];


  int selectedCategoryIndex=0;

  updateSelectedCategoryIndex({required int currentIndex})
  {
    selectedCategoryIndex=currentIndex;
    emit(UpdateSelectedCategoryIndex());
  }



}
