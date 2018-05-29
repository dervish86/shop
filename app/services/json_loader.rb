class JSONLoader
  def initialize(file_path)
    @file_path = file_path
  end

  def load
    if file_valid?
      JSON.parse(file)
    else
      fail ArgumentError, 'Check path to file and file format'
    end
  end

  private

  def file_valid?
    File.file?(@file_path) && File.extname(@file_path) == '.json'
  end

  def file
    File.read(@file_path)
  end
end
