module Avocado
  module Filters
    class PublishedFilter < SelectFilter
      def name
        'Published status'
      end

      def apply(request, query, value)
        case value
        when 'published'
          return query.where.not(published_at: nil)
        when 'unpublished'
          return query.where(published_at: nil)
        else
          query
        end
      end

      def options
        {
          'published': 'Published',
          'unpublished': 'Unpublished',
        }
      end
    end
  end
end