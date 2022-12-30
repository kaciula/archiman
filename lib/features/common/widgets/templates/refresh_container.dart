import 'package:archiman/app/app_constants.dart';
import 'package:archiman/app/app_strings.al.dart';
import 'package:archiman/app/app_styles.dart';
import 'package:archiman/features/common/utils/generic/flutter_extensions.dart';
import 'package:archiman/features/common/utils/generic/refresh_state.dart';
import 'package:flutter/material.dart';

import '../atoms/circular_progress.dart';

class RefreshContainer extends StatelessWidget {
  const RefreshContainer({
    Key? key,
    required this.refreshState,
    required this.content,
    required this.onRetry,
    this.progress,
  }) : super(key: key);

  final RefreshState refreshState;
  final Widget Function() content;
  final VoidCallback onRetry;
  final Widget? progress;

  @override
  Widget build(BuildContext context) {
    return refreshState.when(
      inProgress: () => progress ?? _progress(),
      success: () => content(),
      error: (String? errorMsg, String? errorDetails) =>
          _error(context, refreshState as Error),
    );
  }

  Widget _progress() {
    return const Center(child: CircularProgress());
  }

  Widget _error(BuildContext context, Error errorRefreshState) {
    final String errorMsg =
        errorRefreshState.errorMsg ?? Strings.genericErrorMsg.get();
    final String? errorDetails = errorRefreshState.errorDetails;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppInsets.i16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              Strings.genericErrorTitle.get(),
              style: context.textTheme.headline6,
            ),
            const SizedBox(height: AppInsets.i16),
            Text(
              errorMsg,
              textAlign: TextAlign.center,
            ),
            if (errorDetails != null && showErrorDetails)
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.red,
                ),
                onPressed: () =>
                    _showErrorDetails(context, errorMsg, errorDetails),
                child: Text(Strings.details.get()),
              ),
            const SizedBox(height: AppInsets.i32),
            ElevatedButton(
              onPressed: onRetry,
              child: Text(Strings.genericRetry.get()),
            ),
          ],
        ),
      ),
    );
  }

  void _showErrorDetails(
      BuildContext context, String errorMsg, String errorDetails) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: AppColors.red,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(AppInsets.i16),
              child: Column(
                children: [
                  Text(
                    errorMsg,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppColors.white),
                  ),
                  const SizedBox(height: AppInsets.i8),
                  Text(errorDetails, style: TextStyle(color: AppColors.white)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
