cask "rations" do
  version "2.1.1"
  sha256 "d62c73f4b429d968899e8c57008ce4da75be94f97939de6abcba97b4942ad0b4"

  url "https://github.com/headconnect/rations/releases/download/v#{version}/rations-#{version}.dmg"
  name "Rations"
  desc "Menu bar app showing Claude, Codex and GitHub Copilot plan usage"
  homepage "https://github.com/headconnect/rations"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Rations.app"

  postflight_steps do
    run "/usr/bin/open", args: ["-b", "no.enso.rations"]
  end

  # Quit the running copy before an upgrade and start the new one afterwards.
  uninstall quit: "no.enso.rations"

  # Sign out in the app before uninstalling to remove the tokens from the keychain.
  zap trash: "~/Library/Preferences/no.enso.rations.plist"
end
