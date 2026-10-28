cask "rations" do
  version "2.4.0"
  sha256 "0ccbac6e3f5211afd8d77570c99cad0ceea4f2ea83bd76136eb86c95d8917d31"

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
