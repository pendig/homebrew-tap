class RuteBayar < Formula
  desc "Payment router CLI and webhook daemon for Indonesian payment gateways"
  homepage "https://github.com/pendig/rute-bayar"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pendig/rute-bayar/releases/download/v0.1.0/rute-bayar-darwin-arm64"
      sha256 "c6b8f17108b5bd1be818d74d26c9e7c2f4eb5d0fbdaa61845f40921d177a6d4a"
    else
      url "https://github.com/pendig/rute-bayar/releases/download/v0.1.0/rute-bayar-darwin-amd64"
      sha256 "f2670afbc553b0ce7c364cba12aebef6734aab1324d7736c902aee9fbeb3fddb"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/pendig/rute-bayar/releases/download/v0.1.0/rute-bayar-linux-arm64"
      sha256 "a178258f16abdadff9c948f69403777e8b6acf18dd8ef341fa49925ddae8681b"
    else
      url "https://github.com/pendig/rute-bayar/releases/download/v0.1.0/rute-bayar-linux-amd64"
      sha256 "a4607193a3f0d5522a7f637587346dbbe999a177fc672390f976b96e0c03f18d"
    end
  end

  def install
    bin.install Dir["rute-bayar-*"].first => "rute-bayar"
  end

  test do
    system bin/"rute-bayar", "version"
  end
end
