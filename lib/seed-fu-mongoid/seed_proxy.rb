module SeedFuMongoid
  class SeedProxy
    attr_reader :data

    def initialize
      @data = {}
    end

    def method_missing(method, value, *args)
      if method.to_s[-1..-1] == '='
        @data[method.to_s[0..-2].to_sym] = value
      else
        super
      end
    end

    def [](key)
      @data[key]
    end

    def each(&block)
      @data.each(&block)
    end
  end
end

