require 'fileutils'
require 'open3'
require 'tmpdir'

# `gem install --user-install` puts executables in ~/.gem/ruby/<ver>/bin; env.sh adds them to PATH.
RSpec.describe 'aliases/env.sh gem bin PATH' do
  env_sh = File.expand_path('../aliases/env.sh', __dir__)

  def source(shell, home, env_sh)
    Open3.capture2e({ 'HOME' => home }, shell, '-c', ". #{env_sh}; echo \"$PATH\"")
  end

  %w[zsh bash].each do |shell|
    it "prints no error under #{shell} when ~/.gem has no bin yet (zsh errors on an unmatched glob)" do
      Dir.mktmpdir do |home|
        FileUtils.mkdir_p("#{home}/.gem/ruby/2.6.0/cache")
        out, status = source(shell, home, env_sh)
        expect(status).to be_success
        expect(out.lines.size).to eq(1), out # just the PATH line
      end
    end

    it "puts the gem bin directory on PATH under #{shell}" do
      Dir.mktmpdir do |home|
        FileUtils.mkdir_p("#{home}/.gem/ruby/2.6.0/bin")
        out, = source(shell, home, env_sh)
        expect(out.split(':')).to include("#{home}/.gem/ruby/2.6.0/bin")
      end
    end
  end
end
