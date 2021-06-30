class ResponseCode {
  static const SUCCESS = 200;
  static const FAILED = 500;
  static const NOT_FOUND = 404;
  static const UNAUTHORIZED = 401;
  static const FORBIDDEN = 403;
  static const EXPECTATION_FAILED = 417;

  // Error
  static const SERVER_UNKNOWN_ERROR = 1000;

  static const EMAIL_PASSWORD_INCORRECT = 1001;
  static const SOCIAL_PASSWORD_INCORRECT = 1002;

  static const PHONE_NUMBER_PASSWORD_INCORRECT = 1003;

  static const PASSWORD_IS_NULL_BLANK = 1004;
  static const EMAIL_IS_NULL_BLANK = 1005;

  static const EMAIL_IS_EXISTS = 1006;
  static const SOCIAL_IS_EXISTS = 1007;

  static const PHONE_NUMBER_IS_NULL_BLANK = 1008;
  static const PHONE_NUMBER_IS_EXISTS = 1009;

  static const STAFF_CODE_IS_NULL_BLANK = 1010;

  static const FILE_TOO_LARGE = 1011;

  static const FILE_UPLOAD_FAIL = 1012;

  static const UNSUPPORTED_MEDIA_TYPE = 1013;

  static const UNSUPPORTED_DEVICE = 1014;

  static const PHONE_NUMBER_WRONG_FORMAT = 1015;

  static const EMAIL_WRONG_FORMAT = 1016;

  static const USER_NOT_FOUND = 1017;

  static const WARNING_DATA_FORMAT = 1018;

  static const VERIFY_CODE_EXPIRE = 1019;

  static const VERIFY_CODE_INCORRECT = 1020;

  static const WRONG_TOO_MANY_TIME = 1021;
}

extension messageResponse on int {

  String? get message => messages[this];

  static final messages = <int, String>{
    ResponseCode.SUCCESS: 'Success.',
    ResponseCode.FAILED: 'Failure.',
    ResponseCode.NOT_FOUND: 'Server is busy. Please come back later.',
    ResponseCode.UNAUTHORIZED: 'Need to login.',
    ResponseCode.FORBIDDEN: 'Need to login.',
    ResponseCode.EXPECTATION_FAILED: 'Expectation failed.',

    // Error
    ResponseCode.SERVER_UNKNOWN_ERROR: 'An unknown error.',

    ResponseCode.EMAIL_PASSWORD_INCORRECT: 'Email or password is incorrect.',
    ResponseCode.SOCIAL_PASSWORD_INCORRECT: 'The social media account is incorrect.',

    ResponseCode.PHONE_NUMBER_PASSWORD_INCORRECT: 'The phone number and password are incorrect.',

    ResponseCode.PASSWORD_IS_NULL_BLANK: 'Password can not be blank.',
    ResponseCode.EMAIL_IS_NULL_BLANK: 'Email cannot be blank.',

    ResponseCode.EMAIL_IS_EXISTS: 'Email already exists.',
    ResponseCode.SOCIAL_IS_EXISTS: 'Social media accounts already exist.',

    ResponseCode.PHONE_NUMBER_IS_NULL_BLANK: 'Phone number can not be left blank.',
    ResponseCode.PHONE_NUMBER_IS_EXISTS: 'Phone number already exists.',

    ResponseCode.STAFF_CODE_IS_NULL_BLANK: 'Employee ID cannot be left blank.',

    ResponseCode.FILE_TOO_LARGE: 'File size is too large.',

    ResponseCode.FILE_UPLOAD_FAIL: 'File upload failed.',

    ResponseCode.UNSUPPORTED_MEDIA_TYPE: 'This file type is not supported.',

    ResponseCode.UNSUPPORTED_DEVICE: 'The device is not supported.',

    ResponseCode.PHONE_NUMBER_WRONG_FORMAT: 'The phone number format is incorrect.',

    ResponseCode.EMAIL_WRONG_FORMAT: 'The email format is incorrect.',

    ResponseCode.USER_NOT_FOUND: 'This user was not found.',

    ResponseCode.WARNING_DATA_FORMAT: 'The data is incorrect.',

    ResponseCode.VERIFY_CODE_EXPIRE: 'Expired code.',

    ResponseCode.VERIFY_CODE_INCORRECT: 'The code is incorrect.',

    ResponseCode.WRONG_TOO_MANY_TIME: 'Get the wrong number of times allowed.',
  };
}
