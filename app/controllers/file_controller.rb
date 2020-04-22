require 'digest/md5'

class FileController < ApplicationController
	def upload
		theFile = params[:image0]

		digest = Digest::MD5.hexdigest(theFile.original_filename)

		ext = ''
		if theFile.content_type == 'image/jpeg'
			ext = 'jpg'
		end

		uploadedFile = Rails.root.join('public', 'uploads', theFile.original_filename)
		newFile = Rails.root.join('public', 'uploads', digest + '.' + ext)

		File.open(uploadedFile, 'wb') do |file|
  		file.write(theFile.read)
		end

    File.rename(uploadedFile, newFile)

    result = { :success => true, data: { :filename => digest + '.' + ext } }

    render json: result
	end
end
