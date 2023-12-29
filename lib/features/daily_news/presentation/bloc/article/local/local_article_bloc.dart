import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/features/daily_news/domain/entities/article.dart';
import 'package:flutter_news_app/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:flutter_news_app/features/daily_news/domain/usecases/remove_article.dart';
import 'package:flutter_news_app/features/daily_news/domain/usecases/save_article.dart';

part 'local_article_event.dart';
part 'local_article_state.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent, LocalArticleState> {
  final GetSavedArticleUseCase _getSavedArticleUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;
  final SaveArticleUseCase _saveArticleUseCase;

  LocalArticleBloc(
    this._getSavedArticleUseCase,
    this._removeArticleUseCase,
    this._saveArticleUseCase,
  ) : super(
          const LocalArticleLoading(),
        ) {
    on<GetSavedArticlesEvent>(onGetSavedArticles);
    on<RemoveArticleEvent>(onRemoveArticle);
    on<SaveArticleEvent>(onSaveArticle);
  }

  void onGetSavedArticles(
    GetSavedArticlesEvent event,
    Emitter<LocalArticleState> emit,
  ) async {
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticleLoaded(articles));
  }

  void onRemoveArticle(
    RemoveArticleEvent event,
    Emitter<LocalArticleState> emit,
  ) async {
    await _removeArticleUseCase();
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticleLoaded(articles));
  }

  void onSaveArticle(
    SaveArticleEvent event,
    Emitter<LocalArticleState> emit,
  ) async {
    await _saveArticleUseCase();
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticleLoaded(articles));
  }
}
