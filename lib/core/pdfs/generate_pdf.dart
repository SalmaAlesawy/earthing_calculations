import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../gen/assets.gen.dart';

class PdfService {
  Future<Uint8List> generatePdf(Uint8List imageBytes, String title) async {
    final pdf = pw.Document();
    final image = pw.MemoryImage(imageBytes);
    final letterHead = await rootBundle.load(
      Assets.images.bahraLetterhead.path,
    );
    final letterHeadImage = pw.MemoryImage(letterHead.buffer.asUint8List());
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.zero,
        build: (context) {
          return pw.Center(
            child: pw.Stack(
              children: [
                pw.Image(letterHeadImage),
                pw.Positioned(
                  top: 90,
                  left: 10,
                  child: pw.Center(
                    child: pw.Text(
                      title,
                      style: pw.TextStyle(color: PdfColors.white, fontSize: 30),
                    ),
                  ),
                ),

                pw.LayoutBuilder(
                  builder: (context, constraints) {
                    return pw.Center(
                      child: pw.Image(
                        image,
                        fit: pw.BoxFit.contain,
                        width: constraints!.maxWidth * 0.9,
                        height: constraints.maxHeight * 0.7,
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
    return pdf.save();
  }
}
