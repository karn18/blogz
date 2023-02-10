class Version
  attr_reader :major, :minor, :patch, :build
  def initialize
    # @version = YAML.safe_load(File.read(File.join("config", "version.yml")))
    @version = File.read(File.join(Rails.root, "VERSION")).strip
    @major, @minor, @patch, @build = @version.split(".")
  end

  def compact
    [major, minor, patch].join(".")
  end

  def release
    self
  end

  def to_s
    @build.present? ? compact.concat("+#{build}") : compact
  end

  class << self
    def release
      new.release
    end

    def compact
      release.compact
    end
  end
end
