module ApplicationHelper
    def date(resource)
        resource.to_formatted_s(:long)
    end
end
