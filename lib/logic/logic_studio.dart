import 'dart:convert';
import 'package:http/http.dart' as http;

class StudioInfo {
  final String avatarUrl;
  final String name;
  final List<String> tagNames;
  final int numbersCount;
  final int resourceCount;
  final int readCount;
  final double yesterdayAdd;
  final int lastYearAdd;
  final String intro;

  StudioInfo({
    required this.avatarUrl,
    required this.name,
    required this.tagNames,
    required this.numbersCount,
    required this.resourceCount,
    required this.readCount,
    required this.yesterdayAdd,
    required this.lastYearAdd,
    required this.intro,
  });

  String getStudioName() {
    return name;
  }

  String getSubTagString() {
    StringBuffer sb = StringBuffer();
    for (var i = 0; i < tagNames.length; i++) {
      sb.write(tagNames[i].trim());
      if (i != tagNames.length - 1) {
        sb.write(" · ");
      }
    }
    return sb.toString().trim();
  }

  String getStudioSubTitle(var t1, var t2, var t3) {
    //成员 30 | 资源 90 | 浏览量 1564
    StringBuffer sb = StringBuffer();
    sb.write(t1);
    sb.write(" ");
    sb.write(numbersCount);
    sb.write("  |  ");

    sb.write(t2);
    sb.write(" ");
    sb.write(resourceCount);
    sb.write("  |  ");

    sb.write(t3);
    sb.write(" ");
    sb.write(readCount);

    return sb.toString();
  }

  factory StudioInfo.fromJson(Map<String, dynamic> json) {
    return StudioInfo(
      avatarUrl: json['avatar_url'],
      name: json['name'],
      tagNames: List<String>.from(json['tag_names']),
      numbersCount: json['numbers_count'],
      resourceCount: json['resource_count'],
      readCount: json['read_count'],
      yesterdayAdd: json['yesterday_add'].toDouble(),
      lastYearAdd: json['lastyear_add'],
      intro: json['intro'],
    );
  }
}

Future<StudioInfo> fetchStudioInfo() async {
  final response = await http.get(Uri.parse(
      'https://cdncs.101.com/v0.1/static/ppt_101_mobile/flutter/exam/20230804/studio_detail.json'));
  if (response.statusCode == 200) {
    final json = jsonDecode(utf8.decode(response.bodyBytes));
    return StudioInfo.fromJson(json);
  } else {
    throw Exception('Failed to fetch user');
  }
}
