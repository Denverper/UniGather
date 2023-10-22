import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/comment1_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'club_post_copy_widget.dart' show ClubPostCopyWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ClubPostCopyModel extends FlutterFlowModel<ClubPostCopyWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleController;
  String? Function(BuildContext, String?)? titleControllerValidator;
  // State field(s) for context widget.
  FocusNode? contextFocusNode;
  TextEditingController? contextController;
  String? Function(BuildContext, String?)? contextControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for updatedClubName widget.
  FocusNode? updatedClubNameFocusNode;
  TextEditingController? updatedClubNameController;
  String? Function(BuildContext, String?)? updatedClubNameControllerValidator;
  // State field(s) for updatedClubDesc widget.
  FocusNode? updatedClubDescFocusNode;
  TextEditingController? updatedClubDescController;
  String? Function(BuildContext, String?)? updatedClubDescControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    titleFocusNode?.dispose();
    titleController?.dispose();

    contextFocusNode?.dispose();
    contextController?.dispose();

    updatedClubNameFocusNode?.dispose();
    updatedClubNameController?.dispose();

    updatedClubDescFocusNode?.dispose();
    updatedClubDescController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
