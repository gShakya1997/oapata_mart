import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oapata_mart/src/DataLayer/models/category.dart';
import 'package:oapata_mart/src/DataLayer/resources/category_repository.dart';
part 'category_state.dart';
part 'category_event.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository categoryRepository;

  CategoryBloc({@required this.categoryRepository}) : super(CategoryInitial());

  CategoryState get initialState => CategoryInitial();

  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    if (event is AppStarted) {
      yield CategoryLoading();
      var categories = await categoryRepository.fetchAllCategories();
      yield CategoryLoaded(categories: categories);
    }
  }
}
