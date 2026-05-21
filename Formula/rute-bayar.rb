class RuteBayar < Formula
  desc "Payment router CLI and webhook daemon for Indonesian payment gateways"
  homepage "https://github.com/pendig/rute-bayar"
  version "0.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pendig/rute-bayar/releases/download/v0.1.4/rutebayar-darwin-arm64"
      sha256 "17a8d5d40dcce471dfd310dca2ffd39a5c32229588741d924347ccec9bdbc850"
    else
      url "https://github.com/pendig/rute-bayar/releases/download/v0.1.4/rutebayar-darwin-amd64"
      sha256 "68e6d563d5ca560ea4ccc5f52fa5956e70f96311bf3c5414ec875b004fda5c31"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/pendig/rute-bayar/releases/download/v0.1.4/rutebayar-linux-arm64"
      sha256 "301568f4fee924506a0796ff9eade7b646fdceb9c77c8625be0293b59dc46482"
    else
      url "https://github.com/pendig/rute-bayar/releases/download/v0.1.4/rutebayar-linux-amd64"
      sha256 "ec5fb9eae690b8678853c34096d69b0b29b2399228d57e4f13a5d51d2fa37225"
    end
  end

  def install
    bin.install Dir["rutebayar-*"].first => "rutebayar"
  end

  test do
    system bin/"rutebayar", "version"
  end
end
