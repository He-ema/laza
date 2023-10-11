import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/core/theme/theme.dart';
import 'package:laza/core/theme/theme_cubit/theme_cubit.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
        border: CreateBorder(context),
        enabledBorder: CreateBorder(context),
      ),
    );
  }

  UnderlineInputBorder CreateBorder(BuildContext context) {
    return UnderlineInputBorder(
      borderSide: BorderSide(
        width: 0.1,
        color: BlocProvider.of<ThemeCubit>(context).themeData == darkMode
            ? Colors.white
            : Colors.black54,
      ),
    );
  }
}
