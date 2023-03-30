import 'package:bloc_app/sign_in/bloc/sigin_state.dart';
import 'package:bloc_app/sign_in/bloc/signin_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('sigin bloc', () {
    SignInBloc signinbloc;
    setUp(() {
      signinbloc = SignInBloc();
    });
  });
  tearDown(() {
    SignInBloc().close();
  });
  test('the initial state for the siginstate is siginErrorstate(error)', () {
    expect(SignInBloc().state, SignInErrorState('Error'));
  });
  blocTest('the cubit should emit a siginErrorstate',
      build: () => SignInBloc(), act: null, expect: null);
}
