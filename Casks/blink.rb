cask "blink" do
  version "1.1.0"
  sha256 "ce051e4003a97422f6da4ab479873b31b29090d3a40309bacb5e62ba0d0162fc"

  url "https://github.com/D4G4/blink/releases/download/v#{version}/Blink.dmg"
  name "Blink"
  desc "Smart 20-20-20 eye break reminder with flow detection"
  homepage "https://github.com/D4G4/blink"

  depends_on macos: ">= :sonoma"

  # Skip quarantine since app is unsigned (open source — verify code at github.com/D4G4/blink)
  app "Blink.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Blink.app"],
                   sudo: false
  end

  caveats <<~EOS
    After install/upgrade, you may need to re-grant Accessibility permission:
      System Settings → Privacy & Security → Accessibility → toggle Blink
    This is required because the app binary changes on each update.
  EOS

  zap trash: [
    "~/Library/Application Support/Blink",
    "~/Library/Preferences/com.blink.app.plist",
  ]
end
