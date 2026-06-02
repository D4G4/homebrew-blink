cask "blink" do
  version "5.0.5"
  sha256 "828fe9efca0a88500659f1e399efbafa89bd1404c8fff75550a07bc6092b0a47"

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
