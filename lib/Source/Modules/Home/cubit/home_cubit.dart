import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/todo_model.dart';
import '/Source/Utilities/Cubit_State/cubit_state.dart';

class HomeCubit extends Cubit<CubitState<List<TodoModel>>> {
  HomeCubit() : super(CubitState(status: CubitStatus.init));
}
