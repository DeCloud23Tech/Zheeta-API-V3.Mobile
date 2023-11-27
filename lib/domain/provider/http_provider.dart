import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart' as dio;
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:zheeta/core/utils/api.dart';
import 'package:zheeta/presentation/widgets/snackbar.dart';


bool live = false;


class HttpProvider {
  static var sessionManager = SessionManager();

  static List successCodes = [200, 201, 202, 203, 210];

  static String authToken = "";

  static dio.Response serverError() {
    notify('error', 'Server error');
    return dio.Response(
      data: {'hasError': true},
      statusCode: 500,
      requestOptions: dio.RequestOptions(),
    );
  }

  static dio.Response requestTimedOut() {
    notify('error', 'Request timed out');
    return dio.Response(
      data: {'hasError': true},
      statusCode: 500,
      requestOptions: dio.RequestOptions(),
    );
  }

  static Future post(
    endpoint,
    Map payload, {
    Map<String, String>? header,
    bool handleError = true,
    Function()? onCallBack,
  }) async {
    String? data = await sessionManager.get('token');

    if (data != null) {
      authToken = data.toString();
    }

    try {
      dio.Response response = await Api().dio.post(
            '/$endpoint',
            data: jsonEncode(payload),
            options: dio.Options(
              headers: header ??
                  {
                    'Authorization': authToken,
                    'Content-Type': 'application/json',
                    'v': '1',
                  },
            ),
          );

      if (handleError) {
        await _handleHttpResponse(response, callBack: onCallBack);
      }

      return response;
    } on TimeoutException {
      if (handleError) {
        return requestTimedOut();
      } else {}
    } catch (error) {
      notify('error', 'Server error');
      return serverError();
    }
  }

  static Future put(endpoint, Map payload,
      {Map<String, String>? header,
      bool handleError = true,
      Function()? onCallBack}) async {
    String? data = await sessionManager.get('token');
    String authToken = "";

    if (data != null) {
      authToken = data.toString();
    }

    try {
      dio.Response response = await Api().dio.put(
            '/$endpoint',
            data: jsonEncode(payload),
            options: dio.Options(
              headers: header ??
                  {
                    'Authorization': authToken,
                    'Content-Type': 'application/json',
                    'v': '1',
                  },
            ),
          );
      if (handleError) {
        await _handleHttpResponse(response, callBack: onCallBack);
      }

      return response;
    } on TimeoutException {
      if (handleError) {
        // NotificationService.errorSheet(Get.context!, "Connection Timeout", callBack: onCallBack, btnText: "Retry");
        notify('error', 'Request timed out');
        return requestTimedOut();
      } else {}
    } catch (error) {
      notify('error', 'Server error');
      return serverError();
    }
  }

  static Future delete(endpoint, Map payload,
      {Map<String, String>? header,
      bool handleError = true,
      Function()? onCallBack}) async {
    String authToken = "";
    String? data = await sessionManager.get('token');

    if (data != null) {
      authToken = data.toString();
    }

    try {
      dio.Response response = await Api()
          .dio
          .delete('/$endpoint',
              data: jsonEncode(payload),
              options: dio.Options(
                headers: header ??
                    {
                      'Authorization': authToken,
                      'Content-Type': 'application/json',
                      'v': '1',
                    },
              ))
          .timeout(const Duration(minutes: 2));
      if (handleError) {
        await _handleHttpResponse(response, callBack: onCallBack);
      }

      return response;
    } on TimeoutException {
      if (handleError) {
        return requestTimedOut();
      } else {}
    } catch (error) {
      return serverError();
    }
  }

  static Future patch(endpoint, Map payload,
      {Map<String, String>? header,
      bool handleError = true,
      Function()? onCallBack}) async {
    String authToken = "";
    String? data = await sessionManager.get('token');
    if (data != null) {
      authToken = data.toString();
    }

    try {
      dio.Response response = await Api()
          .dio
          .patch('/$endpoint',
              data: jsonEncode(payload),
              options: dio.Options(
                headers: header ??
                    {
                      'Authorization': authToken,
                      'Content-Type': 'application/json',
                      'v': '1',
                    },
              ))
          .timeout(const Duration(minutes: 2));
      if (handleError) {
        await _handleHttpResponse(response, callBack: onCallBack);
      }

      return response;
    } on TimeoutException {
      if (handleError) {
        return requestTimedOut();
      } else {}
    } catch (error) {
      return serverError();
    }
  }

