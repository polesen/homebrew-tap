class Datacow < Formula
  desc "Zero-config terminal database explorer, like k9s or lazygit but for databases"
  homepage "https://github.com/polesen/datacow"
  url "https://github.com/polesen/datacow/releases/download/v0.1.0/datacow-0.1.0.tar.gz"
  sha256 "c22062d02e552fdcf63eb6fb4f7f14127483ec6fd321df3ba7f9a44299795571"
  license "MIT"
  head "https://github.com/polesen/datacow.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./cmd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/datacow --version")
  end
end
