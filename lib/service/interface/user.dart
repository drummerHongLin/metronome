import 'package:flutter_metronome/service/model/user/user_data.dart';
import 'package:image_picker/image_picker.dart';

abstract class UserService {
  set token(String? token);
  Future<LoginResponse> login(LoginRequest loginRequest);
  Future<void> register(RegisterRequest request);
  Future<GetUserResponse> getUser(String token);
  Future<bool> verifyUser(String username);
  Future<void> changePassword(
    ChangePasswordRequest request,
    String username,
    String token,
  );
  Future<void> sendEmail(String username);
  Future<EmailVerifiedResponse> verifyEmail(
    String username,
    EmailVerifingRequest request,
  );
  Future<void> setAvatar(String username, String token, XFile file) ;
}
