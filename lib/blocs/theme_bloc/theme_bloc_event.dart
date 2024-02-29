part of 'theme_bloc_bloc.dart';

sealed class ThemeBlocEvent extends Equatable {
  const ThemeBlocEvent();

  @override
  List<Object> get props => [];
}
class SwitchOn extends ThemeBlocEvent{}
class SwitchOff extends ThemeBlocEvent{}