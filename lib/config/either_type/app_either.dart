import 'package:fpdart/fpdart.dart';

typedef EitherType<T> = Either<String, T>;
typedef FutureEitherType<T> = Future<EitherType<T>>;
