defmodule Aim.Repo.Migrations.CreateChatMessageReactions do
  use Ecto.Migration

  def change do
    create table(:chat_message_reactions) do
      add :message_id, references(:chat_messages, on_delete: :nothing)
      add :user_id, references(:auth_users, on_delete: :nothing)
      add :emoji_id, references(:chat_emojis, on_delete: :nothing)

      timestamps()
    end

    create index(:chat_message_reactions, [:message_id])
    create index(:chat_message_reactions, [:user_id])
    create index(:chat_message_reactions, [:emoji_id])
  end
end
