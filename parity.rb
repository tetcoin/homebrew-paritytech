require 'formula'

class Parity < Formula
  homepage 'https://github.com/paritytech/parity'
  version '2.2.10'
  url 'https://releases.parity.io/ethereum/v2.2.10/x86_64-apple-darwin/parity'
  sha256 '6267f80dcf6709e40074b8bf369999be0615bbc075c281cbe483cfe0095801e7'

  devel do
    version '2.3.3'
    url 'https://releases.parity.io/ethereum/v2.3.3/x86_64-apple-darwin/parity'
    sha256 '83edca7466905a305c88303cc6f96a4cec495c194df557dd6046243a10d9a483'
  end

  head do
    version '2.4.0'
    url 'https://releases.parity.io/ethereum/nightly/x86_64-apple-darwin/parity'
  end

  def install
    bin.install "parity"
  end

  test do
    system "#{bin}/parity", "--version"
  end

  plist_options :manual => "parity"

  def plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>RunAtLoad</key>
        <true/>
        <key>KeepAlive</key>
        <true/>
        <key>ThrottleInterval</key>
        <integer>300</integer>
        <key>ProgramArguments</key>
        <array>
          <string>#{prefix}/bin/parity</string>
        </array>
        <key>WorkingDirectory</key>
        <string>#{HOMEBREW_PREFIX}</string>
      </dict>
    </plist>
    EOS
  end
end
