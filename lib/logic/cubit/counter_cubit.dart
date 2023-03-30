import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class CounterCubit extends Cubit<int> with HydratedMixin {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);

  listen(void Function(Object? object) print) {}

  @override
  int? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson(int state) {
    addError(Exception("couldn't write to storage!"), StackTrace.current);
    throw UnimplementedError();
  }

  @override
  void onChange(Change<int> change) {
    print(change);
    super.onChange(change);
  }
}

Future<void> main(List<String> args) async {
  final cubit = CounterCubit();

  final streamSubscription = cubit.listen(
      print); //! this subscribes to the cubit state stream and prints the state values emitted by it

  cubit.increment();
  cubit.increment();
  cubit.increment();
  cubit.increment();

  await Future.delayed(Duration
      .zero); //! we use this to not cancel the subscription immediately down here

  await streamSubscription.cancel();
  await cubit.close();
}
