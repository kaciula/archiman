import 'package:archiman/app/app_strings.al.dart';
import 'package:archiman/app/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../utils/generic/refresh_state.dart';
import '../../generic/templates/generic_refresh_container.dart';
import '../atoms/circular_progress.dart';

class RefreshContainer extends StatelessWidget {
  const RefreshContainer({
    Key? key,
    required this.refreshState,
    required this.content,
    required this.onRetry,
    this.progress,
    this.wrapErrorInScaffold = false,
  }) : super(key: key);

  final RefreshState refreshState;
  final Widget Function() content;
  final VoidCallback onRetry;
  final Widget? progress;
  final bool wrapErrorInScaffold;

  @override
  Widget build(BuildContext context) {
    return GenericRefreshContainer(
      refreshState: refreshState,
      content: content,
      onRetry: onRetry,
      progress: progress ?? _progress(),
      errorBackgroundColor: AppColors.red,
      errorTextColor: AppColors.white,
      errorTitle: Strings.genericErrorTitle.get(),
      defaultErrorMsg: Strings.genericErrorMsg.get(),
      retryLabel: Strings.genericRetry.get(),
      detailedErrorLabel: Strings.details.get(),
      wrapErrorInScaffold: wrapErrorInScaffold,
    );
  }

  Widget _progress() {
    return const Center(child: CircularProgress());
  }
}
