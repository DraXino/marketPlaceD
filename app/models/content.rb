class Content < ApplicationRecord

	extend FriendlyId
	friendly_id :titolo, use: :slugged

	belongs_to :user
	
	has_many :sale

	has_attached_file :cover#, {  s3_permissions: :private, :default_url => "/img/:style/null.png"}  #,styles: {medium: '400x>', thumb: '100x>'},
	#has_attached_file :cover, styles: { medium: "300x>", thumb: "100x>" } #, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/,
	message: "Solo le immagini sono supportate"

	has_attached_file :allegato
	validates_attachment_content_type :allegato, :content_type => [ /^image\/(png|gif|jpeg)/,'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document','application/mspowerpoint','application/vnd.ms-powerpoint','application/vnd.openxmlformats-officedocument.presentationml.presentation', 'application/pdf', 'application/msexcel','application/vnd.ms-excel','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','audio/mpeg', 'audio/mp3' ], 
	message: "Formato non supportato"

	validates :titolo, :descrizione, :price , presence: true
	validates :price, numericality: { greater_than: 49 }
	validates :cover, attachment_presence: true 
end