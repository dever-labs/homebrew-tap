cask "postly" do
  version "0.8.1"

  on_arm do
    url "https://github.com/dever-labs/postly/releases/download/v#{version}/Postly-#{version}-arm64.dmg"
    sha256 "4629786ebcc6a3c2858a8ab0eda94463246cff87f5f7f61e87466467b5f3fabc"
  end

  on_intel do
    url "https://github.com/dever-labs/postly/releases/download/v#{version}/Postly-#{version}.dmg"
    sha256 "4971945d8e29b52c20948a8900af5de9078c72e9e652976e03ea5439b85c833b"
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
