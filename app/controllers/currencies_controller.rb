class CurrenciesController < ActionController::Base
    def first_currency
        @raw_data = open("https://api.exchangerate.host/symbols").read
        @parse_data = JSON.parse(@raw_data)

        @symbols_hash=@parse_data.fetch("symbols")
        @array_of_symbols=@symbols_hash.keys

        render({:template => "currency_templates/step_one.html.erb"}) 
    end
    
    def second_currency
        @raw_data = open("https://api.exchangerate.host/symbols").read
        @parse_data = JSON.parse(@raw_data)

        @symbols_hash=@parse_data.fetch("symbols")
        @array_of_symbols=@symbols_hash.keys
        @symbol_from=params.fetch("symbol_from")

        render({:template => "currency_templates/step_two.html.erb"}) 
    end

    def third_currency
        @symbol_from=params.fetch("symbol_from")
        @symbol_to=params.fetch("symbol_to")

        @raw_data=open("https://api.exchangerate.host/convert?from="+@symbol_from+"&to="+@symbol_to).read
        @parse_data=JSON.parse(@raw_data)
        @exchange_rate=@parse_data.fetch("result")

        render({:template => "currency_templates/step_three.html.erb"}) 
    end
end