part of 'category_bloc.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class Loading extends CategoryState {}

class LoadCategory extends CategoryState {
  final List<Category> categories;

  LoadCategory({this.categories});
}
