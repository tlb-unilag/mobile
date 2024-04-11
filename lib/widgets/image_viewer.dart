import 'package:taro_leaf_blight/packages/global_packages.dart';

class ImageView extends StatefulWidget {
  final Widget imageWidget;

  final double minScale;

  final double maxScale;

  final bool doubleTapZoomable;

  final void Function(double)? onScaleChanged;

  ImageView({
    Key? key,
    required String url,
    double minScale = 1.0,
    double maxScale = 5.0,
    bool doubleTapZoomable = false,
    void Function(double)? onScaleChanged,
  }) : this.imageWidget(
          ExtendedImage.network(
            url,
            fit: BoxFit.fitWidth,
          ),
          key: key,
          minScale: minScale,
          maxScale: maxScale,
          doubleTapZoomable: doubleTapZoomable,
          onScaleChanged: onScaleChanged,
        );
  const ImageView.imageWidget(
    this.imageWidget, {
    super.key,
    this.minScale = 0.2,
    this.maxScale = 5.0,
    this.doubleTapZoomable = false,
    this.onScaleChanged,
  });

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView>
    with SingleTickerProviderStateMixin {
  final TransformationController _transformationController =
      TransformationController();

  TapDownDetails _doubleTapDetails = TapDownDetails();
  late AnimationController _animationController;
  Animation<Matrix4>? _doubleTapAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
        key: const Key('image_sized_box'),
        child: InteractiveViewer(
          key: const Key('interactive_image_viewer'),
          transformationController: _transformationController,
          minScale: widget.minScale,
          maxScale: widget.maxScale,
          child: widget.doubleTapZoomable
              ? GestureDetector(
                  onDoubleTapDown: _handleDoubleTapDown,
                  onDoubleTap: _handleDoubleTap,
                  child: widget.imageWidget)
              : widget.imageWidget,
          onInteractionEnd: (scaleEndDetails) {
            double scale = _transformationController.value.getMaxScaleOnAxis();

            if (widget.onScaleChanged != null) {
              widget.onScaleChanged!(scale);
            }
          },
        ));
  }

  void _handleDoubleTapDown(TapDownDetails details) {
    _doubleTapDetails = details;
  }

  void _handleDoubleTap() {
    _doubleTapAnimation?.removeListener(_animationListener);
    _doubleTapAnimation?.removeStatusListener(_animationStatusListener);

    double scale = _transformationController.value.getMaxScaleOnAxis();

    if (scale < 2.0) {
      // If we are not at a 2x scale yet, zoom in all the way to 2x.
      final position = _doubleTapDetails.localPosition;
      final begin = _transformationController.value;
      final end = Matrix4.identity()
        ..translate(-position.dx, -position.dy)
        ..scale(2.0);

      _updateDoubleTapAnimation(begin, end);
      _animationController.forward(from: 0.0);
    } else {
      // If we are zoomed in at 2x or more, zoom all the way out
      final begin = Matrix4.identity();
      final end = _transformationController.value;

      _updateDoubleTapAnimation(begin, end);

      _animationController.reverse(from: scale - 1.0);
    }
  }

  void _updateDoubleTapAnimation(Matrix4 begin, Matrix4 end) {
    _doubleTapAnimation = Matrix4Tween(begin: begin, end: end).animate(
        CurveTween(curve: Curves.easeInOut).animate(_animationController));
    _doubleTapAnimation?.addListener(_animationListener);
    _doubleTapAnimation?.addStatusListener(_animationStatusListener);
  }

  void _animationListener() {
    _transformationController.value =
        _doubleTapAnimation?.value ?? Matrix4.identity();
  }

  void _animationStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed ||
        status == AnimationStatus.dismissed) {
      double scale = _transformationController.value.getMaxScaleOnAxis();

      if (widget.onScaleChanged != null) {
        widget.onScaleChanged!(scale);
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

/// An internal widget that is used to hold a state to activate/deactivate the ability to
/// swipe-to-dismiss. This needs to be tied to the zoom scale of the current image, since
/// the user needs to be able to pan around on a zoomed-in image without triggering the
/// swipe-to-dismiss gesture.
class ImageViewerDismissibleDialog extends StatefulWidget {
  final bool immersive;
  final String url;
  final void Function(int)? onPageChanged;
  final void Function(int)? onViewerDismissed;
  final bool useSafeArea;
  final bool swipeDismissible;
  final bool doubleTapZoomable;
  final Color backgroundColor;
  final String closeButtonTooltip;
  final Color closeButtonColor;

  const ImageViewerDismissibleDialog({
    super.key,
    required this.url,
    this.immersive = true,
    this.onPageChanged,
    this.onViewerDismissed,
    this.useSafeArea = false,
    this.swipeDismissible = false,
    this.doubleTapZoomable = false,
    required this.backgroundColor,
    required this.closeButtonTooltip,
    required this.closeButtonColor,
  });

  @override
  State<ImageViewerDismissibleDialog> createState() =>
      _ImageViewerDismissibleDialogState();
}

class _ImageViewerDismissibleDialogState
    extends State<ImageViewerDismissibleDialog> {
  /// This is used to either activate or deactivate the ability to swipe-to-dismissed, based on
  /// whether the current image is zoomed in (scale > 0) or not.
  DismissDirection _dismissDirection = DismissDirection.down;

  /// When no global key was used, the state was re-created on the initial zoom, which
  /// caused the new state to have _pagingEnabled set to true, which in turn broke
  /// paning on the zoomed-in image.
  final _popScopeKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // Remove this once we release v2.0.0 and can bump the minimum Flutter version to 3.13.0
    // ignore: deprecated_member_use
    final popScopeAwareDialog = WillPopScope(
        onWillPop: () async {
          _handleDismissal();
          return true;
        },
        key: _popScopeKey,
        child: Dialog(
            backgroundColor: widget.backgroundColor,
            insetPadding: const EdgeInsets.all(0),
            shape:
                const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: <Widget>[
                  ImageView(
                      url: widget.url,
                      doubleTapZoomable: widget.doubleTapZoomable,
                      onScaleChanged: (scale) {
                        setState(() {
                          _dismissDirection = scale <= 1.0
                              ? DismissDirection.down
                              : DismissDirection.none;
                        });
                      }),
                  Positioned(
                      top: 30,
                      right: 5,
                      child: IconButton(
                        icon: const Icon(Icons.close),
                        color: widget.closeButtonColor,
                        tooltip: widget.closeButtonTooltip,
                        onPressed: () {
                          Navigator.of(context).pop();
                          _handleDismissal();
                        },
                      )),
                ]))
                );

    if (widget.swipeDismissible) {
      return Dismissible(
          direction: _dismissDirection,
          resizeDuration: null,
          confirmDismiss: (dir) async {
            return true;
          },
          onDismissed: (_) {
            Navigator.of(context).pop();
            _handleDismissal();
          },
          key: const Key('dismissible_easy_image_viewer_dialog'),
          child: popScopeAwareDialog);
    } else {
      return popScopeAwareDialog;
    }
  }

  void _handleDismissal() {
    if (widget.immersive) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    }
  }
}

//showImageViewer
const _defaultBackgroundColor = Colors.black;
const _defaultCloseButtonColor = Colors.white;
const _defaultCloseButtonTooltip = 'Close';

Future<Dialog?> showImageViewer(BuildContext context, String url,
    {bool immersive = true,
    bool useSafeArea = false,
    bool swipeDismissible = false,
    bool doubleTapZoomable = false,
    Color backgroundColor = _defaultBackgroundColor,
    String closeButtonTooltip = _defaultCloseButtonTooltip,
    Color closeButtonColor = _defaultCloseButtonColor}) {
  if (immersive) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  return showDialog<Dialog>(
      context: context,
      useSafeArea: useSafeArea,
      builder: (context) {
        return ImageViewerDismissibleDialog(
            url: url,
            immersive: immersive,
            useSafeArea: useSafeArea,
            swipeDismissible: swipeDismissible,
            doubleTapZoomable: doubleTapZoomable,
            backgroundColor: backgroundColor,
            closeButtonColor: closeButtonColor,
            closeButtonTooltip: closeButtonTooltip);
      });
}
