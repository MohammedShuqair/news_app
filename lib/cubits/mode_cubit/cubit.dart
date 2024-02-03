import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/mode_cubit/state.dart';
import 'package:news_app/datasources/shared_helper/shared_helper.dart';

class ModeCubit extends Cubit<ModeStates> {
  ModeCubit(Brightness brightness) : super(ModeInitialState()) {
    ThemeMode? localMode = SharedHelper().getMode();
    if (localMode == null) {
      if (brightness == Brightness.dark) {
        mode = ThemeMode.dark;
      } else {
        mode = ThemeMode.light;
      }
    } else {
      mode = localMode;
    }
    paintUI();
    SharedHelper().setMode(mode);

    emit(ChangeModeState());
  }

  static ModeCubit get(context) => BlocProvider.of(context);
  late ThemeMode mode;
  late Icon modeIcon;
  late Color iconColor;
  // ThemeMode getMode(){
  //   ThemeMode localMode=SharedHelper().getMode();
  //   mode ??= localMode;
  //   return mode!;
  // }

  void paintUI() {
    if (mode == ThemeMode.dark) {
      modeIcon = const Icon(
        Icons.light_mode,
        color: Colors.yellowAccent,
      );
      iconColor = Colors.white;
    } else {
      modeIcon = const Icon(
        Icons.dark_mode,
        color: Colors.black,
      );
      iconColor = Colors.black;
    }
  }

  void toggleMode() {
    if (mode == ThemeMode.dark) {
      mode = ThemeMode.light;
    } else {
      mode = ThemeMode.dark;
    }
    paintUI();
    SharedHelper().setMode(mode);
    emit(ChangeModeState());
  }
}
