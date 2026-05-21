class RuteBayar < Formula
  desc "Payment router CLI and webhook daemon for Indonesian payment gateways"
  homepage "https://github.com/pendig/rute-bayar"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pendig/rute-bayar/releases/download/v0.1.2/rutebayar-darwin-arm64"
      sha256 "a5b786a3a777493f0a1bae14f9a0787d3033ca1d9a0bad4790388900535b1afc"
    else
      url "https://github.com/pendig/rute-bayar/releases/download/v0.1.2/rutebayar-darwin-amd64"
      sha256 "a9eca34a0faa6ea6f6c86be460e4ec6abfb389edeaf28943ef4c58792c15366f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/pendig/rute-bayar/releases/download/v0.1.2/rutebayar-linux-arm64"
      sha256 "f2e224054890eca0e669f2a7e0c39a5119c46b5bc2c51d30b0371c36a9d3b857"
    else
      url "https://github.com/pendig/rute-bayar/releases/download/v0.1.2/rutebayar-linux-amd64"
      sha256 "f73825913c2e37a46bbd4a4583f2ddaa72d2638eca7bfbe5c639bc83faf8f289"
    end
  end

  def install
    bin.install Dir["rutebayar-*"].first => "rutebayar"
  end

  test do
    system bin/"rutebayar", "version"
  end
end
