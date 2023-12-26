abstract class UseCase<Params, T> {
  Future<T> call(Params params);
}
