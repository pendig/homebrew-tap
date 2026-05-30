class RuteBayar < Formula
  desc "Payment router CLI and webhook daemon for Indonesian payment gateways"
  homepage "https://github.com/pendig/rute-bayar"
  version "0.1.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pendig/rute-bayar/releases/download/v\#{version}/rutebayar-darwin-arm64"
      sha256 "d9b1ab1c16b62db6e8758ff66ed2f1c3771c3a1ccfb31221211f58314490db20"
    else
      url "https://github.com/pendig/rute-bayar/releases/download/v\#{version}/rutebayar-darwin-amd64"
      sha256 "931cbcd67bf96bd237ef076652c95b3b28f0a3275c106be78c924a66b41000a7"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/pendig/rute-bayar/releases/download/v\#{version}/rutebayar-linux-arm64"
      sha256 "7408cc0961b994c559982a980874b18b17479fa2ff5bc316d0dc3f0c1b8f770b"
    else
      url "https://github.com/pendig/rute-bayar/releases/download/v\#{version}/rutebayar-linux-amd64"
      sha256 "575fcfbec4be75377e431a2c8597f82577585c0652d8e96effee9e7e8e86ce37"
    end
  end

  def install
    bin.install Dir["rutebayar-*"].first => "rutebayar"
  end

  test do
    system bin/"rutebayar", "version"
  end
end
