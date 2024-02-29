
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'theme_bloc_event.dart';
part 'theme_bloc_state.dart';
class ThemeBlocBloc extends Bloc<ThemeBlocEvent, ThemeBlocState> {
  ThemeBlocBloc() : super(const ThemeBlocState(swich: false)) {
    on<SwitchOn>(_switchOn);
    on<SwitchOff>(_switchOff);
  }
  void _switchOn(SwitchOn event, Emitter emit){
    emit(const SwitchInitial(sw: true));
  }
  void _switchOff(SwitchOff event, Emitter emit){
    emit(const SwitchInitial(sw: false));
  }
}
