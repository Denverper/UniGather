import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'club_ideas_widget.dart' show ClubIdeasWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ClubIdeasModel extends FlutterFlowModel<ClubIdeasWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for clubName widget.
  FocusNode? clubNameFocusNode;
  TextEditingController? clubNameController;
  String? Function(BuildContext, String?)? clubNameControllerValidator;
  String? _clubNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 5) {
      return 'Description must be at least 5 characters';
    }

    return null;
  }

  // State field(s) for clubDescription widget.
  FocusNode? clubDescriptionFocusNode;
  TextEditingController? clubDescriptionController;
  String? Function(BuildContext, String?)? clubDescriptionControllerValidator;
  String? _clubDescriptionControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 20) {
      return 'Description must be at least 50 characters';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ClubsRecord? newClub;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    clubNameControllerValidator = _clubNameControllerValidator;
    clubDescriptionControllerValidator = _clubDescriptionControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    clubNameFocusNode?.dispose();
    clubNameController?.dispose();

    clubDescriptionFocusNode?.dispose();
    clubDescriptionController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
