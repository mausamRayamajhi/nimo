import 'package:flutter/cupertino.dart';

typedef LoadMoreCallback = Function();

class PullToRefreshListView extends StatefulWidget {
  final List<Widget> items;
  final RefreshCallback? _refreshCallBack;
  final LoadMoreCallback? _loadMoreCallback;
  final ScrollController? controller;
  final bool? isShrinkWrap;
  final EdgeInsets padding;
  final ScrollPhysics? physics;

  const PullToRefreshListView({
    super.key,
    required this.items,
    RefreshCallback? refreshCallBack,
    LoadMoreCallback? loadMoreCallback,
    this.isShrinkWrap,
    this.controller,
    this.padding = EdgeInsets.zero,
    this.physics,
  }) : _refreshCallBack = refreshCallBack,
       _loadMoreCallback = loadMoreCallback;

  static PullToRefreshListViewState? of(BuildContext context) {
    return context.findAncestorStateOfType<PullToRefreshListViewState>();
  }

  @override
  State<PullToRefreshListView> createState() => PullToRefreshListViewState();
}

class PullToRefreshListViewState extends State<PullToRefreshListView> {
  late final ScrollController _controller;

  @override
  void initState() {
    _controller = widget.controller ?? ScrollController();
    _controller.addListener(pagination);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: widget.padding.left,
        right: widget.padding.right,
      ),
      child: CustomScrollView(
        controller: _controller,
        shrinkWrap: widget.isShrinkWrap ?? false,
        physics: widget.physics,
        slivers: [
          CupertinoSliverRefreshControl(
            refreshIndicatorExtent: 48,
            onRefresh: widget._refreshCallBack,
          ),
          SliverToBoxAdapter(child: SizedBox(height: widget.padding.top)),
          SliverToBoxAdapter(child: ListBody(children: widget.items)),
          SliverToBoxAdapter(child: SizedBox(height: widget.padding.bottom)),
        ],
      ),
    );
  }

  void pagination() {
    if (_controller.position.pixels == _controller.position.maxScrollExtent) {
      final callBack = widget._loadMoreCallback;
      if (callBack != null) {
        callBack();
      }
    }
  }
}
