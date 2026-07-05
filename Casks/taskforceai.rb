# typed: false
# frozen_string_literal: true

cask 'taskforceai' do
  version '0.5.4'

  on_arm do
    url "https://taskforceai.chat/api/download/desktop/macos-arm64/#{version}",
        verified: 'taskforceai.chat/'
    sha256 '4f11c69dcb077c041b9acf33e5c74e3c3d72112b3d8046aa5f08259e009b8b60'
  end

  on_intel do
    url "https://taskforceai.chat/api/download/desktop/macos-x64/#{version}",
        verified: 'taskforceai.chat/'
    sha256 'e86e054e394010468a25946cadaf0039283356634ed1f5cb435412bcd8fc6ff3'
  end

  name 'TaskForceAI'
  desc 'Desktop application for TaskForceAI'
  homepage 'https://taskforceai.chat/'

  auto_updates true

  app 'TaskForceAI.app'

  uninstall quit: 'com.taskforceai.desktop'

  zap trash: [
    '~/Library/Application Support/com.taskforceai.desktop',
    '~/Library/Caches/com.taskforceai.desktop',
    '~/Library/Preferences/com.taskforceai.desktop.plist',
    '~/Library/Saved Application State/com.taskforceai.desktop.savedState',
    '~/Library/WebKit/com.taskforceai.desktop'
  ]
end
