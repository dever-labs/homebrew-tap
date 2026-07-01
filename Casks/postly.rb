cask "postly" do
  version "0.8.0"

  on_arm do
    url "https://github.com/dever-labs/postly/releases/download/v#{version}/Postly-#{version}-arm64.dmg"
    sha256 "0ac80839038b77c6d77ce40b75bbb3d1ee29e1fcb2c88124b4baca332952fe50"
  end

  on_intel do
    url "https://github.com/dever-labs/postly/releases/download/v#{version}/Postly-#{version}.dmg"
    sha256 "9c3385ff0956bb0929159a8358b455e57e8a1d67256de1e9d9788427a96831db"
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
