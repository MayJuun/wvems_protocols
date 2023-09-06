// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:equatable/equatable.dart';

import 'package:wvems_protocols/src/features/pdf/domain/pdf_meta.dart';
import 'package:wvems_protocols/src/features/pdf/domain/pdf_table_of_contents.dart';

import 'export.dart';

typedef PageId = int;

class PdfBundle extends Equatable {
  const PdfBundle({
    required this.pdf,
    required this.pdfMeta,
    required this.pdfTableOfContents,
    required this.pdfText,
  });

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
