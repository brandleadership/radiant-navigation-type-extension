  module NavigationTypeTags
    include Radiant::Taggable

  desc %{
    Checks if an element is part of given navigation type.

    *Usage:*
    <r:is_navigationtype name="<navigationtype name>">
   }
    tag 'is_navigationtype' do |tag|
      if checknavigationtype(tag.locals.page, NavigationType.find_by_name(tag.attr['name']).id)
        tag.expand
      end
    end
  end

  def checknavigationtype(page, id)
    if page.navigationTypeId == id
        return true
    end
    if page.parent == nil
          return false;
    end
    return checknavigationtype(page.parent, id)
  end