cask "blink" do
  version "1.5.0"
  sha256 "a293c2f341fda02ef5c2463f9b94de1006a979c7cc410c5980bda4551648690a"

  url "https://github.com/D4G4/blink/releases/download/v#{version}/Blink.dmg"
  name "Blink"
  desc "Smart 20-20-20 eye break reminder with flow detection"
  homepage "https://github.com/D4G4/blink"

  depends_on macos: ">= :sonoma"

  app "Blink.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Blink.app"],
                   sudo: false
  end

  caveats <<~EOS
    Grant Accessibility when prompted:
      System Settings → Privacy & Security → Accessibility → toggle Blink
  EOS

  zap trash: [
    "~/Library/Application Support/Blink",
    "~/Library/Preferences/com.blink.app.plist",
  ]
end
