require 'cgi'

class Movie < ApplicationRecord
  def self.all_ratings
    %w[G PG PG-13 R]
  end

  def self.with_ratings(ratings, sort_by)
    if ratings.nil?
      all.order sort_by
    else
      where(rating: ratings.map(&:upcase)).order sort_by
    end
  end

  def self.find_in_tmdb(search_terms, api_key = 'fake_key')
    if search_terms.is_a?(Hash)
      title = search_terms[:title]
      language = search_terms[:language]
      release_year = search_terms[:release_year]
      url = "https://api.themoviedb.org/3/search/movie?api_key=#{api_key}&query=#{CGI.escape(title)}"
      url += "&year=#{release_year}" if release_year.present?
      url += "&language=#{language}" if language.present? && language != 'all'
    else
      url = search_terms
    end

    response = Faraday.get(url)
    return [] if response.nil? || !response.success?
    results = JSON.parse(response.body)['results']
    results.map do |movie|
      Movie.new(
        title: movie['title'],
        release_date: movie['release_date'],
        rating: 'R'
      )
    end
  end
end