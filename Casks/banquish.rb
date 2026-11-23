cask "banquish" do
  # `npm run release` in the Banquish repo sets version and sha256 on each release.
  version "0.4.12"
  sha256 "60684c5863e7f2b2125aebaaa1c5f5b804433bed2c735adbf27536c192a036b2"

  url "https://download.banquish.space/Banquish-#{version}-arm64.dmg"
  name "Banquish"
  desc "Browser where an agent answers with the live web"
  homepage "https://banquish.space/"

  livecheck do
    url "https://download.banquish.space/latest-mac.yml"
    strategy :electron_builder
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Banquish.app"

  uninstall quit: "space.banquish.browser"

  # ~/Library/Application Support/Banquish is also where the older Swift Banquish (another bundle
  # id) keeps its data: zapping this cask removes that too.
  zap trash: [
    "~/.banquish",
    "~/Library/Application Support/Banquish",
    "~/Library/Application Support/Google/Chrome/NativeMessagingHosts/com.banquish.send.json",
    "~/Library/Caches/banquish-updater",
    "~/Library/Caches/space.banquish.browser",
    "~/Library/Caches/space.banquish.browser.ShipIt",
    "~/Library/HTTPStorages/space.banquish.browser",
    "~/Library/Preferences/space.banquish.browser.plist",
    "~/Library/Saved Application State/space.banquish.browser.savedState",
  ]
end
