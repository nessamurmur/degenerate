module Degenerate
  module Generators
    INTEGER_MAX = (2**(0.size * 8 -2) -1) / 2
    INTEGER_MIN = -(INTEGER_MAX)

    GENERATORS = [:integer, :string, :array]

    HTTP_STATUSES = [100, 101, 102, 200, 201, 202, 203, 204, 205, 206, 207, 208, 226,                                                                                                                                     300, 301, 302, 303, 304, 305, 307, 308, 400, 401, 402, 403, 404,                                                                                                                                     405, 406, 407, 408, 409, 410, 411, 412, 413, 414, 415, 416, 417,                                                                                                                                     422, 423, 424, 426, 428, 429, 431, 500, 501, 502, 503, 504, 505,                                                                                                                                     506, 507, 508, 510, 511]

    def self.integer
      ->(opts={}) { rand((opts[:min] || INTEGER_MIN)..(opts[:max] || INTEGER_MAX)) }
    end

    def self.string
      ->(opts={}) {
        chars = opts[:of] || default_chars
        limit = opts[:limit] || random_int
        random_string_of(chars, limit)
      }
    end

    def self.array
      ->(opts={}) {
        limit = opts[:limit] || random_int
        of = Array(opts [:of] ||
                   send([:integer, :string].sample).call(limit: 1000))
        array_of(limit, *of)
      }
    end

    def self.any
      send(GENERATORS.sample)
    end

    def self.http_status
      ->() { HTTP_STATUSES.sample }
    end

    private

    def self.default_chars
      ('1'..'z').to_a
    end

    def self.array_of(limit, *generated)
      [].class.new(random_int(limit)) { generated.sample }
    end

    def self.random_string_of(chars, limit)
      [].class.new(random_int(limit)) { chars.sample }.join
    end

    def self.random_int(limit=9999)
      Degenerate::Generators.integer.call(min: 0, max: limit)
    end
  end
end
