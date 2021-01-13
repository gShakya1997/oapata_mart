part of 'category_bloc.dart';

@immutable
abstract class CategoryState {
  const CategoryState();
}

class CategoryInitial extends CategoryState {
  const CategoryInitial();
}

class CategoryLoading extends CategoryState {
  const CategoryLoading();
}

class CategoryLoaded extends CategoryState {
  final List<Category> categories;

  const CategoryLoaded({this.categories});

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is CategoryLoaded && o.categories == categories;
  }

  @override
  int get hashCode => categories.hashCode;
}

class CategoryError extends CategoryState {
  final String message;

  const CategoryError({this.message});

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is CategoryError &&
      o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
