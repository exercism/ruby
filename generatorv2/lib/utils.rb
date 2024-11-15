module Utils
  def toml(path = "./exercises/practice/#{@exercise}/.meta/tests.toml")
    raise "Toml not found: #{path}" unless File.exist?(path)

    uuid = TomlRB.load_file(path)
    uuid = uuid.filter do |_k, v|
      v.none? { |k, inner_value| k == "include" && !inner_value }
    end
    uuid.keys
  end

  def remote_files
    url = URI.parse("https://raw.githubusercontent.com/exercism/problem-specifications/main/exercises/#{@exercise}/canonical-data.json")
    response = Net::HTTP.get_response(url)
    case response
    when Net::HTTPSuccess
      JSON.parse(response.body)
    when Net::HTTPNotFound
      check_for_local_canonical_data
    else
      raise "Error while requesting the #{@exercise} data file from GitHub... " \
            "Status was #{response.code}"
    end
  end

  def check_for_local_canonical_data(path = "./exercises/practice/#{@exercise}/canonical-data.json")
    raise "No canonical-data.json found in #{@exercise} directory" unless File.exist?(path)

    JSON.parse(File.read(path))
  end

  def additional_json(json)
    file_path = "./exercises/practice/#{@exercise}/.meta/additional_tests.json"
    return unless File.exist?(file_path)

    JSON.parse(File.read(file_path))["cases"].each do |test|
      json["cases"] << test
    end
  end

  def remove_tests(uuid, json)
    json["cases"].each_with_object([]) do |x, acc|
      if x["cases"]
        acc << remove_tests(uuid, json)
      elsif uuid.include?(x["uuid"])
        acc << x
      end
    end
  end
end
