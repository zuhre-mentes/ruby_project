module Api
  class ChatController < ApplicationController
    protect_from_forgery with: :null_session
    before_action :authenticate_user!

    def create
      message = current_user.messages.build(
        content: params[:message],
        badge_id: params[:badge_id]
      )

      if message.save
        response = generate_ai_response(params[:message], params[:context])
        message.update(response: response)
        
        render json: { response: response }
      else
        render json: { error: message.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private

    def generate_ai_response(question, context)
      badge_name = context[:badge_name]
      badge_description = context[:badge_description]

      case question.downcase
      when /çalışma süresi|ne kadar sürer|süre/
        "#{badge_name} sertifikasını almak için gereken tahmini çalışma süresi, kişinin deneyimine bağlı olarak değişmekle birlikte genellikle 2-4 ay arasındadır. Bu süre içinde:

        1. Temel kavramları öğrenme: 2-3 hafta
        2. Pratik yapma ve lab çalışmaları: 4-6 hafta
        3. Örnek sınavlar ve hazırlık: 2-3 hafta
        
        Günde ortalama 2-3 saat çalışma ile bu sürede sertifikaya hazır hale gelebilirsiniz."

      when /öğrenme kaynakları|kaynaklar|nereden öğrenebilirim/
        "#{badge_name} için önerilen öğrenme kaynakları:

        1. Resmi Dökümanlar:
           - Kubernetes resmi dokümantasyonu
           - Linux Foundation eğitim materyalleri

        2. Online Kurslar:
           - Udemy'de CKA hazırlık kursları
           - Linux Foundation'ın resmi kursu
           - KodeKloud platformu

        3. Pratik Platformları:
           - Katacoda interaktif laboratuvarları
           - Play with Kubernetes
           - Kubernetes Playground

        4. Kitaplar:
           - Kubernetes: Up and Running
           - Kubernetes in Action

        5. Topluluk Kaynakları:
           - Kubernetes Blog
           - CNCF forumları
           - GitHub üzerindeki örnek projeler"

      when /zorluk seviyesi|zor mu|kolay mı/
        "#{badge_name} sertifikası orta-ileri düzey bir sertifikadır. Zorluk seviyesi açısından:

        1. Temel Gereksinimler:
           - Linux sistem yönetimi deneyimi
           - Container teknolojileri bilgisi
           - Temel networking bilgisi

        2. Zorluk Faktörleri:
           - Pratik odaklı sınav formatı
           - Zaman yönetimi gerektirmesi
           - Geniş konu kapsamı

        3. Başarı İçin Öneriler:
           - Bol pratik yapma
           - Lab ortamında deneyim kazanma
           - Örnek senaryolar üzerinde çalışma"

      when /ön koşullar|gereksinimler|şartlar/
        "#{badge_name} sertifikası için önerilen ön koşullar:

        1. Teknik Gereksinimler:
           - Linux komut satırı deneyimi
           - Container teknolojileri (Docker) bilgisi
           - Temel sistem yönetimi becerileri

        2. Deneyim Gereksinimleri:
           - En az 6 ay container orchestration deneyimi
           - DevOps veya sistem yönetimi alanında tecrübe

        3. Araçlar ve Ortam:
           - Linux işletim sistemi
           - Kubernetes cluster kurulum deneyimi
           - Terminal ve CLI araçları kullanımı"

      else
        "#{badge_name} hakkında sorduğunuz '#{question}' sorusu için şu bilgileri paylaşabilirim:

        #{badge_description}

        Daha spesifik bilgiler için şu konularda sorular sorabilirsiniz:
        - Sertifikanın zorluk seviyesi
        - Gerekli çalışma süresi
        - Önerilen öğrenme kaynakları
        - Ön koşullar ve gereksinimler
        - Sınav formatı ve içeriği
        - Kariyer etkileri"
      end
    end
  end
end 