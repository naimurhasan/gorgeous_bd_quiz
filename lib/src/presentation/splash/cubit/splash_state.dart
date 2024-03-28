part of 'splash_cubit.dart';

@freezed
abstract class SplashState with _$SplashState {
  const factory SplashState.initial() = Initial;
  const factory SplashState.loading() = Loading;
  const factory SplashState.loaded({required List<Question> questions}) = Loaded;
  const factory SplashState.error(String message) = Error;
}
