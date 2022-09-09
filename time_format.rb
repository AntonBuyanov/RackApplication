class TimeFormat

  TIME_FORMAT = {
      'year' => '%Y',
      'month' => '%m',
      'day' => '%d',
      'hour' => '%H',
      'minute' => '%M',
      'second' => '$S'
  }.freeze

  attr_reader :unknown_params

  def initialize(params)
    params = params.split(',')
    @true_params, @unknown_params = params.partition { |param| TIME_FORMAT.key?(param) }
    valid_format
  end

  def valid_format
    @true_params.map { |t| TIME_FORMAT[t] }.join('-')
  end

  def valid?
    @unknown_params.empty?
  end

  def time_request
    Time.now.strftime(valid_format)
  end
end
