# Configuration

Set your Puma default port for Foreman:

```
echo "port: 7070" > .foreman
```

# UUIDs

This app uses UUIDs instead of integer IDs. You'll need to edit migrations to add `id: :uuid`:

```
class CreateDocuments < ActiveRecord::Migration
  def change
   create_table :documents, id: :uuid  do |t|
      t.string :title
      t.string :author
      t.timestamps
    end
  end
end
```

Likewise, use `:uuid` as your datatype for associations.

