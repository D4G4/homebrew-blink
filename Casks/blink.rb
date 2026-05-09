cask "blink" do
  version "1.5.1"
  sha256 "6d35b10e96c8f902d5cc854acdcb718b2c4673a3db15fe76d35218c78cdee215"

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
