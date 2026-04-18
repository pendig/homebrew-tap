class Videocut < Formula
  desc "AI-powered video automation tool for Content Creators"
  homepage "https://github.com/pendig/videocut-cli"
  url "https://github.com/pendig/videocut-cli/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "05c9894f056d961c49ec70200ebc49c6b81543b24cba92870fad87c5d778cdc5"
  license "MIT"

  depends_on "ffmpeg"
  depends_on "node"
  depends_on "python@3.11"

  def install
    # Create an isolated virtualenv in libexec
    system "python3.11", "-m", "venv", libexec
    
    # Install dependencies and the package itself
    system libexec/"bin/pip", "install", "--upgrade", "pip", "setuptools"
    system libexec/"bin/pip", "install", "."
    
    # Symlink the binary to the bin directory
    bin.install_symlink libexec/"bin/videocut"
  end

  test do
    system "#{bin}/videocut", "doctor"
  end
end
