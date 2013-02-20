module SeedFuMongoid
  class DocumentSeeder
    class ConstraintNotDefined < StandardError ; end

    attr_reader :constraints

    def initialize(klass, constraints, block)
      @klass, @constraints, @block = klass, constraints, block

      if @constraints.empty?
        @constraints = [ :id ]
      end
    end

    def proxy
      return @proxy if @proxy

      @proxy = SeedProxy.new

      @block.call(@proxy)

      @proxy
    end

    def document
      @doc ||= begin
        @klass.find_by(constraint_search)
      rescue => e
        @klass.new
      end
    end

    def constraint_search
      return @constraint_search if @constraint_search

      @constraint_search = {}
      constraints.each do |constraint|
        if proxy[constraint]
          @constraint_search[constraint] = proxy[constraint]
        else
          raise ConstraintNotDefined.new(constraint)
        end
      end

      @constraint_search
    end

    def seed!
      proxy.each do |key, value|
        document[key] = value
      end

      puts "#{@klass.name} #{document.attributes}"

      document.upsert
    end

    def new?
      !document.persisted?
    end
  end
end

