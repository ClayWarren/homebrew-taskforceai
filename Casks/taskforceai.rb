# typed: false
# frozen_string_literal: true

cask 'taskforceai' do
  version '0.5.6'

  on_arm do
    url "https://taskforceai.chat/api/download/desktop/macos-arm64/#{version}",
        verified: 'taskforceai.chat/'
    sha256 '4b3e1692ce90ea6775e97a15544631663abcb348d931a3fa7d1d27854f945d21'
  end

  on_intel do
    url "https://taskforceai.chat/api/download/desktop/macos-x64/#{version}",
        verified: 'taskforceai.chat/'
    sha256 'bbf2fa69fbd4aa6f9957cc13acb8781293ba7043f5976af2749a419a3c8ab62b'
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
