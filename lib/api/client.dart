import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

Logger logger = Logger();

Dio client() {
  Dio dio =  Dio();

  //String restAPIKey = "515EEB43-BF5B-415C-8DFE-FB1D9FE74A21";

  // dio.options.headers["Authorization"] = "some auth key";

  dio.options.baseUrl =
      "https://ox3p9xgin3.execute-api.eu-north-1.amazonaws.com/dev/";

  dio.options.connectTimeout = 100000;
  dio.interceptors.add(
    InterceptorsWrapper(
        // onRequest: (RequestOptions options) => requestInterceptor(options),
        // onResponse: (Response response) => responseInterceptor(response),
        // onError: (DioError error) => errorInterceptor(error)),

        onRequest: (RequestOptions options, requestInterceptor){return requestInterceptor.next(options);},
        onResponse: (Response response,responseInterceptor) {return responseInterceptor.next(response);},
        onError: (DioError error,errorInterceptor) {return errorInterceptor.next(error);}),
  );

  return dio;
}
// vistiek neveikia
requestInterceptor(RequestOptions options) {
  logger.d(options);
  return options;
}

responseInterceptor(Response response) {
  logger.d(response.data);
  return response;
}

errorInterceptor(DioError error) {
  logger.d(error.error);
  logger.d(error.message);
  return error;
}

//API configuration