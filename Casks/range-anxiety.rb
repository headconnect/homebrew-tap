cask "range-anxiety" do
  version "2.0.0"
  sha256 "750d6534122d41ef922e3bfe244b925ae03676b4a525d3eeaf4dfe7d31982977"

  url "https://github.com/headconnect/range-anxiety/releases/download/v#{version}/range-anxiety-#{version}.dmg"
  name "Range Anxiety"
  desc "Menu bar app showing Claude, Codex and GitHub Copilot plan usage"
  homepage "https://github.com/headconnect/range-anxiety"

  livecheck do
    url :url
    strategy :github_latest
  end

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
