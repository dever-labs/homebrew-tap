cask "postly" do
  version "0.5.1"

  on_arm do
    url "https://github.com/dever-labs/postly/releases/download/v#{version}/Postly-#{version}-arm64.dmg"
    sha256 "5c58d628f5ff81caad2ba2b8994c6a08d365ff588a6b130d97067e7cfd2b7f65"
  end

  on_intel do
    url "https://github.com/dever-labs/postly/releases/download/v#{version}/Postly-#{version}.dmg"
    sha256 "e4d1f854e91f4afaae114dd1a459f4a7a421c72f403d1e16342663f654c2702d"
  end

  name "Postly"
  desc "API client for developers"
  homepage "https://github.com/dever-labs/postly"

  app "Postly.app"

  zap trash: [
    "~/Library/Application Support/Postly",
    "~/Library/Logs/Postly",
    "~/Library/Preferences/com.deverlabs.postly.plist",
  ]
end
