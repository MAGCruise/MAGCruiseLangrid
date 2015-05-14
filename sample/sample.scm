(display (langrid:BilingualDictionary-search "Lsd" "en" "ja" "bank" "COMPLETE" ))

(define original-sentence "今日は晴れです．")
(let* ((translated-sentence
          (langrid:Translation-translate "GoogleTranslate" "ja" "en" original-sentence))
       (back-translated-sentence
          (langrid:Translation-translate "GoogleTranslate" "en" "ja" translated-sentence)))
(display original-sentence)
(display translated-sentence)
(display back-translated-sentence))


(display 
  (langrid:TranslationWithTemporalDictionary-translate 
    "TranslationCombinedWithBilingualDictionaryWithLongestMatchSearch" "ja" "en" "京都の比叡山を含む東山は東山３６峰とも呼ばれています．"
    (Translation[] (make Translation "東山３６峰" (String[] "HIGASHIYAMA36HOU")))
    "en"
    '("TranslationPL" "KyotoUJServer")
    '("BilingualDictionaryWithLongestMatchSearchPL" "KyotoTourismDictionary")))
