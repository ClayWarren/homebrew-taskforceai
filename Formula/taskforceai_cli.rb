# typed: false
# frozen_string_literal: true

class TaskforceaiCli < Formula
  desc 'Command-line interface for TaskForceAI'
  homepage 'https://taskforceai.chat'
  version "0.11.9"
  license 'MIT'

  on_macos do
    on_arm do
      url "https://github.com/ClayWarren/taskforceai-open/releases/download/v0.11.9/taskforceai-cli-darwin-arm64.tar.gz"
      sha256 "1d5c4d544f9fd3b8c9832327c19e58ef3cf8c95a051d98843f2eb008b5405126"
    end
    on_intel do
      url "https://github.com/ClayWarren/taskforceai-open/releases/download/v0.11.9/taskforceai-cli-darwin-amd64.tar.gz"
      sha256 "e67c0c502340dae1b7f2bb6dbb158eaeef1e426aff661eea24b096601d123ec6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ClayWarren/taskforceai-open/releases/download/v0.11.9/taskforceai-cli-linux-arm64.tar.gz"
      sha256 "39845073bdce4ad5722500d0d8f2ef0d2a514df99bc78e661d4e68f284ee0962"
    end
    on_intel do
      url "https://github.com/ClayWarren/taskforceai-open/releases/download/v0.11.9/taskforceai-cli-linux-amd64.tar.gz"
      sha256 "a95e744226a93414adc9b3b1dccca5e4b96e6c8d2d097c1c00cbba84500c2a3b"
    end
  end

  def install
    if OS.mac?
      suffix = Hardware::CPU.arm? ? "darwin-arm64" : "darwin-amd64"
    elsif OS.linux?
      suffix = Hardware::CPU.arm? ? "linux-arm64" : "linux-amd64"
    else
      odie "Unsupported platform"
    end

    bin.install "taskforceai-#{suffix}" => "taskforceai"
    bin.install "taskforceai-app-server-#{suffix}" => "taskforceai-app-server"
  end

  test do
    assert_match 'Usage:', shell_output("#{bin}/taskforceai --help")
  end
end