  // for get-images request
  static Future get(endpoint,
      {Map<String, String>? header,
      bool handleError = false,
      bool external = false,
      Function()? onCallBack}) async {
    if (external) {
      //
    }

    String authToken = "";
    String? data = await sessionManager.get('token');

    if (data != null) {
      authToken = data.toString();
    }

    try {
      dio.Response response = await Api()
          .dio
          .get('/$endpoint',
              options: dio.Options(
                headers: header ??
                    {
                      'Authorization': authToken,
                      'Content-Type': 'application/json',
                      'v': '1',
                    },
              ))
          .timeout(const Duration(minutes: 2));

      if (handleError) {
        await _handleHttpResponse(response, callBack: onCallBack);
      }

      return response;
    } on TimeoutException {
      if (handleError) {
        return requestTimedOut();
      } else {}
    } catch (error) {
      return serverError();
    }
  }

  // // for file related
  // static Future multipartRequest({
  //   required String url,
  //   required Map payload,
  //   required File? image,
  //   Map<String, String>? header,
  //   File? music,
  //   String? imageLabel,
  //   String? multipleImagesLabel,
  //   String? musicLabel,
  //   useBase1 = true,
  //   Map<String, File?>? images,
  //   String method = 'POST',
  // }) async {
  //
  //
  //   String token = "";
  //   String? data = await sessionManager.get('token');
  //
  //   if (data != null) {
  //     token = data.toString();
  //   }
  //
  //   var request = Api().dio.m(method, Uri.parse("$baseUrl/$url"));
  //
  //   payload.forEach((key, value) {
  //     request.fields[key] = value.toString();
  //   });
  //   if (image != null) {
  //     request.files.add(
  //         await http.MultipartFile.fromPath(imageLabel.toString(), image.path));
  //   }
  //
  //   if (music != null) {
  //     request.files.add(
  //         await http.MultipartFile.fromPath(musicLabel.toString(), music.path));
  //   }
  //
  //   if (images != null) {
  //     images.forEach((label, image) async {
  //       if (image != null) {
  //         request.files.add(await http.MultipartFile.fromPath(
  //             multipleImagesLabel.toString(), image.path));
  //       }
  //     });
  //   }
  //
  //   request.headers.addAll(header ??
  //       {
  //         "Authorization": token,
  //       });
  //
  //   try {
  //     http.StreamedResponse response = await request.send();
  //     String resp = await response.stream.bytesToString();
  //     var body = jsonDecode(resp);
  //
  //     _handleHttpResponse(http.Response(jsonEncode(body), response.statusCode));
  //
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       if (body['hasError'] == true) {
  //         NotificationService.showError(body['title']);
  //         return Future.value({"hasError": true, "message": body['title']});
  //       }
  //       return Future.value(body);
  //     }
  //
  //     return Future.value({"hasError": true, "message": "Connection Error"});
  //   } catch (e) {
  //     NotificationService.showError('Bad request');
  //   }
  // }

  // handles http response
  static Future _handleHttpResponse(dio.Response response,
      {Function()? callBack}) async {
    String responseMessage = '';

    if (response.statusCode != 200 &&
        response.statusCode != 201 &&
        response.statusCode != 400 &&
        response.statusCode != 401) {
      responseMessage = 'Unknown error occurred';
    } else if (response.statusCode == 401) {
      Map body = jsonDecode(response.data);
      responseMessage = body['message'];
    } else {
      try {
        Map body = jsonDecode(response.data);

        if (response.statusCode == 400) {
          // bad request
          if (body.containsKey('errors')) {
            body['errors'].forEach((key, value) {
              responseMessage = value[0];
            });
          } else {
            responseMessage = body['message'];
          }
        }
        if (body.containsKey('hasError')) {
          if (body['hasError']) {
            if (body.containsKey('title')) {
              responseMessage = body['title'];
            } else {
              responseMessage = body['message'];
            }
          } else if (body.containsKey('title')) {
            responseMessage = body['title'];
          } else if (body.containsKey('message')) {
            responseMessage = body['message'];
          }
        } else if (body['data'] == null) {
          // responseMessage = body['responseMessage'];
        }
      } catch (e) {
        //
      }
    }

    if (responseMessage.isNotEmpty) {
      notify('error', responseMessage);
    } else {
      try {
        Map body = jsonDecode(response.data);
        if (!body['status']) {
          notify('error', body['message']);
        }
      } catch (e) {
        //
      }
    }
  }
}
