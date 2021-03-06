Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  # TODO: remove me
  # field :testField, types.String do
  #   description "An example field added by the generator"
  #   resolve ->(obj, args, ctx) {
  #     "Hello World!"
  #   }
  # end

  field :allMovies do
    type types[Types::MovieType]
    description “A list of all the movies”

    resolve -> (obj, args, ctx) {
      Movie.all
    }
  end

  field :movie do
    type Types::MovieType
    description “Return a movie”
    argument :id, !types.ID
    resolve -> (obj, args, ctx) { Movie.find(args[:id]) }
  end
end
