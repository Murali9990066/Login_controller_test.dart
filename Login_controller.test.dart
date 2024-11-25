import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:e_medfile/features/auth/controllers/login_controller.dart';
import 'package:e_medfile/features/auth/services/auth_service.dart';

void main() {
  late LoginController loginController;
  late AuthService mockAuthService;

  setUp(() {
    mockAuthService = AuthService(); // Mock or use dependency injection
    loginController = LoginController(mockAuthService);
  });

  test('Validates email input correctly', () {
    loginController.emailOrPhoneController.value.text = 'test@example.com';
    loginController.onEmailOrPhoneFieldChanged();
    expect(loginController.isLoginButtonEnabled.value, true);
    expect(loginController.emailOrPhoneErrorText.value, null);
  });

  test('Validates phone input correctly', () {
    loginController.emailOrPhoneController.value.text = '9876543210';
    loginController.onEmailOrPhoneFieldChanged();
    expect(loginController.isLoginButtonEnabled.value, true);
    expect(loginController.emailOrPhoneErrorText.value, null);
  });

  test('Handles invalid input', () {
    loginController.emailOrPhoneController.value.text = 'invalid_input';
    loginController.onEmailOrPhoneFieldChanged();
    expect(loginController.isLoginButtonEnabled.value, false);
    expect(
      loginController.emailOrPhoneErrorText.value,
      'Please enter a valid email or phone number',
    );
  });
}


