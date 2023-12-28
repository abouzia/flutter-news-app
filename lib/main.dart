import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:flutter_news_app/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:flutter_news_app/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:flutter_news_app/injection_container.dart';

Future<void> main() async {
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (_) => sl()..add(const GetRemoteArticlesEvent()),
      child: const MaterialApp(
        home: DailyNews(),
      ),
    );
  }
}
