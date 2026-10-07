cask "banquish" do
  # `npm run release` in the Banquish repo sets version and sha256 on each release.
  version "0.1.1"
  sha256 "34d6ee76c3ef9d3c20b7e0107e0b7d38cf6b42ddaacc5140b6bf81bc912899fc"

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
