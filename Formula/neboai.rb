# Homebrew formula template for the neboai CLI. The release workflow renders it
# with envsubst (PKG_VERSION + one SHA per binary) and pushes the result to
# NeboLoop/homebrew-tap as Formula/neboai.rb, so `brew tap NeboLoop/tap &&
# brew install neboai` installs the release that was just tagged.
class Neboai < Formula
  desc "Build, validate and publish to the NeboAI marketplace"
  homepage "https://neboai.com/learn/neboai"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/NeboLoop/publisher/releases/download/v0.2.0/neboai-darwin-arm64"
      sha256 "5f8f5d3f2a51fc9565142fb88d1a6e48bd6b348d6e348deeab9d798274180e8d"
    end
    on_intel do
      url "https://github.com/NeboLoop/publisher/releases/download/v0.2.0/neboai-darwin-amd64"
      sha256 "9b9d856c70fc2dc00f72568f4b5d5c9220eedbe368203a988ecd1d400e6fe4f0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/NeboLoop/publisher/releases/download/v0.2.0/neboai-linux-arm64"
      sha256 "2966654adb017a9e21c115b777561bb08e8bf64163f95f242f178476b6c90802"
    end
    on_intel do
      url "https://github.com/NeboLoop/publisher/releases/download/v0.2.0/neboai-linux-amd64"
      sha256 "b31392e530f4e1c997daa1cc9e51ba141cb86eb8889c4360c062bdceb82109ef"
    end
  end

  def install
    bin.install Dir["neboai-*"].first => "neboai"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/neboai --version")
  end
end
