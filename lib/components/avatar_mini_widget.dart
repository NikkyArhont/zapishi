import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'avatar_mini_model.dart';
export 'avatar_mini_model.dart';

class AvatarMiniWidget extends StatefulWidget {
  const AvatarMiniWidget({
    super.key,
    required this.sizeAva,
    this.avaURL,
  });

  final int? sizeAva;
  final String? avaURL;

  @override
  State<AvatarMiniWidget> createState() => _AvatarMiniWidgetState();
}

class _AvatarMiniWidgetState extends State<AvatarMiniWidget> {
  late AvatarMiniModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AvatarMiniModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: widget.sizeAva?.toDouble(),
          height: widget.sizeAva?.toDouble(),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            'assets/images/4abef4301b412a0f733bb324072f04b363dba422.png',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: widget.sizeAva?.toDouble(),
          height: widget.sizeAva?.toDouble(),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Image.network(
            widget.avaURL!,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Image.asset(
              'assets/images/error_image.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
