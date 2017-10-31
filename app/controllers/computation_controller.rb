class ComputationController < ApplicationController
  def new
  	@computation = ComputationRecord.new
  end

  def index
  	@record = ComputationRecord.create(computation_params)
  	@record.save
  	create_format
    send_file(File.join(ENV["HOME"]+"/"+@record.name))
  end

  def create_format
  		doc = Template.find_by(title: "new1").body
  		today = Date.today
  		html_content = doc
  		my_html = html_content.gsub("{{date}}", today.to_s).gsub("{{ppr_no}}", "#{@record.ag_no}").gsub("{{dor}}", "#{@record.dor}").gsub("{{name}}", "#{@record.name}").gsub("amount", "#{@record.amount_comm}").gsub("/n", "").gsub("\n","").gsub(/\n/,"").gsub(/\\n/,"")
		html = my_html.chomp.html_safe.gsub("\n","")
		pdf = WickedPdf.new.pdf_from_string(html)
		save_path = Rails.root.join(@record.name+'.pdf')
    save_path = ENV["HOME"]+"/"+@record.name
		File.open(save_path, 'wb') do |file|
  			file << pdf
		end
  end

  private

  def computation_params
  	params.require(:computation_record).permit(:name, :dor, :ag_no, :amount_comm, :comm_value, :payment_date)
  end
end
