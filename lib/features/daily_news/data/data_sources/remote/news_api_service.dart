import 'package:dio/dio.dart';
import 'package:flutter_news_app/core/constants/constants.dart';
import 'package:flutter_news_app/features/daily_news/data/models/article.dart';
import 'package:retrofit/http.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: kBaseUrl)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/top-headlines')
  Future<List<ArticleModel>> getTopHeadlines({
    @Query("country") String? country,
    @Query("category") String? category,
    @Query("apiKey") String? apiKey,
  });
}
