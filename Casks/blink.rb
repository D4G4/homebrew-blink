cask "blink" do
  version "5.0.1"
  sha256 "18c56ea60da292d8108cd43d4b77ba93ed4dcafd326ec171f30f65b8db6a202d"

  url "https://github.com/D4G4/blink/releases/download/v#{version}/Blink.dmg"
  name "Blink"
  desc "Smart 20-20-20 eye break reminder with flow detection"
  homepage "https://github.com/D4G4/blink"

  # v5.0.0+ self-updates via Sparkle. Tell brew so it doesn't warn when
  # the installed version drifts ahead of the cask between releases.
  auto_updates true

  depends_on macos: ">= :sonoma"

  app "Blink.app"

  caveats <<~EOS
    Grant Input Monitoring when prompted:
      System Settings → Privacy & Security → Input Monitoring → toggle Blink
  EOS

  zap trash: [
    "~/Library/Application Support/Blink",
    "~/Library/Preferences/com.blink20.app.plist",
  ]
end
