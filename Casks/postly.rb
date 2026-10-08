cask "postly" do
  version "0.8.4"

  on_arm do
    url "https://github.com/dever-labs/postly/releases/download/v#{version}/Postly-#{version}-arm64.dmg"
    sha256 "2ae934886457a980dc6955aaec5f6a5f5f842950078c1240a04a9ad50c303c1e"
  end

  on_intel do
    url "https://github.com/dever-labs/postly/releases/download/v#{version}/Postly-#{version}.dmg"
    sha256 "f03590c6991fbfd6eab92a546b8acf87fb3e40c691141e1d544ebb23ed030b77"
  end

  name "Postly"
  desc "API client for developers"
  homepage "https://github.com/dever-labs/postly"

  app "Postly.app"

  # Ad-hoc re-sign so macOS 26+ dyld Team ID enforcement doesn't block launch.
  # The unsigned build has no Team ID but the bundled Electron Framework does;
  # re-signing with "-" makes all components consistent.
  #
  # Remove the quarantine attribute so Gatekeeper doesn't block the unsigned
  # app on first launch — no Apple Developer account required.
  postflight do
    system_command "/usr/bin/codesign",
                   args: ["--deep", "--force", "--sign", "-", "#{appdir}/Postly.app"],
                   sudo: true
    system_command "/usr/bin/xattr",
                   args: ["-rd", "com.apple.quarantine", "#{appdir}/Postly.app"],
                   sudo: true
  end

  zap trash: [
    "~/Library/Application Support/Postly",
    "~/Library/Logs/Postly",
    "~/Library/Preferences/com.deverlabs.postly.plist",
  ]
end
