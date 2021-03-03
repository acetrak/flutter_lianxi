import 'package:flutter/material.dart';
import 'package:flutter1/common/animate_rotate.dart';

class Accordion extends StatefulWidget {
  /// 折叠面板
  const Accordion({
    Key key,
    this.accordionSummary,
    this.expanded = false,
    this.accordionDetails,
    this.onChange,
    this.padding,
    this.margin,
  }) : super(key: key);

  /// 标题
  final AccordionSummary accordionSummary;

  /// 是否展开
  final bool expanded;

  /// 内容
  final Widget accordionDetails;

  /// 回调 返回当前value
  final Function(bool) onChange;

  /// padding
  final EdgeInsets padding;

  /// margin
  final EdgeInsets margin;

  @override
  _AccordionState createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> {
  static const Duration sleep = const Duration(milliseconds: 120);

  bool _expanded = false;

  @override
  void initState() {
    super.initState();
    this._expanded = widget.expanded;
  }

  @override
  void didUpdateWidget(covariant Accordion oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.expanded != widget.expanded) {
      this._expanded = widget.expanded;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      key: widget.key,
      padding: widget.padding,
      margin: widget.margin,
      child:  Column(
        children: <Widget>[
          Material(
            color: widget.accordionSummary.color,
            child: InkWell(
              child: Padding(
                padding: widget.accordionSummary.padding,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: widget.accordionSummary,
                    ),
                    AnimatedRotate(
                      duration: sleep,
                      child: widget.accordionSummary.expandIcon,
                      rotate: _expanded ? 0.5 : 1,
                    )
                  ],
                ),
              ),
              onTap: () {
                if (widget.onChange != null) {
                  widget.onChange(!_expanded);
                }

                setState(() {
                  this._expanded = !_expanded;
                });
              },
            ),
          ),
          _Body(
            child: Container(child: widget.accordionDetails),
            sleep: sleep,
            expanded: _expanded,
          )
        ],
      ),
    );
  }
}

/// 内容区域
/// 为了获取当前内容的高度 实现展开收起动画，所以拆成状态组件
class _Body extends StatefulWidget {
  _Body({
    this.child,
    this.expanded,
    @required this.sleep,
    Key key,
  }) : super(key: key);

  final Widget child;
  final bool expanded;
  final Duration sleep;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<_Body> with TickerProviderStateMixin {
  Widget build(BuildContext context) {
    return AnimatedSize(
        vsync: this,
        duration: widget.sleep,
        child: Container(
          constraints: BoxConstraints(
            maxHeight: !widget.expanded ? 0 : double.infinity,
          ),
          child: widget.child,
        ));
  }
}

class AccordionSummary extends StatelessWidget {
  final Widget child;
  final Widget expandIcon;
  final EdgeInsets padding;
  final Color color;

  const AccordionSummary({Key key, this.child, this.expandIcon, this.padding = const EdgeInsets.symmetric(vertical: 0, horizontal: 10), this.color = Colors.white}) : super(key: key);

  @override
  Widget build(BuildContext context) => this.child;
}
