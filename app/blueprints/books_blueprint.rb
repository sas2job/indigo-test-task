class BooksBlueprint < Blueprinter::Base
  identifier :id
    
  view :normal do
    fields :name, :author
  end

  view :extended do
    include_view :normal
  end
end