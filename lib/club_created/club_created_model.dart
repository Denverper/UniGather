import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'club_created_widget.dart' show ClubCreatedWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ClubCreatedModel extends FlutterFlowModel<ClubCreatedWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PostTitle widget.
  FocusNode? postTitleFocusNode;
  TextEditingController? postTitleController;
  String? Function(BuildContext, String?)? postTitleControllerValidator;
  // State field(s) for TextPost widget.
  FocusNode? textPostFocusNode;
  TextEditingController? textPostController;
  String? Function(BuildContext, String?)? textPostControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    postTitleFocusNode?.dispose();
    postTitleController?.dispose();

    textPostFocusNode?.dispose();
    textPostController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
