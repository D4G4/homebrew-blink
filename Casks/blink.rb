cask "blink" do
  version "5.0.4-pat-test"
  sha256 "8d5b90a897ab5b0acad841aeedd42b92d7971d50fe2063f24094e7421aa1a29d"

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
