cask "rations" do
  version "2.2.2"
  sha256 "6261ec2d820f0b5fe565fc3e881dc00da9aa1bd208d6e96f60f4a93a14be7526"

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
