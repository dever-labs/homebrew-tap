cask "postly" do
  version "0.5.2"

  on_arm do
    url "https://github.com/dever-labs/postly/releases/download/v#{version}/Postly-#{version}-arm64.dmg"
    sha256 "951d2702bce7cfd7b6a7b7e92a151a620cf61cfcdddadb31a420658abbcb4401"
  end

  on_intel do
    url "https://github.com/dever-labs/postly/releases/download/v#{version}/Postly-#{version}.dmg"
    sha256 "a732f0db5606385201d07300aa5f98859c6a1500b81b3c116a34ba344665f428"
  end

  name "Postly"
  desc "API client for developers"
  homepage "https://github.com/dever-labs/postly"

  app "Postly.app"

  # Ad-hoc re-sign so macOS 26+ dyld Team ID enforcement doesn't block launch.
  # The unsigned build has no Team ID but the bundled Electron Framework does;
  # re-signing with "-" makes all components consistent.
  postflight do
    system_command "/usr/bin/codesign",
                   args: ["--deep", "--force", "--sign", "-", "#{appdir}/Postly.app"],
                   sudo: true
  end

  zap trash: [
    "~/Library/Application Support/Postly",
    "~/Library/Logs/Postly",
    "~/Library/Preferences/com.deverlabs.postly.plist",
  ]
end
