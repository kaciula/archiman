import 'package:flutter/material.dart';

import '../../../utils/generic/refresh_state.dart';

class GenericRefreshContainer extends StatelessWidget {
  const GenericRefreshContainer({
    Key? key,
    required this.refreshState,
    required this.content,
    required this.onRetry,
    required this.progress,
    required this.errorBackgroundColor,
    required this.errorTextColor,
    required this.errorTitle,
    required this.defaultErrorMsg,
    required this.detailedErrorLabel,
    required this.retryLabel,
    this.wrapErrorInScaffold = false,
  }) : super(key: key);

  final RefreshState refreshState;
  final Widget Function() content;
  final VoidCallback onRetry;
  final Widget progress;
  final Color errorBackgroundColor;
  final Color errorTextColor;
  final String errorTitle;
  final String defaultErrorMsg;
  final String detailedErrorLabel;
  final String retryLabel;
  final bool wrapErrorInScaffold;

  @override
  Widget build(BuildContext context) {
    return refreshState.when(
      inProgress: () => progress,
      success: () => content(),
      error: (String? errorMsg, String? errorDetails) {
        return wrapErrorInScaffold
            ? Scaffold(
                body: _error(context, refreshState as Error),
              )
            : _error(context, refreshState as Error);
      },
    );
  }

  Widget _error(BuildContext context, Error errorRefreshState) {
    final String errorMsg = errorRefreshState.errorMsg ?? defaultErrorMsg;
    final String? errorDetails = errorRefreshState.errorDetails;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              errorTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Text(
              errorMsg,
              textAlign: TextAlign.center,
            ),
            if (errorDetails != null && _showDetailedErrorDetails)
              TextButton(
                style:
                    TextButton.styleFrom(foregroundColor: errorBackgroundColor),
                onPressed: () =>
                    _showErrorDetails(context, errorMsg, errorDetails),
                child: Text(detailedErrorLabel),
              ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: onRetry,
              child: Text(retryLabel),
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
          color: errorBackgroundColor,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    errorMsg,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: errorTextColor),
                  ),
                  const SizedBox(height: 8),
                  Text(errorDetails, style: TextStyle(color: errorTextColor)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// LATER: Hide error details when app live
const bool _showDetailedErrorDetails = true;
