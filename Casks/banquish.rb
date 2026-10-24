cask "banquish" do
  # `npm run release` in the Banquish repo sets version and sha256 on each release.
  version "0.4.0"
  sha256 "e373b8d5a05d886607ab607f65d55b8f227b363c75a912014424e821c8d73ebe"

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
