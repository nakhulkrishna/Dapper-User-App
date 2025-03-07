// category_bloc.dart
import 'package:dapper_user/logic/category_selector/categorys_selector_event.dart';
import 'package:dapper_user/logic/category_selector/categorys_selector_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(const CategoryState(selectedIndex: 0)) {
    on<SelectCategoryEvent>((event, emit) {
      emit(CategoryState(selectedIndex: event.selectedIndex));
    });
  }
}
