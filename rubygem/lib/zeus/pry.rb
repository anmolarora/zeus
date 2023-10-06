# Only patch Pry if it is loaded by the app.
if defined?(Pry::Pager)
  class Pry::Pager
    def best_available
      # Versions of Pry prior to 0.13 define `Pry::Pager#_pry_`
      # while versions after that define `Pry::Pager#pry_instance`
      pry = defined?(pry_instance) ? pry_instance : _pry_
      # paging does not work in zeus so disable it
      NullPager.new(pry.output)
    end
  end
end
