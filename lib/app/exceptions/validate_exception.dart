import 'app_exception.dart';

class ValidateException extends AppException {
  ValidateException([
    String message = '未通过数据验证。',
  ]) : super(message);
}
