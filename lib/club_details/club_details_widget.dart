import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'club_details_model.dart';
export 'club_details_model.dart';

class ClubDetailsWidget extends StatefulWidget {
  const ClubDetailsWidget({
    Key? key,
    this.clubName,
  }) : super(key: key);

  final String? clubName;

  @override
  _ClubDetailsWidgetState createState() => _ClubDetailsWidgetState();
}

class _ClubDetailsWidgetState extends State<ClubDetailsWidget> {
  late ClubDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClubDetailsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return FutureBuilder<ClubsRecord>(
      future: ClubsRecord.getDocumentOnce(FFAppState().clubReference!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final clubDetailsClubsRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            floatingActionButton: Visibility(
              visible: (valueOrDefault(currentUserDocument?.role, '') ==
                      'Faculty') &&
                  (clubDetailsClubsRecord.postLikedBy.length >= 1),
              child: AuthUserStreamWidget(
                builder: (context) => FloatingActionButton.extended(
                  onPressed: () async {
                    var confirmDialogResponse = await showDialog<bool>(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('Do you want to create the club?'),
                              content: Text(
                                  'The club has enough members to be created. Would you like to continue?'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext, false),
                                  child: Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext, true),
                                  child: Text('Create'),
                                ),
                              ],
                            );
                          },
                        ) ??
                        false;

                    await clubDetailsClubsRecord.reference
                        .update(createClubsRecordData(
                      faculty: currentUserReference,
                      isCreated: true,
                    ));
                  },
                  backgroundColor: FlutterFlowTheme.of(context).primary,
                  elevation: 8.0,
                  label: Text(
                    'Verify',
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
              ),
            ),
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Text(
                clubDetailsClubsRecord.name,
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Outfit',
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
              ),
              actions: [],
              flexibleSpace: FlexibleSpaceBar(
                background: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1578886141033-b9f066572135?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwzfHxjbGltYmluZ3xlbnwwfHx8fDE2OTc5ODQ3OTJ8MA&ixlib=rb-4.0.3&q=80&w=1080',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              centerTitle: false,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    clubDetailsClubsRecord.description,
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                  Text(
                    clubDetailsClubsRecord.postLikedBy.length.toString(),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                  ToggleIcon(
                    onPressed: () async {
                      final postLikedByElement = currentUserReference;
                      final postLikedByUpdate = clubDetailsClubsRecord
                              .postLikedBy
                              .contains(postLikedByElement)
                          ? FieldValue.arrayRemove([postLikedByElement])
                          : FieldValue.arrayUnion([postLikedByElement]);
                      await clubDetailsClubsRecord.reference.update({
                        ...mapToFirestore(
                          {
                            'postLikedBy': postLikedByUpdate,
                          },
                        ),
                      });
                      setState(() {});
                    },
                    value: clubDetailsClubsRecord.postLikedBy
                        .contains(currentUserReference),
                    onIcon: Icon(
                      Icons.favorite_sharp,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 25.0,
                    ),
                    offIcon: Icon(
                      Icons.favorite_border,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 25.0,
                    ),
                  ),
                  Divider(
                    thickness: 1.0,
                    color: FlutterFlowTheme.of(context).accent4,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
