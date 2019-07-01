# require 'json'

namespace :graphql do
  namespace :dump do
    desc 'Dumps the IDL schema into ./tmp/graphql/schema.graphql'
    task idl: [:environment] do
      target = Rails.root.join("tmp/graphql/schema.graphql")
      schema = GraphQL::Schema::Printer.print_schema(GplTestSchema)
      File.open(target, "w+") do |f|
        f.write(schema)
      end
      puts "Schema dumped into tmp/graphql/schema.graphql"
    end

    desc 'Dumps the result of the introspection query into ../trainings/react/myreact/server/data/schema.graphql'
    task json: [:environment] do
      target = Rails.root.join("../trainings/react/myreact/server/data/schema.graphql")
      result = GplTestSchema.execute(GraphQL::Introspection::INTROSPECTION_QUERY)
      File.open(target, "w+") do |f|
        f.write(JSON.pretty_generate(result))
      end
      puts "Schema dumped into tmp/graphql/schema.json"
    end
  end

  desc 'Dumps both the IDL and result of introspection query in tmp/graphql'
  task dump: ["graphql:dump:idl", "graphql:dump:json"]
end
