cask "toolbox" do
  version "0.1.0"
  sha256 "427b76d3f41b1e01f7d15c6f21bd3ac8d14ff3b5fe21e58b8c0ec68b63deb6ba"

  url "https://github.com/Ale-Newport/swapIT/releases/download/v#{version}/Toolbox_#{version}_universal.dmg"
  name "Toolbox"
  desc "Local-first file tools with a radial menu for Finder"
  homepage "https://github.com/Ale-Newport/swapIT"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "Toolbox.app"

  # The app is ad-hoc signed (no Developer ID yet), so Gatekeeper would refuse a
  # quarantined copy. This mirrors what the project's own installer does.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Toolbox.app"]
  end

  zap trash: [
    "~/Library/Application Support/app.toolbox.desktop",
    "~/Library/Application Support/Toolbox",
    "~/Library/Caches/app.toolbox.desktop",
    "~/Library/Caches/toolbox",
    "~/Library/Preferences/app.toolbox.desktop.plist",
    "~/Library/Services/Open in Toolbox.workflow",
    "~/Library/WebKit/app.toolbox.desktop",
    "~/Library/WebKit/toolbox",
  ]

  caveats <<~EOS
    Toolbox is ad-hoc signed, not notarised: this cask removes the quarantine
    flag after installing so it opens normally.

    Most tools use programs from Homebrew. Install the ones you need, e.g.:
      brew install ffmpeg imagemagick ghostscript poppler qpdf tesseract
  EOS
end
