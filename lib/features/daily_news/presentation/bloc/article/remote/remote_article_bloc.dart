import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/core/resources/data_state.dart';
import 'package:flutter_news_app/features/daily_news/domain/usecases/get_article.dart';
import 'package:flutter_news_app/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:flutter_news_app/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;

  RemoteArticleBloc(this._getArticleUseCase) : super(RemoteArticlesLoading()) {
    on<GetRemoteArticlesEvent>(onGetArticles);
  }

  void onGetArticles(
      GetRemoteArticlesEvent event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _getArticleUseCase();

    if (dataState is DataSuccess && dataState.data != null) {
      emit(
        RemoteArticlesDone(articles: dataState.data!),
      );
    }

    if (dataState is DataFailed) {
      emit(
        RemoteArticlesError(error: dataState.error!),
      );
    }
  }
}
