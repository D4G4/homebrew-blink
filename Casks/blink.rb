cask "blink" do
  version "5.2.1"
  sha256 "bf187d516c6f26e50800577fd5b72255efe90766c329876023af5477c5953459"

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
