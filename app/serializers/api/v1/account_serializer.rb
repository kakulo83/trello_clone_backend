class Api::V1::AccountSerializer < ActiveModel::Serializer
  attributes :id, :name, :owner

  def owner
    {
      owner_id: self.object.owner.id,
      owner_name: self.object.owner.name
    } if self.object.owner
  end
end
