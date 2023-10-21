import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/theme/theme.dart';
import '../../../../../core/theme/theme_cubit/theme_cubit.dart';

class SearchTextFiled extends StatelessWidget {
  const SearchTextFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty ?? true) {
          return 'This field can\'t be empty';
        } else {
          return null;
        }
      },
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
        border: CreateBorder(context, Colors.white),
        disabledBorder: CreateBorder(context, Colors.white),
        focusedBorder: CreateBorder(context, Colors.white),
        enabledBorder: CreateBorder(context, Colors.white),
      ),
    );
  }

  OutlineInputBorder CreateBorder(BuildContext context, [color]) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        // width: color == null ? 0.1 : 1,
        color: color ??
            (BlocProvider.of<ThemeCubit>(context).themeData == darkMode
                ? Colors.white
                : Colors.black54),
      ),
    );
  }
}
