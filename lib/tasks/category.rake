namespace :db do
  task category: :environment do
    Category.destroy_all

    def random_displayed
      ['true', 'false'].sample
    end

    def random_users
      ['1', '2', '3'].sample
    end

    20.times do
      Category.create(
        user_id: random_users,
        name: FFaker::Lorem.word,
        description: FFaker::HipsterIpsum.words(10).join(' '),
        displayed: random_displayed
      )
    end

  end
end
