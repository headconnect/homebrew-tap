cask "headroom" do
  version "2.0.0"
  sha256 "750d6534122d41ef922e3bfe244b925ae03676b4a525d3eeaf4dfe7d31982977"

  url "https://github.com/headconnect/headroom/releases/download/v#{version}/headroom-#{version}.dmg"
  name "headroom"
  desc "Menu bar app showing Claude, Codex and GitHub Copilot plan usage"
  homepage "https://github.com/headconnect/headroom"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app is now Range Anxiety; its first launch takes over this cask's
  # settings and keychain item.
  deprecate! date: "2026-09-07", because: "was renamed to range-anxiety", replacement_cask: "headconnect/tap/range-anxiety"

  depends_on macos: :sonoma

  app "headroom.app"

  # Quit the running copy before an upgrade and start the new one afterwards.
  uninstall quit: "no.enso.headroom"

  postflight_steps do
    run "/usr/bin/open", args: ["-b", "no.enso.headroom"]
  end

  # Sign out in the app before uninstalling to remove the tokens from the keychain.
  zap trash: "~/Library/Preferences/no.enso.headroom.plist"
end
