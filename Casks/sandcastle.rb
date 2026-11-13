cask "sandcastle" do
  version "0.2.1"
  sha256 "9a99b34a6e97a21c8cb95d9c7b07d98268a649841d97babb238dd1e6c75b6cf2"

  url "https://github.com/cburkhal/sandcastle/releases/download/v#{version}/sandcastle_#{version}_aarch64.dmg"
  name "sandcastle"
  desc "One OpenCode instance per Git repo, each in its own Apple container VM"
  homepage "https://github.com/cburkhal/sandcastle"

  conflicts_with formula: "sandcastle"
  depends_on arch: :arm64
  depends_on formula: "bitwarden-cli"
  depends_on macos: :tahoe

  app "sandcastle.app"
  binary "#{appdir}/sandcastle.app/Contents/MacOS/sandcastle"

  zap trash: [
    "~/.config/sandcastle",
    "~/Library/Application Support/sandcastle",
  ]

  caveats <<~EOS
    sandcastle also needs Apple's `container`, which is not in Homebrew:
      https://github.com/apple/container/releases
    Then run `sandcastle init` once and `sandcastle doctor` to check the setup.
    `brew uninstall` leaves the box image, networks and volumes in `container`,
    and the line `anchor "sandcastle/*"` in /etc/pf.conf.
  EOS
end
