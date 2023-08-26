import 'dart:convert';
import 'package:http/http.dart' as http;

class ArticleItem {
  int userId;
  String nickName;
  String avatarUrl;
  String createTime;
  String updateTime;
  String contentType;
  String title;
  String summary;
  List<String> gradeTags;
  String cover;

  ArticleItem({
    required this.userId,
    required this.nickName,
    required this.avatarUrl,
    required this.createTime,
    required this.updateTime,
    required this.contentType,
    required this.title,
    required this.summary,
    required this.gradeTags,
    required this.cover,
  });

  factory ArticleItem.fromJson(Map<String, dynamic> json) {
    return ArticleItem(
      userId: json['user_id'],
      nickName: json['nick_name'],
      avatarUrl: json['avatar_url'],
      createTime: json['create_time'],
      updateTime: json['update_time'],
      contentType: json['content_type'],
      title: json['title'],
      summary: json['summary'],
      gradeTags: List<String>.from(json['grade_tags']),
      cover: json['cover'],
    );
  }
}

/**
 * 网络获取数据
 */
Future<List<ArticleItem>> fetchArticleList() async {
  final response = await http.get(Uri.parse(
      'https://cdncs.101.com/v0.1/static/ppt_101_mobile/flutter/exam/20230804/studio_contents.json'));
  if (response.statusCode == 200) {
    Map<String, dynamic> jsonData = jsonDecode(utf8.decode(response.bodyBytes));
    return List<ArticleItem>.from(
        jsonData['items'].map((item) => ArticleItem.fromJson(item)));
  } else {
    throw Exception('Failed to fetch user');
  }
}
