
import 'package:flutter_bloc/flutter_bloc.dart';

class SecoundCubit extends Cubit<int>{
  SecoundCubit() : super(0);
  
  void increment(){emit(state+1);}
}