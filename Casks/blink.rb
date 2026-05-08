cask "blink" do
  version "1.2.0"
  sha256 "4b40c25732c6eb7533f511a999ea66929a8dacc91e594826e5aad3300390e7f1"

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
