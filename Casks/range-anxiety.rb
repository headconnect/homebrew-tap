cask "range-anxiety" do
  version "2.1.0"
  sha256 "ecd3697124fd1912eb520d600612f132ad8be3fd558f7f0045711397085ba9ac"

  url "https://github.com/headconnect/range-anxiety/releases/download/v#{version}/range-anxiety-#{version}.dmg"
  name "Range Anxiety"
  desc "Menu bar app showing Claude, Codex and GitHub Copilot plan usage"
  homepage "https://github.com/headconnect/range-anxiety"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app is now Rations; its first launch takes over this cask's settings
  # and keychain item.
  deprecate! date: "2026-09-08", because: "was renamed to rations", replacement_cask: "headconnect/tap/rations"

  depends_on macos: :sonoma

  app "Range Anxiety.app"

  # Quit the running copy before an upgrade and start the new one afterwards.
  uninstall quit: "no.enso.range-anxiety"

  postflight_steps do
    run "/usr/bin/open", args: ["-b", "no.enso.range-anxiety"]
  end

  # Sign out in the app before uninstalling to remove the tokens from the keychain.
  zap trash: "~/Library/Preferences/no.enso.range-anxiety.plist"
end
