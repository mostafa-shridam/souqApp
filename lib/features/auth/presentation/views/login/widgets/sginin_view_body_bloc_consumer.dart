import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:souq/core/services/shared_preferences.dart';
import 'package:souq/core/utlis/constants/constants.dart';
import 'package:souq/core/widgets/custom_show_snack_bar.dart';
import 'package:souq/features/auth/presentation/views/cubits/signin_cubit/signin_cubit.dart';
import 'package:souq/features/auth/presentation/views/login/widgets/sginin_view_body.dart';
import 'package:souq/views/nav_views/nav_bar_view.dart';

class SginInViewBodyBlocConsumer extends StatelessWidget {
  const SginInViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          Navigator.pushReplacementNamed(context, NavView.routeName);
          customShowSnackBar(
            context,
            message: 'Success ${state.userEntity.name.toString()}',
            color: Colors.green.shade200,
          );
          Prefs.setBool(kIsLogin, true);
        } else if (state is SignInFailure) {
          customShowSnackBar(
            context,
            message: state.message,
            color: Colors.red.shade200,
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignInLoading ? true : false,
          child: SginInViewBody(),
        );
      },
    );
  }
}
