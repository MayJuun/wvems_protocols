// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:equatable/equatable.dart';

import 'package:wvems_protocols/wvems_protocols.dart';

typedef PageId = int;

class PdfBundle extends Equatable {
  const PdfBundle({
    required this.assetPath,
    required this.pdf,
    required this.pdfMeta,
    required this.pdfTableOfContents,
    required this.pdfText,
  });

  /// The reference to the locally hosted app, used for later retrieval
  final AssetPaths assetPath;

  /// The PDF, pre-loaded in memory
  final File pdf;

  /// Version number, color scheme, and related metadata
  final PdfMeta pdfMeta;

  // All table of contents text, with PageId set to the actual page number
  final PdfTableOfContents pdfTableOfContents;

  /// All text present on a page, with PageId set to the actual page number
  final PdfText pdfText;

  @override
  List<Object> get props => [pdf, pdfMeta, pdfTableOfContents, pdfText];
}
