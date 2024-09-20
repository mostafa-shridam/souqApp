import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:souq/core/services/get_it_services.dart';
import 'package:souq/core/widgets/custom_app_bar.dart';
import 'package:souq/core/widgets/custom_show_snack_bar.dart';
import 'package:souq/features/auth/data/domain/repo/auth_repo.dart';
import 'package:souq/features/auth/presentation/views/cubits/signup_cubit/signup_cubit.dart';
import 'package:souq/features/auth/presentation/views/signup/widgets/sgin_up_view_body.dart';
import 'package:souq/generated/l10n.dart';
import 'package:souq/views/nav_views/nav_bar_view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  static const String routeName = 'SignUp';

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(
        getIt<AuthRepo>(),
      ),
      child: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state is SignupSuccess) {
            Navigator.pushReplacementNamed(context, NavView.routeName);
            customShowSnackBar(
              context,
              message: state.userEntity.name.toString(),
              color: Colors.green.shade200,
            );
          }
          if (state is SignupFailure) {
            customShowSnackBar(
              context,
              message: state.message,
              color: Colors.red.shade200,
            );
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is SignupLoading ? true : false,
            dismissible: true,
            child: AbsorbPointer(
              absorbing: state is SignupLoading ? true : false,
              child: Scaffold(
                appBar: customAppBar(
                  leading: () {
                    return Navigator.pop(context);
                  },
                  context,
                  title: S.of(context).appBarSignUp,
                  centerTitle: true,
                ),
                body: SignUpViewBody(),
              ),
            ),
          );
        },
      ),
    );
  }
}
