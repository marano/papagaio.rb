module OsFunctions

  def is_mac?
    RUBY_PLATFORM.downcase.include?("darwin")
  end

  def is_windows?
    RUBY_PLATFORM.downcase.include?("mswin")
  end

  def is_linux?
    RUBY_PLATFORM.downcase.include?("linux")
  end
end
