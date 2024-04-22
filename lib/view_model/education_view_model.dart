import 'package:flutter/material.dart';
import 'package:koupet/model/video.dart';

class EducationViewModel with ChangeNotifier {
  List<VideoData> _videoDataList = [];

  List<VideoData> get videoDataList => _videoDataList;

  EducationViewModel() {
    _initializeVideoDataList();
  }

  void _initializeVideoDataList() {
    _videoDataList = [
      VideoData(
          videoId: 'GwUwJnm_ZqA',
          basliktext: "Kedi Sahiplerinin Yaptığı 11 Hata",
          additionalText: "Kedi Sahiplerinin Yaptığı 11 Hata",
          text:
              """Merhaba sevgili izleyiciler, bugün sizlere kedi sahiplerinin sıkça düştüğü 11 hatadan bahsedeceğim. Kedi sahiplenmek, hayatınıza neşe katan sevimli bir arkadaş edinmek demektir, ancak bu süreç bazen zorlayıcı olabilir. İşte kedi sahiplerinin sıkça yaptığı hatalar ve bu hatalardan nasıl kaçınılacağı hakkında bilgiler: Unutulan Veteriner Kontrolleri:
Kedinizin düzenli veteriner kontrollerini atlamak, onun sağlığını riske atabilir. Zamanında aşılar,
sağlık kontrolleri ve önleyici tedbirlerle kedinizin sağlığını koruyun.Yetersiz Tuvalet Bakımı:
Kedi tuvaleti düzenli olarak temizlenmezse, kediniz bu alanda rahatsızlık hissedebilir. Temiz bir kum kabı sağlamak ve düzenli temizlik yapmak önemlidir.

1 - İlgi Eksikliği:
Kediler sosyal varlıklardır ve ilgiye ihtiyaç duyarlar. Onlara zaman ayırmak, oyun oynamak ve sevgi göstermek, kedinizle güçlü bir bağ kurmanıza yardımcı olur.

2- Sağlıksız Beslenme:
Kedinize uygun kalitede ve dengeli bir beslenme sağlamak, uzun vadeli sağlığını olumlu yönde etkiler. Veterinerinizle konuşarak en uygun beslenme programını belirleyin.

3- Doğru Oyun ve Egzersiz Eksikliği:
Kedinizin enerjisini tüketmesi için uygun oyuncaklar ve egzersiz imkanları sağlamak önemlidir. Bu, obezite ve davranış sorunlarını önlemeye yardımcı olabilir.

4- Kedi Dostu Alan Eksikliği:
Kediniz için özel bir alan oluşturmak, ona güvenlik ve rahatlık hissi verir. Kedi dostu mobilya ve yataklarla onun için özel bir köşe yaratın.

5- Stres ve Ortam Değişiklikleri:
Kediler, ortam değişikliklerine hassastır. Taşınma veya yeni bir evcil hayvan eklemek gibi durumlarda dikkatlice adapte olmalarına yardımcı olun.

6- Gereksiz İlaç Kullanımı:
Kedinize gereksiz ilaçlar veya takviyeler vermeyin. İlaç kullanımı konusunda veterinerinizden danışmanlık alın.

7- Diş Bakımı İhmal Edilmemesi:
Kedi diş sağlığı ihmal edilmemelidir. Diş fırçalama ve düzenli diş kontrolleriyle kedinizin ağız sağlığını koruyun.

8- Uygun Olmayan Oyuncaklar:
Kedilerin güvenliği için küçük parçalara ayrılabilen oyuncaklardan kaçının. Kedinize zarar verebilecek nesnelerden uzak tutun.

9- Sosyal İzolasyon:
Kediler sosyal varlıklardır, bu nedenle onları uzun süre yalnız bırakmaktan kaçının. Bir arkadaş edinmelerine veya güvendikleri bir bakıcıya sahip olmalarını sağlayın.
Unutmayın ki kedi sahiplenmek büyük bir sorumluluktur ve bu sevimli dostlarımıza en iyi bakımı sağlamak için sürekli öğrenmeye ve adapte olmaya açık olmalıyız. İyi seyirler dilerim!"""),
      VideoData(
        videoId: 'ljzKqYx7bsQ',
        basliktext: "Tekir Kedi Bakmanın Zorlukları",
        additionalText: "Tekir Kedi Bakmanın Zorlukları",
        text:
            """Merhaba. Bu videoda tekir kedi bakmanın zorluklarında bahsediyorum. Videoda da dediğim gibi Tekir kedileri kötülemek gibi bir amacım yoktur. Tekir kediler Dünyanın en mükemmel canlılarıdır. Tüy Dökme: Tekir kediler genellikle tüy döken cinsten olabilir, bu da evde daha fazla tüy temizliği gerektirebilir.
Enerji Seviyeleri: Tekir kediler genellikle enerjik ve oyuncu olabilir, bu da sahibinin zamanını ve ilgisini gerektirebilir.
Bağımsızlık: Tekir kediler genellikle bağımsızdır ve kendi başlarına zaman geçirmeyi tercih edebilirler. Bu, sahibine bağlılık bekleyenler için bir zorluk olabilir.
Sağlık Sorunları: Bazı ırklar genetik sağlık sorunlarına eğilimli olabilir. Bu nedenle, veteriner kontrolleri ve sağlıklarına dikkat etmek önemlidir.
Kum Kabı Temizliği: Kedilerin kum kabı ihtiyaçları vardır ve bu düzenli olarak temizlenmelidir.
Dışarı Çıkma İsteği: Eğer tekir kediler dışarı çıkmayı severse, bu sahibi için ek güvenlik önlemleri gerektirebilir.
Eğitim Zorlukları: Kediler genellikle kendi kurallarına göre yaşarlar. Bazı durumlarda, eğitimleri diğer evcil hayvanlara göre daha zor olabilir.
Bu zorluklar, kişiden kişiye ve kediden kediye değişebilir, ancak uygun bakım ve sevgi ile birçok sorun çözülebilir.""",
      ),
      VideoData(
        videoId: 'AnMmIkKG8RM',
        basliktext: "Kedimi Nasıl Eğitirim",
        additionalText: "Kedimi Nasıl Eğitirim",
        text:
            """Kedi eğitimiyle ilgili oldukça detaylı bir video hazırladım. Kedimize kızmadan, ceza vermeden istemediğiz şeyleri yapmasını nasıl engelleriz. Bu videodan sonra kediniz mutfak tezgahına çıkmayacak, etrafı tırmalayıp perdelere tırmanmayacak, evdeki bitkileri kemirmeyecek, gece boyu sizi uykusuz bırakmayacak ve bunlar gibi bir çok farklı konuyu çözeceğiz...

aşağıda videonun içeriğini ve konu başlıklarının başlangıç zamanlarını bulabilirsiniz:

00:00 giriş
00:15 kedi eğitimine giriş
01:15 kedimizin mutfak tezgahına çıkmasını engelleme
03:49 kedimizin sofradaki yemeklere sulanmasını, çalmasını engelleme
04:55 kedimizin evden kaçma çalışmalarının engelleme
05:35 kedimizin perdelere tırmanmasını ve yırtmasını engelleme
06:42 kedimizin koltuk ve mobilyaları tırmalamasını önleme
08:56 kedimizin kendisini sevdirmesini sağlama
09:48 kedimizin bizimle oyun oynamasını sağlama
10:02 gece boyu uyumayıp bizi de uyutmayan kedimizle baş etme
11:02 kedimizin evdeki saksı bitkilerine saldırmasını engelleme
12:22 kedi eğitimi özeti ve kapanış""",
      ),
      VideoData(
        videoId: '2AP9dfBTcNQ',
        basliktext: "Yavru Kediler Nasıl Büyür",
        additionalText: "Yavru Kediler Nasıl Büyür",
        text:
            """Bu kitap, anne kedi Lara ve baba kedi Terra'dan doğan beş yavru kedinin doğumlarından bir yaşına gelene kadarki büyüme sürecini anlatıyor.

0:00 1. Gün
0:27 1. bebek doğdu
1:03 2. bebek doğdu
1:22 3. bebek doğdu
2:00 4. bebek doğdu
2:30 5. bebek doğdu
3:16 Baba kedi Terra ile ilk buluşma
3:51 Anne sütü içen yavru kediler
4:18 2. Gün
5:13 3. Gün
6:37 Yavru kedilerin isimlerinin tanıtılması
9:01 5. Gün
10:34 7. Gün
12:13 11. Gün
13:36 13. Gün
14:19 17. Gün
15:13 20. Gün
15:54 21. Gün İlk sütten kesme maması
16:31 25. Gün
16:57 27. Gün
17:47 28. Gün
19:18 32. Gün
21:04 37. Gün Yaşlı kedi Towa ile ilk buluşma
21:50 45. Gün
23:18 47. Gün Yaşlı kedilerle ilk buluşma
26:31 2 Ay
27:17 3 Ay Yavru kediler için ilk banyo
31:11 4 Ay
32:52 5 Ay
33:43 6 Ay
35:18 7 Ay Yavru kediler Mameta ve Sorami ile ilk buluşma
37:38 8 Ay
39:14 9 Ay
40:05 Yavru kedi Mu ile ilk buluşma
41:01 10 Ay
42:20 11 Ay Yavru kedi Mu 2 ile ilk buluşma
44:07 12 Ay
""",
      ),
      VideoData(
        videoId: 'OBpI8t44IF0',
        basliktext: "Temel Itaat Eğitimi\n Nasıl Verilir 🐕‍🦺",
        additionalText: "Temel Itaat Eğitimi Nasıl Verilir 🐕‍🦺",
        text:
            """Temel itaat eğitimi, köpeğinizi günlük yaşamda daha iyi kontrol etmenizi sağlar ve güvenli bir şekilde iletişim kurmanıza yardımcı olur. İşte temel itaat eğitimi için bazı adımlar:

Komutları Öğrenme:
Temel komutları (otur, kal, yat, gel, vs.) öğrenmesi için kısa ve net komutlar kullanın.
Her komutu tutarlı bir ses tonu ve jestlerle verin.

Ödül Sistemi:
Köpeğinize doğru davranışı gösterdiğinde ödül verin. Bu genellikle ödül maması ya da övgü olabilir.
Hızlı ve pozitif geri bildirim, köpeğinizin istenilen davranışları daha hızlı öğrenmesine yardımcı olur.

Kısa ve Düzenli Egzersizler:
Eğitim oturumları kısa ve düzenli olsun. 5-10 dakika arası seanslar daha etkili olabilir.
Sık sık tekrar yaparak köpeğinizin yeni komutları daha iyi anlamasını sağlayabilirsiniz.

Sabır ve Tutarsızlık:
Sabırlı olun. Köpekler her bir komutu hemen öğrenmeyebilir.
Her aile üyesinin aynı komutları ve kuralları kullanması önemlidir. Tutarsızlık, köpeğinizi kafa karışıklığına sürükleyebilir.

Eğlenceli ve Pozitif Ortam:
Eğitimi eğlenceli hale getirin. Köpeğinizle oyunlar ve eğlenceli aktivitelerle eğitimi birleştirin.
Negatif davranışları düzeltirken sakin kalın ve köpeğinizi cezalandırmaktan kaçının.

Profesyonel Yardım Alma:
Eğer köpeğinizle ilgili özel zorluklar yaşıyorsanız, profesyonel bir köpek eğitmeninden yardım almayı düşünün.

Sosyalizasyon:
Köpeğinizi farklı insanlar, hayvanlar ve çevrelerle tanıştırarak sosyalizasyonu sağlayın. Bu, istenmeyen davranışların önlenmesine yardımcı olabilir.
Temel itaat eğitimi sabır, tutarlılık ve pozitif yaklaşım gerektirir. Eğitim sürecinde köpeğinizle güçlü bir bağ kurabilir ve birbirinize karşı güven geliştirebilirsiniz.""",
      ),
      VideoData(
        videoId: '4RZoBka42g4',
        basliktext: "Temel İtaat Nedir?",
        additionalText: "Temel İtaat Nedir?",
        text:
            """Temel itaat, bir köpeğin belirli komutlara yanıt vermesini içeren temel eğitim programını ifade eder. Bu eğitim, köpeğin günlük yaşamda daha iyi kontrol edilmesini, güvenli bir şekilde dolaştırılmasını ve çeşitli durumlarda sahibine uyum sağlamasını amaçlar.

Temel itaat eğitiminde öğretilen bazı temel komutlar şunlar olabilir:

Oturuş (Sit): Köpek, arkasındaki ayaklarının üzerinde oturur.

Yat (Down): Köpek, karın üstüne uzanır.

Gel (Come): Köpek, sahibinin yanına gelir.

Kal (Stay): Köpek, belirli bir yerde durur ve hareket etmez.

Buraya (Here): Köpek, sahibinin yanına gelir.

Bırak (Drop): Köpek, ağzındaki bir nesneyi bırakır.

Git (Go): Belirli bir yöne gitmesini sağlar.

Temel itaat eğitimi, köpeğin sahibiyle sağlıklı bir iletişim kurmasını, güven oluşturmasını ve ev içinde daha iyi uyum sağlamasını sağlar. Bu eğitim, köpeğin güvenliği ve çevresel uyumu için önemlidir. Eğitim sırasında kullanılan pozitif takviyeler, köpeğin istenilen davranışları öğrenmesine ve bu davranışları tekrarlamasına yardımcı olur.""",
      ),
      VideoData(
        videoId: 'KyFRchCRqpk',
        basliktext: "Kedinizi Nasıl Daha\n İyi Anlarsınız?",
        additionalText: "Kedinizi Nasıl Daha İyi Anlarsınız?",
        text:
            'Kedilerin en mantıksız ve ne yapacağı belli olmayan evcil hayvanlar olduğunu herkes bilir. O tüylü küçük kafanın içinden neler geçtiğini çözebilir misiniz? Anlaşılan kedilerin de kendilerine has bir dili var. Bu dili öğrenirseniz büyük ihtimalle onları daha iyi anlarsınız.',
      ),
      VideoData(
        videoId: 'am9VYbcuKYA',
        basliktext: "Kedi Sahiplerinin Sürekli\n Yaptığı 26 Tehlikeli Hata!",
        additionalText: "Kedi Sahiplerinin Sürekli Yaptığı 26 Tehlikeli Hata!",
        text:
            """Kediler ile yün yumağı, ekmeğin üstüne sürülen yağ ile bal gibi birbirlerinin ayrılmaz parçasıdır! 🐱 Ama aslında durum öyle değildir! 😲 Filmlerde veya sevimli kedi takvimlerinde kaç kez görmüş olursanız olun, oynaması için kedinize asla iplik vermeyin! Kediniz o ipliği yutabilir ve sonuç gerçekten kötü olabilir. Aynı şey kedi dostunuza süt vermek, çok fazla kucağa almak ve evcil hayvan sahiplerinin yaptıkları hakkında hiçbir fikrinin olmadığı daha birçok yaygın hata için de geçerlidir! 😱
            Kedi sahiplerinin bazen yaptığı hatalar, kedinin sağlığı ve refahı açısından riskli olabilir. İşte bu hatalardan bazıları:

Yetersiz Veteriner Kontrolleri:
Kedinizi düzenli olarak veterinere götürmemek.

Kötü Kalite Mama Kullanmak:
Düşük kaliteli veya insan gıdası içeren kedilere uygun olmayan mama kullanmak.

Aşırı Kilolu Bırakmak:
Kedinizi aşırı kilolu bırakmak, obeziteye yol açabilir.

Tuvalet Sorunlarına Dikkat Etmemek:
Kedi tuvaletinin temizliğine gerektiği kadar dikkat etmemek.

Kısırlaştırma İhmal:
Kedinizi kısırlaştırmamak, istenmeyen sağlık sorunlarına ve davranış problemlerine yol açabilir.

Zehirli Bitkileri Eve Almak:
Evde zehirli bitkiler bulundurmak.

Oyuncak Eksikliği:
Kediyi oyalamak için yeterli oyuncak ve aktivite sağlamamak.

Dışarıda Dolaşmasına İzin Vermek:
Kediyi kontrolsüz bir şekilde dışarıda bırakmak, tehlikelere ve hastalıklara maruz bırakabilir.

Aşırı İlgi Göstermek:
Kediye aşırı ilgi göstermek ve onu rahat bırakmamak.

Doğal Davranışlara Engel Olmak:
Kedinin doğal davranışlarına engel olmak, örneğin tırnak çekmeyi tamamen engellemek.

Yetersiz Tıbbi Müdahale:
Kedinin sağlık sorunlarına karşı yetersiz tıbbi müdahalede bulunmamak.

Eksik Su Temini:
Kedinin her zaman temiz suya erişimini sağlamamak.

Aşırı Sosyal İzolasyon:
Kediyi aşırı izole etmek ve sosyal etkileşimi sınırlamak.

Gereksiz Yüksek Yerlere Çıkma İzni:
Kedinin yüksek yerlere çıkmasına izin vermek, düşme riski yaratabilir.

Veteriner Tavsiyelerini Yoksaymak:
Veterinerin önerilerini dikkate almamak.

İnternet Diyetlerine Güvenmek:
Kediyi internette bulunan diyetlere sokmak.

Eksik Parazit Kontrolü:
Parazit kontrolünü ihmal etmek.

Aşı Takvimine Uymamak:
Kedinin aşı takvimine uymamak.

Sürekli Değişen Ortam:
Kedinin sürekli değişen bir ortamda yaşamasına neden olmak.

Dengesiz Diyetler:
Dengesiz ya da tek tip diyetler uygulamak.

Aşırı Şımartma:
Kediyi aşırı şımartmak ve sınırları olmayan davranışları teşvik etmek.

Obeziteye Teşvik:
Kediyi aşırı beslemek ve obeziteye neden olmak.

Güvensiz Oyuncaklar:
Kedinin oynaması için güvensiz oyuncaklar kullanmak.

Dışkı Kontrolünü İhmal Etmek:
Kedinin dışkı kontrolünü göz ardı etmek.

Oyuncak Eksikliği:
Kediyi oyalamak için yeterli oyuncak ve aktivite sağlamamak.

Diş Sağlığına Dikkat Etmemek:
Kedinin diş sağlığına dikkat etmemek.

Bu hatalardan kaçınarak ve kedinizle düzenli iletişim kurarak sağlıklı ve mutlu bir ortam oluşturabilirsiniz.
            """,
      ),
      VideoData(
        videoId: 'D8hjPZMpOg8',
        basliktext: "Kedimi eve ve kendime\n nasıl alıştırabilirim?",
        additionalText: "Kedimi eve ve kendime nasıl alıştırabilirim?",
        text:
            """Kedinizi eve ve size alıştırmak için birkaç adımı takip edebilirsiniz. İşte bu süreci kolaylaştırmak için bazı öneriler:

Yavaş ve Sabırlı Olun:
Yeni bir ortama alışmak zaman alabilir. Sabırlı olun ve kedinizin kendi hızında adapte olmasına izin verin.

Özel Bir Alan Oluşturun:
Kedinize, kendisine ait bir köşe ya da oda tahsis edin. Burası, kedinizin güvende hissetmesine ve çevresini keşfetmesine yardımcı olacaktır.

Sakin Bir Ortam Sağlayın:
Kedinizi evin gürültülü bölgelerinden uzak tutun. Başlangıçta sakin bir ortam, kedinizin daha rahat hissetmesine yardımcı olabilir.

Yavaşça Tanıştırma:
Kedinizle yavaşça tanışın. Acele etmeyin ve kedinizin size alışmasına izin verin.

Lezzetli Ödüllerle Motive Edin:
Kedinize lezzetli ödüller vererek pozitif bir bağ kurabilirsiniz. Bu, kedinizin size karşı olumlu duygular geliştirmesine yardımcı olur.

Oyun ve Etkinliklerle Bağ Kurun:
Kedinizle oyunlar oynayarak ve etkileşimde bulunarak aranızdaki bağı güçlendirebilirsiniz.

Dokunma ve Sevgi Gösterme:
Kediniz size alıştıkça, ona nazikçe dokunun ve sevgi gösterin. Ancak bu konuda kedinizin sınırlarına saygı göstermek önemlidir.

Rutinler Oluşturun:
Kediniz rutinleri sever. Ona sabah ve akşam aynı saatlerde yemek vermek, kedinizin size alışmasına yardımcı olabilir.

Veteriner Kontrolleri:
Kedinizin sağlığına düzenli olarak dikkat edin ve veteriner kontrollerini ihmal etmeyin.
Her kedi farklıdır, bu nedenle kedinizin kişiliğine ve ihtiyaçlarına özel bir şekilde yaklaşmak önemlidir. Unutmayın ki her kedi kendi hızında alışır, bu yüzden süreci sabırla ve sevgiyle yönetmek önemlidir.""",
      ),
    ];
  }

  void toggleTextVisibility(int index) {
    videoDataList[index].isTextVisible = !videoDataList[index].isTextVisible;
    notifyListeners();
  }
}
