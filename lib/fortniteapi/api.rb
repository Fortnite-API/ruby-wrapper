require 'httparty'

class FortniteAPI
    BRCosmetic = Struct.new(:id, :type, :backendType, :rarity, :displayRarity, :backendRarity, :name, :shortDescription, :description, :set, :setText, :backendSeries, :images, :variants, :gameplayTags, :displayAssetPath, :definition, :requiredItemId, :builtInEmoteId, :path, :lastUpdate, :added)
    BRNews = Struct.new(:image, :hidden, :messageType, :type, :adspace, :spotlight, :title, :body)
    STWNews = Struct.new(:image, :hidden, :messageType, :type, :adspace, :spotlight, :title, :body)
    CreativeNews = Struct.new(:image, :hidden, :messageType, :type, :adspace, :spotlight, :title, :body)
    ShopItem = Struct.new(:regularPrice, :finalPrice, :isBundle, :giftable, :refundable, :panel, :sortPriority, :banner, :items)
    CreatorCode = Struct.new(:id, :slug, :displayName, :status, :verified)

    def search_cosmetic(searchQuery, tag='name', language='en', searchLanguage='en')
        response = HTTParty.get("https://fortnite-api.com/cosmetics/br/search?#{tag}=#{searchQuery}&language=#{language}&searchLanguage=#{searchLanguage}")
        body = JSON.parse(response.body)['data']
        if response.code == 200
            searchResult = BRCosmetic.new(body['id'], body['type'], body['backendType'], body['rarity'], body['displayRarity'], body['backendRarity'], body['name'], body['shortDescription'], body['description'], body['set'], body['setText'], body['backendSeries'], body['images'], body['variants'], body['gameplayTags'], body['displayAssetPath'], body['definition'], body['requiredItemId'], body['builtInEmoteId'], body['path'], body['lastUpdate'], body['added'])
            searchResult
        elsif response.code == 404
            raise "Error when trying to fetch cosmetic: #{searchQuery} - #{body['error']}"
            searchResult = BRCosmetic.new()
            searchResult
        elsif response.code == 400
            raise "Error when using parameter, it might be that it is invalid.: #{tag} - #{body['error']}"
            searchResult = BRCosmetic.new()
            searchResult
        else
            raise "An unexpected error occured. Status code: #{response.code}, Request body: #{response.body}"
            searchResult = BRCosmetic.new()
            searchResult
        end
    end

    def get_creator_code(slug)
        repsonse = HTTParty.get("https://fortnite-api.com/creatorcode/search?slug=#{slug}")
        body = JSON.parse(response.body)['data']
        supportACreator = CreatorCode.new(body['id'], body['slug'], body['displayName'], body['status'], body['verified'])

    def search_cosmetic_id(searchQuery, language='en')
        response = HTTParty.get("https://fortnite-api.com/cosmetics/br/#{searchQuery}&language=#{language}")
        body = JSON.parse(response.body)['data']
        if response.code == 200
            searchResult = BRCosmetic.new(body['id'], body['type'], body['backendType'], body['rarity'], body['displayRarity'], body['backendRarity'], body['name'], body['shortDescription'], body['description'], body['set'], body['setText'], body['backendSeries'], body['images'], body['variants'], body['gameplayTags'], body['displayAssetPath'], body['definition'], body['requiredItemId'], body['builtInEmoteId'], body['path'], body['lastUpdate'], body['added'])
            searchResult
        elsif response.code == 404
            raise "Error when trying to fetch cosmetic: #{searchQuery} - #{body['error']}"
            searchResult = BRCosmetic.new()
            searchResult
        elsif response.code == 400
            raise "Error when using parameter, it might be that it is invalid.: #{tag} - #{body['error']}"
            searchResult = BRCosmetic.new()
            searchResult
        else
            raise "An unexpected error occured. Status code: #{response.code}, Request body: #{response.body}"
            searchResult = BRCosmetic.new()
            searchResult
        end
    end

    def search_cosmetics(searchQuery, tag='name', language='en', searchLanguage='en')
        cosmetics = []
        response = HTTParty.get("https://fortnite-api.com/cosmetics/br/search/all?#{tag}=#{searchQuery}&language=#{language}&searchLanguage=#{searchLanguage}")
        body = JSON.parse(response.body)['data']
        if response.code == 200
            for x in body
                searchResult = BRCosmetic.new(x['id'], x['type'], x['backendType'], x['rarity'], x['displayRarity'], x['backendRarity'], x['name'], x['shortDescription'], x['description'], x['set'], x['setText'], x['backendSeries'], x['images'], x['variants'], x['gameplayTags'], x['displayAssetPath'], x['definition'], x['requiredItemId'], x['builtInEmoteId'], x['path'], x['lastUpdate'], x['added'])
                cosmetics.push(searchResult)
            end
            cosmetics
        elsif response.code == 404
            raise "Error when trying to fetch cosmetic: #{searchQuery} - #{body['error']}"
            searchResult = BRCosmetic.new()
            searchResult
        elsif response.code == 400
            raise "Error when using parameter, it might be that it is invalid.: #{tag} - #{body['error']}"
            searchResult = BRCosmetic.new()
            searchResult
        else
            raise "An unexpected error occured. Status code: #{response.code}, Request body: #{response.body}"
            searchResult = BRCosmetic.new()
            searchResult
        end
    end

    def all_cosmetics()
        response = HTTParty.get("https://fortnite-api.com/cosmetics/br")
        JSON.parse(response.body)
    end

    def get_br_news(language='en')
        br_news_list = []
        response = HTTParty.get("https://fortnite-api.com/news/br?language=#{language}")
        messages = JSON.parse(response.body)['data']['messages']
        for x in messages
            newsResult = BRNews.new(x['image'], x['hidden'], x['messageType'], x['type'], x['adspace'], x['spotlight'], x['title'], x['body'])
            br_news_list.push(newsResult)
        end
        br_news_list
    end

    def get_stw_news(language='en')
        stw_news_list = []
        response = HTTParty.get("https://fortnite-api.com/news/stw?language=#{language}")
        messages = JSON.parse(response.body)['data']['messages']
        for x in messages
            newsResult = STWNews.new(x['image'], x['hidden'], x['messageType'], x['type'], x['adspace'], x['spotlight'], x['title'], x['body'])
            stw_news_list.push(newsResult)
        end
        stw_news_list
    end

    def get_creative_news(language='en')
        creative_news_list = []
        response = HTTParty.get("https://fortnite-api.com/news/creative?language=#{language}")
        messages = JSON.parse(response.body)['data']['messages']
        for x in messages
            newsResult = CreativeNews.new(x['image'], x['hidden'], x['messageType'], x['type'], x['adspace'], x['spotlight'], x['title'], x['body'])
            creative_news_list.push(newsResult)
        end
        creative_news_list
    end

    def get_br_store(language='en')
        featured_items = []
        daily_items = []
        response = HTTParty.get("https://fortnite-api.com/shop/br?language=#{language}")
        featured = JSON.parse(response.body)['data']['featured']
        for x in featured
            featuredItem = ShopItem.new(x['regularPrice'], x['finalPrice'], x['isBundle'], x['giftable'], x['refundable'], x['panel'], x['sortPriority'], x['banner'], x['items'])
            featured_items.push(featuredItem)
        end
        daily = JSON.parse(response.body)['data']['daily']
        for x in daily
            dailyItem = ShopItem.new(x['regularPrice'], x['finalPrice'], x['isBundle'], x['giftable'], x['refundable'], x['panel'], x['sortPriority'], x['banner'], x['items'])
            daily_items.push(dailyItem)
        end
        br_store = [featured_items, daily_items]
        br_store
    end
end