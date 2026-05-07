cask "blink" do
  version "1.1.0"
  sha256 "ce051e4003a97422f6da4ab479873b31b29090d3a40309bacb5e62ba0d0162fc"

  url "https://github.com/D4G4/blink/releases/download/v#{version}/Blink.dmg"
  name "Blink"
  desc "Smart 20-20-20 eye break reminder with flow detection"
  homepage "https://github.com/D4G4/blink"

  depends_on macos: ">= :sonoma"

  app "Blink.app"

  caveats <<~EOS
    On first launch, macOS will show a Gatekeeper dialog — click Open.
    Then grant Accessibility when prompted:
      System Settings → Privacy & Security → Accessibility → toggle Blink
  EOS

  zap trash: [
    "~/Library/Application Support/Blink",
    "~/Library/Preferences/com.blink.app.plist",
  ]
end
