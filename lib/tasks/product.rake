namespace :db do
  task product: :environment do
    Product.destroy_all

    def random_users
      rand(3) + 1
    end

    def random_active
      ['true', 'false'].sample
    end

    def random_category
      rand(20) + 1
    end

    def random_price
      (rand() * 1000).round(2)
    end

    def random_weight
      rand(100..1000) * 1.0
    end

    def created
      ((rand(60) + 2).days.ago + rand(600).minutes).to_s(:db)
    end

    def updated
      (Time.now + rand(36_000).seconds).to_s(:db)
    end

    20.times do
      Product.create(
        user_id: random_users,
        name: FFaker::Product.product_name,
        sku: FFaker::Product.model,
        description: FFaker::HTMLIpsum.fancy_string,
        short_description: FFaker::HipsterIpsum.words(10).join(' '),
        active: random_active,
        weight: random_weight,
        price: random_price,
        cost_price: random_price,
        featured: random_active,
        stock_control: random_active,
        category_id: random_category,
        created_at: created,
        updated_at: updated
      )
    end

  end
end

