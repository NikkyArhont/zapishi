import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'stars_model.dart';
export 'stars_model.dart';

class StarsWidget extends StatefulWidget {
  const StarsWidget({
    super.key,
    this.parameter1,
  });

  final double? parameter1;

  @override
  State<StarsWidget> createState() => _StarsWidgetState();
}

class _StarsWidgetState extends State<StarsWidget> {
  late StarsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StarsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(1.0, 0.0),
      child: RatingBar.builder(
        onRatingUpdate: (newValue) =>
            safeSetState(() => _model.ratingBarValue = newValue),
        itemBuilder: (context, index) => Icon(
          Icons.star_rounded,
          color: FlutterFlowTheme.of(context).warning,
        ),
        direction: Axis.horizontal,
        initialRating: _model.ratingBarValue ??= widget.parameter1!,
        unratedColor: FlutterFlowTheme.of(context).accent2,
        itemCount: 5,
        itemSize: 24.0,
        glowColor: FlutterFlowTheme.of(context).warning,
      ),
    );
  }
}
