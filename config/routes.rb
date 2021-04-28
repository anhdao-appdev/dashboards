Rails.application.routes.draw do
  get("/forex", {:controller => "currencies", :action => "first_currency"})
  get("/forex/:symbol_from", {:controller => "currencies", :action => "second_currency"})
  get("/forex/:symbol_from/:symbol_to", {:controller => "currencies", :action => "third_currency"})
end
