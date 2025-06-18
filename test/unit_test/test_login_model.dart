import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_app/login_view_model.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  setUpAll(() {
    registerFallbackValue(MockBuildContext());
  });

  group('LoginViewModel', () {
    late LoginViewModel viewModel;
    late MockBuildContext mockContext;

    setUp(() {
      mockContext = MockBuildContext();
      // Pass a dummy object since navigator is not used in login
      viewModel = LoginViewModel(navigator: Object() as dynamic);
    });

    test('should navigate to home when email is not empty', () async {
      when(
        () => Navigator.pushNamed(
          any(),
          any(),
          arguments: any(named: 'arguments'),
        ),
      ).thenAnswer((_) async => null);

      // Act
      viewModel.login(mockContext, 'test@email.com');

      // Assert
      final capturedArguments =
          verify(() => Navigator.pushNamed(mockContext, captureAny())).captured;
      expect(capturedArguments.length, 1);
      expect(capturedArguments[0], 'home');
    });

    test('should not navigate when email is empty', () async {
      // Act
      viewModel.login(mockContext, '');

      // Assert
      verifyNever(
        () => Navigator.pushNamed(
          any(),
          any(),
          arguments: any(named: 'arguments'),
        ),
      );
    });
  });
}
