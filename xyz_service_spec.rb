require 'date'
require_relative './xyz_service'
require 'ostruct'

describe XYZService do
	let (:file) {
		OpenStruct.new(publish_on: Date.new(2012,2,1), 
			xyz_category_prefix: "gon",
			age: 32,
			kind: "the_best",
			id: 12,
			title: "The file"
			)
	}

	it "should show the filename accord to spec" do
		XYZService.xyz_filename(file).should match /01gon_thebest_12_(.){8}_thefile.jpg/
	end

end