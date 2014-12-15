module SeedFuMongoid
  class DocumentSeeder
    class ConstraintNotDefined < StandardError ; end

    attr_reader :constraints

    def initialize(klass, constraints_and_objects, block)
      @klass, @block = klass, block

      @constraints = []
      @objects = []

      constraints_and_objects.each do |constraint_or_object|
        case constraint_or_object
        when Symbol
          @constraints << constraint_or_object
        when Hash
          @objects << constraint_or_object
        end
      end

      if @constraints.empty?
        @constraints = [ :id ]
      end
    end

    class Document
      def initialize(klass, constraints, data_or_block)
        @klass, @constraints = klass, constraints

        case data_or_block
        when Hash
          @data = data_or_block
        else
          @block = data_or_block
        end
      end

      def data
        return @data if @data

        @data = SeedProxy.new

        @block.call(@data)

        @data
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
        @constraints.each do |constraint|
          if data[constraint]
            @constraint_search[constraint] = data[constraint]
          else
            raise ConstraintNotDefined.new(constraint)
          end
        end

        @constraint_search
      end

      def seed!
        data.each do |key, value|
          document.send :[]=, key, value
        end

        puts "#{@klass.name} #{document.attributes}" unless SeedFuMongoid.quiet

        document.upsert
      end

      def new?
        !document.persisted?
      end
    end

    def create_document(block_or_object)
      Document.new(@klass, @constraints, block_or_object)
    end

    def seed!
      if @objects.empty?
        create_document(@block).seed!
      else
        @objects.each do |object|
          create_document(object).seed!
        end
      end
    end

    def seed_once!
      if @objects.empty?
        document = create_document(@block)
        if document.new?
          document.seed!
        end
      else
        @objects.each do |object|
          document = create_document(object)
          if document.new?
            document.seed!
          end
        end
      end
    end
  end
end
