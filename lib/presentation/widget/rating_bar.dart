import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  RatingBar(
      {this.itemSize = 50.0,
      this.itemCount = 5,
      this.initialRating = 0.0,
      RatingWidget ratingWidget,
      this.allowHalfRating = false})
      : _ratingWidget = ratingWidget;

  /// Responsible for the size of the stars, the proportions are strictly square
  final double itemSize;

  /// Responsible for the number of visible stars
  final int itemCount;

  /// Responsible for the number of filled stars
  final double initialRating;

  /// Responsible for displaying half of the filled star, if the value is true,
  /// then half will be visible, if the value is false (by default), then it will
  /// depend on the number of the rating which star to display
  final bool allowHalfRating;

  /// Is responsible for showing the stars on the screen
  final RatingWidget _ratingWidget;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(
        itemCount,
        (index) => _buildRating(context, index),
      ),
    );
  }

  Widget _buildRating(BuildContext context, int index) {
    final ratingWidget = this._ratingWidget;
    final ratingOffset = allowHalfRating ? 0.5 : 1.0;

    Widget _ratingWidget;

    if (index >= initialRating) {
      _ratingWidget = _displayStar(ratingWidget.empty);
    } else if (index >= initialRating - ratingOffset && allowHalfRating) {
      _ratingWidget = _displayStar(ratingWidget.half);
    } else {
      _ratingWidget = _displayStar(ratingWidget.full);
    }

    return _ratingWidget;
  }

  Widget _displayStar(Widget star) {
    return SizedBox(
      height: itemSize,
      width: itemSize,
      child: FittedBox(
        child: star,
        fit: BoxFit.contain,
      ),
    );
  }
}

class RatingWidget {
  RatingWidget({
    this.full,
    this.half,
    this.empty,
  });

  final Widget full;

  final Widget half;

  final Widget empty;
}
