part of 'local_article_bloc.dart';

sealed class LocalArticleState extends Equatable {
  final List<ArticleEntity>? articles;
  const LocalArticleState({this.articles});

  @override
  List<Object> get props => [articles!];
}

class LocalArticleLoading extends LocalArticleState {
  const LocalArticleLoading() : super();
}

class LocalArticleLoaded extends LocalArticleState {
  const LocalArticleLoaded(List<ArticleEntity> articles)
      : super(articles: articles);
}

class LocalArticleError extends LocalArticleState {
  const LocalArticleError() : super();
}
