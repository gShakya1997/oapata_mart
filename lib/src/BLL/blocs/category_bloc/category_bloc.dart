import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oapata_mart/src/DataLayer/resources/repository.dart';
import 'package:oapata_mart/src/models/category.dart';
part 'category_state.dart';
part 'category_event.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  Repository repository;
  
  CategoryBloc({this.repository}) : super(CategoryInitial());

  CategoryState get initialState => CategoryInitial();

  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    if (event is AppStarted) {
      yield Loading();
      var categories = await repository.fetchAllCategory();
      yield LoadCategory(categories: categories);
    }
  }
}
