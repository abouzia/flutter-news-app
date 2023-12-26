import 'package:flutter_news_app/core/resources/data_state.dart';
import 'package:flutter_news_app/core/usecases/usecase.dart';
import 'package:flutter_news_app/features/daily_news/domain/entities/article.dart';
import 'package:flutter_news_app/features/daily_news/domain/repository/article_repository.dart';

class GetArticleUseCase
    implements UseCase<DataState<List<ArticleEntitiy>>, void> {
  final ArticleRepository articleRepository;

  GetArticleUseCase({required this.articleRepository});

  @override
  Future<DataState<List<ArticleEntitiy>>> call(void params) {
    return articleRepository.getArticles();
  }
}
