import 'package:flutter_news_app/core/resources/data_state.dart';
import 'package:flutter_news_app/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  // API calls
  Future<DataState<List<ArticleEntity>>> getArticles();

  // Database calls
  Future<List<ArticleEntity>> getSavedArticles();

  Future<void> saveArticle(ArticleEntity article);

  Future<void> deleteArticle(ArticleEntity article);
}
