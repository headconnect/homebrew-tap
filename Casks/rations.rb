cask "rations" do
  version "2.2.0"
  sha256 "f67a98182e5b487354610ed06229dc8e798282de6026e838947fb37b4816309d"

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

  # Quit the running copy before an upgrade so the app bundle can be replaced.
  uninstall quit: "no.enso.rations"

  # Sign out in the app before uninstalling to remove the tokens from the keychain.
  zap trash: "~/Library/Preferences/no.enso.rations.plist"

  caveats <<~EOS
    Rations is a menu bar app. Launch it to get started:
      open -a Rations
  EOS
end
