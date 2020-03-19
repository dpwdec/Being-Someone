class HomeController < ApplicationController
  def index
  	
    if params[:age_id] != nil
      @generated_faces_url_prefix = "https://api.generated.photos/api/v1/faces?"

      @gender = "gender=#{params[:gender_id].downcase}&"
      @ethnicity = "ethnicity=#{params[:ethnic_id].downcase}&"
      @hair = "hair_color=#{params[:hair_id].downcase}&"
      @age = "age=#{params[:age_id].downcase}&"

      @number_of_faces = 100
      @faces_per_page = "per_page=#{@number_of_faces}"

      @api_key = "&api_key=byBeP6pY1klyflG5QX5uDA"

      @generate_faces_query = @generated_faces_url_prefix+
      @gender+
      @ethnicity+
      @hair+
      @age+
      @faces_per_page+
      @api_key

      response = Faraday.get @generate_faces_query
      @body = response.body
      @response_JSON = JSON.parse(response.body)
      if @response_JSON['total'] > 0
        @face_sample = @response_JSON['faces'].sample
        @generated_image_id = @face_sample['id']
        @generated_image_hash = @face_sample['urls'].reduce(Hash.new, :merge)
      else
        @generated_image_error = "no image found"
      end

    end

    #j = ActiveSupport::JSON

  	#response = Faraday.get 'https://graph.facebook.com/youtube'
  	#response = Faraday.get 'https://api.generated.photos/api/v1/faces?ethnicity=asian&gender=female&api_key=byBeP6pY1klyflG5QX5uDA'
  	#@jg = response.body
  	@qt = "{\"faces\":[{\"id\":\"5dd0977cdef8b400084d89c9\",\"urls\":[{\"32\":\"https://images.generated.photos/AcaLSAgVJZsZO2RzR31xY84VpFy7CB28Y2yG46u3xCw/rs:fit:32:32/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA4/NTUzMzguanBn.jpg\"},{\"64\":\"https://images.generated.photos/YLBSRbJsGvBbSPkfC7xh8YOdqf7djsBSalPLvPkHuqs/rs:fit:64:64/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA4/NTUzMzguanBn.jpg\"},{\"128\":\"https://images.generated.photos/-LiVdooFuro9omwmAtXo3x7_W_Ui1CqetHF2GiLRJbM/rs:fit:128:128/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA4/NTUzMzguanBn.jpg\"},{\"256\":\"https://images.generated.photos/wO2kcCRRsY6nWpNT4WOwrj1UJyk-h-LE40wGG-e7VNw/rs:fit:256:256/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA4/NTUzMzguanBn.jpg\"},{\"512\":\"https://images.generated.photos/SZ43KV-Oo26-wpPUM7zDLo19CpGFH0eBnjegQFtvaUc/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA4/NTUzMzguanBn.jpg\"}],\"meta\":{\"confidence\":0.01606282964348793,\"gender\":[\"male\"],\"age\":[\"young-adult\"],\"ethnicity\":[\"asian\"],\"eye_color\":[\"brown\"],\"hair_color\":[\"black\"],\"hair_length\":[\"short\"],\"emotion\":[\"neutral\"]}},{\"id\":\"5dd09cb2def8b400084dc55c\",\"urls\":[{\"32\":\"https://images.generated.photos/FOgmZRsRSYIJCyw5GYM9ZPzJm-buC6xyvH8NXNtvrOY/rs:fit:32:32/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTk3ODAuanBn.jpg\"},{\"64\":\"https://images.generated.photos/rs_uo2tuLnilZW7JFKGiyw8q8Arc9CVYMPoSqipj48U/rs:fit:64:64/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTk3ODAuanBn.jpg\"},{\"128\":\"https://images.generated.photos/yjYWuCHQ0D96gEpkP8GUZzIzfKseL_trfDbqdcszCfU/rs:fit:128:128/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTk3ODAuanBn.jpg\"},{\"256\":\"https://images.generated.photos/7bbvs1BZ6ONu1S1pqQF_O0ueLrLDI9z_QoO2s4VPnzc/rs:fit:256:256/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTk3ODAuanBn.jpg\"},{\"512\":\"https://images.generated.photos/1M5y2b6d0SU7RJ50S9pLdzB2yudegQ2xVxivkJIaIC4/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTk3ODAuanBn.jpg\"}],\"meta\":{\"confidence\":0.0033363772090524435,\"gender\":[\"male\"],\"age\":[\"young-adult\"],\"ethnicity\":[\"white\"],\"eye_color\":[\"brown\"],\"hair_color\":[\"brown\"],\"hair_length\":[\"short\"],\"emotion\":[\"neutral\"]}},{\"id\":\"5dd09c85def8b400084dc376\",\"urls\":[{\"32\":\"https://images.generated.photos/T6y2lwlhRclHGlVcmTAxGVlJX4u4STgRDRSy_58Jsm4/rs:fit:32:32/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTUwMjkuanBn.jpg\"},{\"64\":\"https://images.generated.photos/2WpXLWpsZaHXTsf8nFZI-b1xoQNtX-Noo6CeVqFHwVU/rs:fit:64:64/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTUwMjkuanBn.jpg\"},{\"128\":\"https://images.generated.photos/0qMWSLXTL9st8OG44PJwoynG3xwo6NV85GoXKoyqSHw/rs:fit:128:128/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTUwMjkuanBn.jpg\"},{\"256\":\"https://images.generated.photos/gxUNz1k7m-e-9HunSIkK3oceFftYjKef8FekRftVc8c/rs:fit:256:256/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTUwMjkuanBn.jpg\"},{\"512\":\"https://images.generated.photos/PYqJjdWKLiLWW3R0pVQGZRQ6oZWQ5qdPMLkwLCttkJs/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTUwMjkuanBn.jpg\"}],\"meta\":{\"confidence\":0.05633169040083885,\"gender\":[\"male\"],\"age\":[\"young-adult\"],\"ethnicity\":[\"white\"],\"eye_color\":[\"brown\"],\"hair_color\":[\"brown\"],\"hair_length\":[\"short\"],\"emotion\":[\"neutral\"]}},{\"id\":\"5e010b657b1b300007eb54b3\",\"urls\":[{\"32\":\"https://images.generated.photos/A56MtANyffbWjF6f04XQiPBi6T6Fj7EXnoEFbsXQ-mU/rs:fit:32:32/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zL3Yy/XzA4MjExMjUuanBn.jpg\"},{\"64\":\"https://images.generated.photos/LK8v4yY4uekONGsTWx-10cffkslRmoOKXzgAS9wnpII/rs:fit:64:64/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zL3Yy/XzA4MjExMjUuanBn.jpg\"},{\"128\":\"https://images.generated.photos/3ILLQA4iSZaeJf3Lpyiy-Vym95yazcpVkui-f-JHM1Y/rs:fit:128:128/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zL3Yy/XzA4MjExMjUuanBn.jpg\"},{\"256\":\"https://images.generated.photos/BmW0j_GhcKu6LcZGvfNt1TgeCuhOYvLEiiHvr44WVXM/rs:fit:256:256/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zL3Yy/XzA4MjExMjUuanBn.jpg\"},{\"512\":\"https://images.generated.photos/EWV-zLc5-iWQ8pMTKLsTd3L5TNCafscujeCIYmEMkuQ/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zL3Yy/XzA4MjExMjUuanBn.jpg\"}],\"meta\":{\"confidence\":0.0017448406433686614,\"gender\":[\"male\"],\"age\":[\"young-adult\"],\"ethnicity\":[\"white\"],\"eye_color\":[\"blue\"],\"hair_color\":[\"blond\"],\"hair_length\":[\"short\"],\"emotion\":[\"joy\",\"neutral\"]}},{\"id\":\"5dd09c5edef8b400084dc1c8\",\"urls\":[{\"32\":\"https://images.generated.photos/fc8htDxyOXikKTam1qKCyNRc79X0JQoraSsCuEavMJ0/rs:fit:32:32/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTA4MzkuanBn.jpg\"},{\"64\":\"https://images.generated.photos/h51cWuw7u1nKnBh_QSIjCZa-pf2Lkq_ozhcr-_1TiKQ/rs:fit:64:64/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTA4MzkuanBn.jpg\"},{\"128\":\"https://images.generated.photos/ObAlUdMmN36IA-7_J99OsalTSLipGWbc43uSraAYWfs/rs:fit:128:128/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTA4MzkuanBn.jpg\"},{\"256\":\"https://images.generated.photos/qtci5YcytAAOrh9F9QJkDEKe2mJL0uzgseKFuc2KwCQ/rs:fit:256:256/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTA4MzkuanBn.jpg\"},{\"512\":\"https://images.generated.photos/0dav65T4Xfw38thT0tLX2l9MOMDY5nzP1XLYui3MTlk/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTA4MzkuanBn.jpg\"}],\"meta\":{\"confidence\":0.0024465129245072603,\"gender\":[\"male\"],\"age\":[\"young-adult\"],\"ethnicity\":[\"white\"],\"eye_color\":[\"brown\"],\"hair_color\":[\"brown\"],\"hair_length\":[\"short\"],\"emotion\":[\"joy\"]}},{\"id\":\"5dd09caadef8b400084dc502\",\"urls\":[{\"32\":\"https://images.generated.photos/0eabaa9mCGQ4JeOoxrOoF2OKM89Dya9Uw9OL41j7-vQ/rs:fit:32:32/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTg3ODQuanBn.jpg\"},{\"64\":\"https://images.generated.photos/EQH0xyA3WAm05jgtpbswSW1kYzp4KUwZIumyvHv4VoE/rs:fit:64:64/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTg3ODQuanBn.jpg\"},{\"128\":\"https://images.generated.photos/wln_ZbusO6wvEGGYSiT17rv7iajOgR2f-_WPr3VtN-A/rs:fit:128:128/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTg3ODQuanBn.jpg\"},{\"256\":\"https://images.generated.photos/gKViizq-ukTHnrYWIY6xG-gEPM3JJMX8yfIPs3neDhw/rs:fit:256:256/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTg3ODQuanBn.jpg\"},{\"512\":\"https://images.generated.photos/gIQs5znc6V_PNuLzVFIxll5VP3hvDoH3Jj9AUad8dSc/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTg3ODQuanBn.jpg\"}],\"meta\":{\"confidence\":0.01191260851919651,\"gender\":[\"male\"],\"age\":[\"child\"],\"ethnicity\":[\"white\"],\"eye_color\":[\"brown\"],\"hair_color\":[\"brown\"],\"hair_length\":[\"short\"],\"emotion\":[\"joy\"]}},{\"id\":\"5dd08e4fdef8b400084d0d45\",\"urls\":[{\"32\":\"https://images.generated.photos/8ia_IPqqM1yZcXxN7s4u5cUkb1ZGHRqL0hnvTwAFKOg/rs:fit:32:32/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA1/NTI3NzIuanBn.jpg\"},{\"64\":\"https://images.generated.photos/d9bPTitQiHt0cWVvcdH3GrezPt82v1PpD7_JskKxL24/rs:fit:64:64/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA1/NTI3NzIuanBn.jpg\"},{\"128\":\"https://images.generated.photos/qSBLMQ8geBwQlXYuaSaHoK3TSBV8DpRWgiQ-WYIJ6Ds/rs:fit:128:128/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA1/NTI3NzIuanBn.jpg\"},{\"256\":\"https://images.generated.photos/_wjSb2nbdxtZuMCLOZVj1a0gjD1D4Zk5NZ7uW4cN-o0/rs:fit:256:256/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA1/NTI3NzIuanBn.jpg\"},{\"512\":\"https://images.generated.photos/DzhyqGgdtZFuKl01KszjW2PKmc1f3HxC9Agt-Efiz-c/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA1/NTI3NzIuanBn.jpg\"}],\"meta\":{\"confidence\":0.0013540572253987193,\"gender\":[\"male\"],\"age\":[\"adult\"],\"ethnicity\":[\"latino\"],\"eye_color\":[\"brown\"],\"hair_color\":[\"brown\"],\"hair_length\":[\"short\"],\"emotion\":[\"neutral\"]}},{\"id\":\"5e011f047b1b3000070884a3\",\"urls\":[{\"32\":\"https://images.generated.photos/SBMUC9E5hnP5mv7iX8055buvTt06n3ENKmSNM_mV_t4/rs:fit:32:32/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zL3Yy/XzAwMDIzOTYuanBn.jpg\"},{\"64\":\"https://images.generated.photos/Y1sRJDprJ7fNREVnBeQx1QV3F_x_yCmbxfnkCYl5ExI/rs:fit:64:64/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zL3Yy/XzAwMDIzOTYuanBn.jpg\"},{\"128\":\"https://images.generated.photos/9fyUGAafLCX5sppfRlWcZ8N5oWGl6CCLQuQk5wqC5yc/rs:fit:128:128/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zL3Yy/XzAwMDIzOTYuanBn.jpg\"},{\"256\":\"https://images.generated.photos/N2PxwkrnnKYDTEZL2UlLj9hxkib0Qe_fomNfI4w0xiE/rs:fit:256:256/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zL3Yy/XzAwMDIzOTYuanBn.jpg\"},{\"512\":\"https://images.generated.photos/ww3Ht-Tf6Zh17fJYFQEJeNWcqwUMhVlAVykzQH0Uu90/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zL3Yy/XzAwMDIzOTYuanBn.jpg\"}],\"meta\":{\"confidence\":0.00487516587600112,\"gender\":[\"male\"],\"age\":[\"adult\"],\"ethnicity\":[\"white\"],\"eye_color\":[\"brown\"],\"hair_color\":[\"brown\"],\"hair_length\":[\"short\"],\"emotion\":[\"neutral\"]}},{\"id\":\"5dd09cb4def8b400084dc56f\",\"urls\":[{\"32\":\"https://images.generated.photos/a0T2SRwORz5v9rEtccsJHjOD9UaFGmlyaI92dNz2hwU/rs:fit:32:32/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTk5MTcuanBn.jpg\"},{\"64\":\"https://images.generated.photos/KP2UNvGm4D8_lWvgMsCeirpNQaRL7ZJEYH-8quTQfCE/rs:fit:64:64/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTk5MTcuanBn.jpg\"},{\"128\":\"https://images.generated.photos/V-IooLaSLpEF0y20_lkVLs17BLK5svjLzd6gdOx0OgI/rs:fit:128:128/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTk5MTcuanBn.jpg\"},{\"256\":\"https://images.generated.photos/5wh575MvTYRK8WLlYCjMORzHXVRaRfJQ3sQsAShLlDg/rs:fit:256:256/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTk5MTcuanBn.jpg\"},{\"512\":\"https://images.generated.photos/QaHbCf7SRuFeppnmIBd0tTKzoLAgLPiQYiTkjBwo6IQ/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTk5MTcuanBn.jpg\"}],\"meta\":{\"confidence\":0.0018442395376041532,\"gender\":[\"male\"],\"age\":[\"young-adult\"],\"ethnicity\":[\"white\"],\"eye_color\":[\"blue\"],\"hair_color\":[\"blond\"],\"hair_length\":[\"short\"],\"emotion\":[\"joy\"]}},{\"id\":\"5dd08d33def8b400084cfbcf\",\"urls\":[{\"32\":\"https://images.generated.photos/gUAmXOZE8reLEiTwmqhFcCXFRoDA1R9vfrqaPaSDubA/rs:fit:32:32/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA1/MTEzNzkuanBn.jpg\"},{\"64\":\"https://images.generated.photos/kp1xbXf1AmxrBtvs6ll5KqersaTBM_W9RtVNFi5LbLc/rs:fit:64:64/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA1/MTEzNzkuanBn.jpg\"},{\"128\":\"https://images.generated.photos/hFxC2Ktrln_ea2wdxlIuC03I0Ge7-eMSZpVTvXQlLUs/rs:fit:128:128/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA1/MTEzNzkuanBn.jpg\"},{\"256\":\"https://images.generated.photos/dz2TMpS4DR4gKCr5LqPO7b9O7yCV2B8juCUjjYcK-ZA/rs:fit:256:256/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA1/MTEzNzkuanBn.jpg\"},{\"512\":\"https://images.generated.photos/nLDaKuZTAyRzaZR0bjIp1Fxa0B8YpJxyIVOMp2fHINs/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA1/MTEzNzkuanBn.jpg\"}],\"meta\":{\"confidence\":0.005122902803122997,\"gender\":[\"male\"],\"age\":[\"young-adult\"],\"ethnicity\":[\"white\"],\"eye_color\":[\"brown\"],\"hair_color\":[\"brown\"],\"hair_length\":[\"short\"],\"emotion\":[\"joy\"]}}],\"total\":719382}"
  	@pq = JSON.parse(@qt)
  	@pz = @pq['faces'][6]["urls"].reduce(Hash.new, :merge)

  	@iscurrent = request.env['PATH_INFO']

    #@gender = params[:gender_id].downcase
    #@ethnicity = params[:ethnic_id].downcase
    #@hair = params[:hair_id].downcase
    #@age = params[:age_id].downcase

    "this is a string #{}"

    if @age != nil 
      @fpath = "https://api.generated.photos/api/v1/faces?gender=#{@gender}&ethnicity=#{@ethnicity}&hair_color=#{@hair}&age=#{@age}&api_key=byBeP6pY1klyflG5QX5uDA"
    end

  end

  def about
  end

end
