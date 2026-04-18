class Videocut < Formula
  include Language::Python::Virtualenv

  desc "AI-powered video automation tool for Content Creators"
  homepage "https://github.com/pendig/videocut-cli"
  url "https://github.com/pendig/videocut-cli/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "177b3f04e25a0fdbdf6154254ef801d82301a6ec0d343917e41a6f6eba18c918"
  license "MIT"

  depends_on "ffmpeg"
  depends_on "node"
  depends_on "python@3.9"

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/videocut", "doctor"
  end
end
