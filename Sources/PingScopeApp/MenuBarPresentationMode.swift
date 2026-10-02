import AppKit

enum MenuBarPresentationMode {
    static let statusContentSize = NSSize(width: 400, height: 620)
    static let statusContentMinimumSize = NSSize(width: 360, height: 420)
    static let statusContentPadding: CGFloat = 16
    static let statusGraphMinimumHeight: CGFloat = 150
    static let statusControlHitSize: CGFloat = 40
    static let statusCompactControlHitSize: CGFloat = 30
    /// One row of the All Hosts summary card, divider included.
    static let statusHostRowHeight: CGFloat = 46
    /// All Hosts rows `statusContentSize` holds before they start squeezing the
    /// graph and sample rows down to their minimums.
    static let statusHostRowsFittingDefaultHeight = 3
    /// Screen height left clear of the status content for the popover arrow or
    /// the detached window's title bar.
    static let statusContentScreenMargin: CGFloat = 40

    static let detachedPopoverWindowStyleMask: NSWindow.StyleMask = [
        .titled,
        .closable,
        .miniaturizable,
        .resizable
    ]

    /// Opening size for the status content: the default, grown so every All
    /// Hosts row fits without scrolling, as far as the screen allows.
    static func statusContentSize(hostRowCount: Int, availableHeight: CGFloat) -> NSSize {
        let extraRows = max(0, hostRowCount - statusHostRowsFittingDefaultHeight)
        let preferredHeight = statusContentSize.height + CGFloat(extraRows) * statusHostRowHeight
        return NSSize(
            width: statusContentSize.width,
            height: max(statusContentMinimumSize.height, min(preferredHeight, availableHeight))
        )
    }

    static func shouldAllowUserDetachForMenuPopover() -> Bool {
        true
    }
}
