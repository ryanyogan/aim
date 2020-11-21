defmodule Aim.Repo.Migrations.CreateChatConversationMembers do
  use Ecto.Migration

  def change do
    create table(:chat_conversation_members) do
      add :owner, :boolean, default: false, null: false
      add :conversation_id, references(:chat_conversations, on_delete: :nothing)
      add :user_id, references(:auth_users, on_delete: :nothing)

      timestamps()
    end

    create index(:chat_conversation_members, [:conversation_id])
    create index(:chat_conversation_members, [:user_id])
  end
end
