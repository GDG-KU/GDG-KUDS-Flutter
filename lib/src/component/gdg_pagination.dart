part of '../../gdgku_design.dart';

class GdgPagination extends StatefulWidget {
  const GdgPagination({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
    this.maxVisiblePages = 7,
    this.showSkipToFirstPage = true,
    this.showSkipToLastPage = true,
    this.color = GdgColors.primary,
  });

  final int currentPage;
  final int totalPages;
  final int maxVisiblePages;
  final bool showSkipToFirstPage;
  final bool showSkipToLastPage;
  final void Function(int page) onPageChanged;
  final GdgColor color;

  bool get hasPrevious => currentPage > 1;
  bool get hasNext => currentPage < totalPages;

  @override
  State<GdgPagination> createState() => _GdgPaginationState();
}

class _GdgPaginationState extends State<GdgPagination> {
  int start = 0;
  int end = 0;

  List<Widget> _buildPaginationItems() {
    List<Widget> items = [];
    bool needFrontEllipsis = false;
    bool needEndEllipsis = false;

    if (widget.totalPages <= widget.maxVisiblePages) {
      for (int i = 1; i <= widget.totalPages; i++) {
        items.add(_createPageItem(i));
      }
    } else {
      start = widget.currentPage - (widget.maxVisiblePages ~/ 2);
      end = widget.currentPage + (widget.maxVisiblePages ~/ 2);

      if (start < 1) {
        start = 1;
        end = widget.maxVisiblePages;
      } else if (start > 1) {
        needFrontEllipsis = true;
      }

      if (end > widget.totalPages) {
        end = widget.totalPages;
        start = widget.totalPages - widget.maxVisiblePages + 1;
      } else if (end < widget.totalPages) {
        needEndEllipsis = true;
      }

      if (needFrontEllipsis) {
        items.add(_createEllipsis());
      }
      for (int i = start; i <= end; i++) {
        items.add(_createPageItem(i));
      }
      if (needEndEllipsis) {
        items.add(_createEllipsis());
      }
    }

    return items;
  }

  Widget _createEllipsis() {
    return SizedBox(
      width: 28,
      height: 28,
      child: Center(
        child: Text(
          "...",
          style: TextStyle(
            fontSize: 12.4,
            fontWeight: FontWeight.w500,
            color: GdgColors.primary[800],
          ),
        ),
      ),
    );
  }

  Widget _createPageItem(int page) {
    bool isSelected = widget.currentPage == page;

    return GestureDetector(
      onTap: () => widget.onPageChanged(page),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: _GdgPaginationItem(
          isSelected: isSelected,
          pageNumber: page,
          color: widget.color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    assert(widget.currentPage > 0, "currentPage must be greater than 0");
    assert(widget.totalPages > 0, "totalPages must be greater than 0");
    assert(
      widget.currentPage <= widget.totalPages,
      "currentPage must be less than or equal to totalPages",
    );

    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 28),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.showSkipToFirstPage)
            GestureDetector(
              onTap: () => widget.onPageChanged(1),
              child: SizedBox(
                width: 28,
                height: 28,
                child: Center(
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 18,
                    color: widget.hasPrevious
                        ? GdgColors.primary[600]
                        : GdgColors.primary[400],
                  ),
                ),
              ),
            ),
          if (widget.showSkipToFirstPage) const SizedBox(width: 20),
          ..._buildPaginationItems(),
          if (widget.showSkipToLastPage) const SizedBox(width: 20),
          if (widget.showSkipToLastPage)
            GestureDetector(
              onTap: widget.hasNext
                  ? () => widget.onPageChanged(widget.totalPages)
                  : null,
              child: SizedBox(
                width: 28,
                height: 28,
                child: Center(
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: widget.hasNext
                        ? GdgColors.primary[600]
                        : GdgColors.primary[400],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _GdgPaginationItem extends StatelessWidget {
  final bool isSelected;
  final int pageNumber;
  final GdgColor color;

  const _GdgPaginationItem({
    required this.isSelected,
    required this.pageNumber,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveBoxColor = isSelected
        ? color == GdgColors.primary
            ? GdgColors.primary[700]
            : color[500]
        : Colors.transparent;
    final effectiveTextColor =
        isSelected ? GdgColors.primary[100] : GdgColors.primary[800];

    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeOut,
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: effectiveBoxColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          pageNumber.toString(),
          style: TextStyle(
            fontSize: 12.4,
            fontWeight: FontWeight.w500,
            color: effectiveTextColor,
          ),
        ),
      ),
    );
  }
}
