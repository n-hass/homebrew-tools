class Raph < Formula
  desc "AWS Profile Handler - Shell Profile Switching & Executor"
  homepage "https://github.com/n-hass/raph"
  license "MIT"
  url "https://github.com/n-hass/raph/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "9d3511f6043b795e957e3a408a5e3606233fc30a93093564bad72a609ee8d797"
  head "https://github.com/n-hass/raph.git"

  # livecheck do
  #   url :stable
  #   regex(/v?(\d+(?:[._]\d+)+)/i)
  #   strategy :github_latest
  # end

  # bottle do
  #   rebuild 1
  #   sha256 cellar: :any,    sonoma:   ""
  # end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    bin.install "_raph"
  end

  def caveats
    <<~EOS
      Add the following line to your shell .rc:

        alias raph="source _raph"

    EOS
  end

  test do
    system "#{bin}/_raph", "-V"
  end
end
