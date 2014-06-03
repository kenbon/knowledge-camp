module KnowledgeNetStore
  class Net
    def self.model_name
      ActiveModel::Name.new(KnowledgeNetStore::Net, nil, 'net')
    end
  end
end

module KnowledgeNetPlanStore
  class Plan
    def self.model_name
      ActiveModel::Name.new(KnowledgeNetPlanStore::Plan, nil, 'plan')
    end
  end
end