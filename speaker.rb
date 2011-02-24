require 'os_functions'

include OsFunctions

module Speaker

  def say line
    if is_mac?
      system "say \"#{line}\""
    elsif is_linux?
      system "espeak \"#{line}\""
    end
  end

end

