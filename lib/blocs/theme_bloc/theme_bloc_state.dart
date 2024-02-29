part of 'theme_bloc_bloc.dart';

 class ThemeBlocState extends Equatable {
  final bool swich;
  const ThemeBlocState({required this.swich});
  
  @override
  List<Object> get props => [swich];
}

final class SwitchInitial extends ThemeBlocState {
  const  SwitchInitial({required bool sw}) : super(swich: sw);
}
