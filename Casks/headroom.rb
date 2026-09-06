cask "headroom" do
  version "1.1.0"
  sha256 "407ff8b8d552e45facc474725fce08d1247065407b2c6b00ae76ce111d36d7f1"

  url "https://github.com/headconnect/headroom/releases/download/v#{version}/headroom-#{version}.dmg"
  name "headroom"
  desc "Menu bar app showing Claude, Codex and GitHub Copilot plan usage"
  homepage "https://github.com/headconnect/headroom"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "headroom.app"

  # Sign out in the app before uninstalling to remove the tokens from the keychain.
  zap trash: "~/Library/Preferences/no.enso.headroom.plist"
end
