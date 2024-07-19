import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/core/services/get_it_services.dart';
import 'package:souq/core/widgets/custom_app_bar.dart';
import 'package:souq/core/widgets/custom_drop_down.dart';
import 'package:souq/features/auth/data/domain/repo/auth_repo.dart';
import 'package:souq/features/auth/presentation/views/cubits/signin_cubit/signin_cubit.dart';
import 'package:souq/features/auth/presentation/views/login/widgets/sginin_view_body_bloc_consumer.dart';
import 'package:souq/generated/l10n.dart';
import 'package:souq/main.dart';

class SginInView extends StatefulWidget {
  const SginInView({
    super.key,
  });

  static const String routeName = 'login';

  @override
  State<SginInView> createState() => _SginInViewState();
}

class _SginInViewState extends State<SginInView> {
  SouqApp? SouqAppState;
  late SignInState state;
  @override
  void initState() {
    super.initState();
    state = SignInLoading();
    setState(() {});
  }

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(getIt<AuthRepo>()),
      child: AbsorbPointer(
        absorbing: state is! SignInLoading,
        child: Scaffold(
          appBar: buildAppBar(
            context,
            title: S.of(context).appBarLogin,
            centerTitle: true,
            actions: [
              CustomDropDown(SouqAppState: SouqAppState),
            ],
          ),
          body: SginInViewBodyBlocConsumer(),
        ),
      ),
    );
  }
}
