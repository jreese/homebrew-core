class ApibuilderCli < Formula
  desc "Command-line interface to generate clients for api builder"
  homepage "https://www.apibuilder.io"
  url "https://github.com/apicollective/apibuilder-cli/archive/0.1.10.tar.gz"
  sha256 "6acfa0b304c6f11ee5ce661a3886edc6c3e6b8351414da5d70b1bcd13670ffa4"

  bottle :unneeded

  def install
    system "./install.sh", prefix
  end

  test do
    (testpath/"config").write <<-EOS.undent
      [default]
      token = abcd1234
    EOS
    assert_match "Profile default:",
                 shell_output("#{bin}/read-config --path config")
    assert_match "Could not find apibuilder configuration directory",
                 shell_output("#{bin}/apibuilder", 1)
  end
end
