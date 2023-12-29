import 'package:dio/dio.dart';
import 'package:flutter_news_app/features/daily_news/data/data_sources/local/app_database.dart';
import 'package:flutter_news_app/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:flutter_news_app/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:flutter_news_app/features/daily_news/domain/repository/article_repository.dart';
import 'package:flutter_news_app/features/daily_news/domain/usecases/get_article.dart';
import 'package:flutter_news_app/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:flutter_news_app/features/daily_news/domain/usecases/remove_article.dart';
import 'package:flutter_news_app/features/daily_news/domain/usecases/save_article.dart';
import 'package:flutter_news_app/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:flutter_news_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Database
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);

  //! Dio
  sl.registerSingleton<Dio>(Dio());

  //! Dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl(), sl()));

  //! Usecases
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));
  sl.registerSingleton<GetSavedArticleUseCase>(GetSavedArticleUseCase(sl()));
  sl.registerSingleton<SaveArticleUseCase>(SaveArticleUseCase(sl()));
  sl.registerSingleton<RemoveArticleUseCase>(RemoveArticleUseCase(sl()));

  //! Blocs
  sl.registerFactory(() => RemoteArticleBloc(sl()));
  sl.registerFactory(() => LocalArticleBloc(sl(), sl(), sl()));
}
