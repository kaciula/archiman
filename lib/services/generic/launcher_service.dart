import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_social_content_share/flutter_social_content_share.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logging/logging.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:share_plus/share_plus.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:social_share_plugin/social_share_plugin.dart';
import 'package:universal_io/io.dart';
import 'package:url_launcher/url_launcher.dart';

part 'launcher_service.freezed.dart';

class LauncherService {
  Future<void> dial({required String phoneNum}) async {
    final Uri uri = Uri(scheme: 'tel', path: phoneNum);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<ShareTextResult> shareText(
      {required String text, required String subject}) async {
    try {
      await Share.share(text, subject: subject);
      return ShareTextSuccess();
    } catch (error) {
      _logger.warning(error);
      return ShareTextFailure();
    }
  }

  Future<bool> openExternalUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      return await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
    return false;
  }

  Future<void> sendEmailTo(String emailAddress) async {
    final Uri uri = Uri(scheme: 'mailto', path: emailAddress);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<void> sendEmailWithAttachment({
    required String emailAddress,
    required String subject,
    required String body,
    required String attachmentPath,
  }) async {
    final Email email = Email(
      subject: subject,
      body: body,
      recipients: <String>[emailAddress],
      attachmentPaths: <String>[attachmentPath],
      isHTML: false,
    );
    await FlutterEmailSender.send(email);
  }

  Future<void> sendSmsTo({required String phoneNum, String? message}) async {
    final Uri uri;

    if (Platform.isIOS) {
      uri = Uri(
        scheme: 'sms',
        path: '$phoneNum&body=$message',
      );
    } else {
      uri = Uri(
        scheme: 'sms',
        path: phoneNum,
        queryParameters: {
          'body': message,
        },
      );
    }

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<void> shareOnTwitter(
      {required String text, required String url}) async {
    await SocialSharePlugin.shareToTwitterLink(text: text, url: url);
  }

  Future<void> shareOnFacebook({required String text, String? url}) async {
    FlutterSocialContentShare.share(
      type: ShareType.facebookWithoutImage,
      quote: text,
      url: url,
    );
  }

  Future<void> shareFile({required String filePath}) async {
    await Share.shareXFiles(<XFile>[XFile(filePath)]);
  }

  Future<void> launchWhatsApp({required String phoneNumber}) async {
    // final String url = 'https://wa.me/$phoneNumber';
    final Uri uri = Uri(scheme: 'https', path: 'wa.me/$phoneNumber');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<void> launchMaps(String address) async {
    await MapsLauncher.launchQuery(address);
  }
}

@freezed
class ShareTextResult with _$ShareTextResult {
  factory ShareTextResult.success() = ShareTextSuccess;

  factory ShareTextResult.failure({
    String? errorMsg,
    String? errorDetails,
  }) = ShareTextFailure;
}

// ignore: unused_element
final Logger _logger = Logger('LauncherService');
