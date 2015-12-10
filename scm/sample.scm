(display (langrid:BilingualDictionary-search "Lsd" "en" "ja" "bank" "COMPLETE" ))
(display "\n")
;; [jp.go.nict.langrid.service_1_2.bilingualdictionary.Translation@7a06b0fa[headWord=bank,targetWords={銀行}]]

(define original-sentence "今日は晴れです．")
(let* ((translated-sentence 
          (langrid:Translation-translate "GoogleTranslate" "ja" "en" original-sentence))
       (back-translated-sentence 
          (langrid:Translation-translate "GoogleTranslate" "en" "ja" translated-sentence)))
  (display original-sentence)(display "\n");; 今日は晴れです．
  (display translated-sentence)(display "\n");; It is sunny today.
  (display back-translated-sentence)(display "\n");; 今日は晴れです。
)

(set! original-sentence "京都の比叡山を含む東山は東山３６峰とも呼ばれています．")

;; Higashiyama including Hiei-zan in Kyoto is also called the Higashiyama 36 back.
;; Higashiyama including Mt. Hiei in capital Kyoto is also called Higashiyama 36 back.
;; Higashiyama including Mt. Hiei in capital Kyoto is also called HIGASHIYAMA36HOU .

(display 
  (langrid:Translation-translate "KyotoUJServer" "ja" "en" original-sentence))
(display "\n")

(display 
  (langrid:Translation-translate 
    "TranslationCombinedWithBilingualDictionaryWithLongestMatchSearch" "ja" "en" original-sentence
    (list "TranslationPL" "KyotoUJServer")
    (list "BilingualDictionaryWithLongestMatchSearchPL" "KyotoTourismDictionary")))
(display "\n")

(display 
  (langrid:TranslationWithTemporalDictionary-translate 
    "TranslationCombinedWithBilingualDictionaryWithLongestMatchSearch" "ja" "en" original-sentence
    (Translation[] (make Translation "東山３６峰" (String[] "HIGASHIYAMA36HOU")))
    "en"
    (list "TranslationPL" "KyotoUJServer")
    (list "BilingualDictionaryWithLongestMatchSearchPL" "KyotoTourismDictionary")))
(display "\n")

