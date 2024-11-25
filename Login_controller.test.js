const LoginController = require('./loginController'); 
const AuthService = require('./authService'); 

describe('LoginController', () => {
  let loginController;
  let mockAuthService;

  beforeEach(() => {
    // Mock the AuthService
    mockAuthService = new AuthService();
    loginController = new LoginController(mockAuthService);
  });
  test('Validates phone input correctly', () => {
    loginController.emailOrPhoneController.text = '9876543210';
    loginController.onEmailOrPhoneFieldChanged();
    expect(loginController.isLoginButtonEnabled).toBe(true);
    expect(loginController.emailOrPhoneErrorText).toBe(null);
  });

  test('Handles invalid input', () => {
    loginController.emailOrPhoneController.text = 'invalid_input';
    loginController.onEmailOrPhoneFieldChanged();
    expect(loginController.isLoginButtonEnabled).toBe(false);
    expect(loginController.emailOrPhoneErrorText).toBe(
      'Please enter a valid phone number'
    );
  });
});
