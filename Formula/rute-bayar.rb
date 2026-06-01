class RuteBayar < Formula
  desc "Payment router CLI and webhook daemon for Indonesian payment gateways"
  homepage "https://github.com/pendig/rute-bayar"
  version "0.1.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pendig/rute-bayar/releases/download/v\#{version}/rutebayar-darwin-arm64"
      sha256 "6bd3531ccb574e98353dcbf9e4d18c83c5c3ca65e844eae256930ef8f589b5c8"
    else
      url "https://github.com/pendig/rute-bayar/releases/download/v\#{version}/rutebayar-darwin-amd64"
      sha256 "2eed4307f5f7455418985f57bb4f13fc0dc0aa69274f212cd2bcd606be8629a3"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/pendig/rute-bayar/releases/download/v\#{version}/rutebayar-linux-arm64"
      sha256 "56108bcd5387cb8b5c39eac472e2ee67d7138d28db8af1e3c3d52e16e915ce47"
    else
      url "https://github.com/pendig/rute-bayar/releases/download/v\#{version}/rutebayar-linux-amd64"
      sha256 "c16e2f6ba83f238f9ab33a0a63f2f5f656ba732199fedea3e683a70e935bb3d8"
    end
  end

  def install
    bin.install Dir["rutebayar-*"].first => "rutebayar"
  end

  test do
    system bin/"rutebayar", "version"
  end
end
