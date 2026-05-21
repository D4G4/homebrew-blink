cask "blink" do
  version "3.3.2"
  sha256 "f5d02e43e4a0a55f80c2ca81f672de2817188066ee9ad2ca59ad167f7010a9f1"

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
    "~/Library/Preferences/com.blink20.app.plist",
  ]
end
