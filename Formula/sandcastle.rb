class Sandcastle < Formula
  desc "One OpenCode instance per Git repo, each in its own Apple container VM"
  homepage "https://github.com/cburkhal/sandcastle"
  url "https://github.com/cburkhal/sandcastle/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "a1a85633a0d76817fbb7b2c0565a2ca4ea5327ace3aef867acab5219d69af87c"
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
