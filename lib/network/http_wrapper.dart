import 'dart:convert';
import 'dart:io';

import 'package:SNP/helper/error/server_exception.dart';
import 'package:SNP/helper/localStorage/token_id.dart';
import 'package:SNP/helper/utils/loading_manager.dart';
import 'package:http/http.dart' as http;

class HttpWrapper {
  static Future<Map<String, String>> header() async {
    String? token = await getToken();
    if (token != null) {
      return {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      };
    }
    return {"Content-Type": "application/json"};
  }

  static Future<http.Response> getRequest(String url) async {
    try {
      final res = await http.get(Uri.parse(url), headers: await header());
      return res;
    } catch (e) {
      throw ServerException(e.toString());
    } finally {
      await LoadingManager.endLoading();
    }
  }

  static Future<http.Response> postRequest(String url, Object? body) async {
    try {
      final res = await http.post(Uri.parse(url),
          headers: await header(), body: jsonEncode(body));
      return res;
    } catch (e) {
      throw ServerException(e.toString());
    } finally {
      await LoadingManager.endLoading();
    }
  }

  static Future<http.Response> putRequest(String url) async {
    try {
      final res = await http.put(Uri.parse(url), headers: await header());
      return res;
    } catch (e) {
      throw ServerException(e.toString());
    } finally {
      await LoadingManager.endLoading();
    }
  }

  static Future<http.Response> deleteRequest(String url) async {
    try {
      final res = await http.delete(Uri.parse(url), headers: await header());
      return res;
    } catch (e) {
      throw ServerException(e.toString());
    } finally {
      await LoadingManager.endLoading();
    }
  }

  static Future<http.Response> patchRequest(String url) async {
    try {
      final res = await http.patch(Uri.parse(url), headers: await header());
      return res;
    } catch (e) {
      throw ServerException(e.toString());
    } finally {
      await LoadingManager.endLoading();
    }
  }

  static Future multipartRequest(String url, List<http.MultipartFile> files,
      {Map<String, String>? fields}) async {
    try {
      final request = await http.MultipartRequest('POST', Uri.parse(url));
      if (fields != null) {
        request.fields.addAll(fields);
      }
      if (files.length != 0) {
        request.files.addAll(files);
      }
      request.headers.addAll(await header());
      var res = await request.send();

      return res;
    } catch (e) {
      throw ServerException(e.toString());
    } finally {
      await LoadingManager.endLoading();
    }
  }
}
