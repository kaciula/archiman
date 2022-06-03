import 'dart:typed_data';

import 'package:pdfx/pdfx.dart';
import 'package:universal_io/io.dart';

class PdfService {
  Future<Uint8List> generateFirstPageImage(File file) async {
    final PdfDocument document = await PdfDocument.openFile(file.path);
    final PdfPage page = await document.getPage(1);
    final PdfPageImage? pageImage =
        await page.render(width: page.width, height: page.height);
    await page.close();
    return pageImage!.bytes;
  }
}
