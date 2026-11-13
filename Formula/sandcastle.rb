class Sandcastle < Formula
  desc "One OpenCode instance per Git repo, each in its own Apple container VM"
  homepage "https://github.com/cburkhal/sandcastle"
  url "https://github.com/cburkhal/sandcastle/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "89e82cc370474b939ea732c7a631a4bf1384edf34238123950d5e326194e363b"
  license "MIT"
  head "https://github.com/cburkhal/sandcastle.git", branch: "main"

  depends_on "rust" => :build
  depends_on arch: :arm64
  depends_on "bitwarden-cli"
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args
  end

  def caveats
    <<~EOS
      sandcastle also needs Apple's `container`, which is not in Homebrew:
        https://github.com/apple/container/releases
      Then run `sandcastle init` once and `sandcastle doctor` to check the setup.
    EOS
  end

  test do
    assert_match "sandcastle", shell_output("#{bin}/sandcastle --version")
  end
end
