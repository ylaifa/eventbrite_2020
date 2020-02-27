module EventsHelper
    def free(resource)
        resource.price == 0
    end
end
