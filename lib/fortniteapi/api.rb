require 'httparty'

BRCosmetic = Struct.new(
    :id,
    :type,
    :backendType,
    :rarity,
    :displayRarity,
    :backendRarity,
    :name,
    :shortDescription,
    :description,
    :set,
    :setText,
    :backendSeries,
    :images,
    :variants,
    :gameplayTags,
    :displayAssetPath,
    :definition,
    :requiredItemId,
    :builtInEmoteId,
    :path,
    :lastUpdate,
    :added
)

FortniteNews = Struct.new(
    :image,
    :hidden,
    :messageType,
    :type,
    :adspace,
    :spotlight,
    :title,
    :body
)

ShopItem = Struct.new(
    :regularPrice,
    :finalPrice,
    :isBundle,
    :giftable,
    :refundable,
    :panel,
    :sortPriority,
    :banner,
    :items
)

CreatorCode = Struct.new(
    :id,
    :slug,
    :displayName,
    :status,
    :verified
)

AES = Struct.new(
    :build,
    :main_key,
    :dynamic_keys
    :updated,
)

class FortniteAPIError < StandardError; end

class FortniteAPI
    def get_aes(key_format='hex')
        request = HTTParty.get(
            "https://fortnite-api.com/v2/api/aes",
            :query {
                "keyFormat" => key_format
            }
        )

        body = JSON.parse(request.body)['data']

        if request.code == 200:
            aes = AES.new(
                body['build'],
                body['mainKey'],
                body['dynamicKeys'],
                body['updated']
            )

            aes
        else
            raise FortniteAPIError(body['error'])
        end
    end
end