(display "(load langrid.scm ... ")
(define-alias Translation jp.go.nict.langrid.service_1_2.bilingualdictionary.Translation)

;; 使用には*endpointPath*, *langridUserId*, *langridPasswd*の定義が必須
(define *endpointPath* "http://langrid.org/service_manager/invoker")
(define *langridUserId* #!null)
(define *langridPasswd* #!null)

(define-alias TranslationWithTemporalDictionaryService jp.go.nict.langrid.service_1_2.translation.TranslationWithTemporalDictionaryService)


(define (langrid:set-proxy host port)
  (<java.lang.System>:setProperty "http.proxyHost" host)
  (<java.lang.System>:setProperty "http.proxyPort" port))

(define (langrid:set-proxy-with-auth host port user passwd)
  (set-proxy host port)
  (<java.net.Authenticator>:setDefault (org.magcruise.gaming.langrid.ProxyAuthenticator user passwd)))

(define (langrid:make-client service-clazz ::java.lang.Class serviceId ::string bindings ::list)
  (org.magcruise.gaming.langrid.ClientFactory:create
    service-clazz (string-append *endpointPath* "/" serviceId) *langridUserId*  *langridPasswd* bindings))

(define (langrid:AdjacencyPair-search serviceId category language firstTurn matchingMethod . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.adjacencypair.AdjacencyPairService serviceId bindings)
          'search category language firstTurn matchingMethod))

(define (langrid:AsyncBackTranslation-getCurrentResult serviceId token . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.backtranslation.AsyncBackTranslationService serviceId bindings)
          'getCurrentResult token))

(define (langrid:AsyncBackTranslation-startBackTranslation serviceId sourceLang intermediateLang sources . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.backtranslation.AsyncBackTranslationService serviceId bindings)
          'startBackTranslation sourceLang intermediateLang sources))

(define (langrid:AsyncBackTranslation-terminate serviceId token . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.backtranslation.AsyncBackTranslationService serviceId bindings)
          'terminate token))

(define (langrid:AsyncBackTranslationWithTemporalDictionary-getCurrentResult serviceId token . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.backtranslation.AsyncBackTranslationWithTemporalDictionaryService serviceId bindings)
          'getCurrentResult token))

(define (langrid:AsyncBackTranslationWithTemporalDictionary-startBackTranslation serviceId sourceLang intermediateLang sources temporalDict dictTargetLang . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.backtranslation.AsyncBackTranslationWithTemporalDictionaryService serviceId bindings)
          'startBackTranslation sourceLang intermediateLang sources temporalDict dictTargetLang))

(define (langrid:AsyncBackTranslationWithTemporalDictionary-terminate serviceId token . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.backtranslation.AsyncBackTranslationWithTemporalDictionaryService serviceId bindings)
          'terminate token))

(define (langrid:BackTranslation-backTranslate serviceId sourceLang intermediateLang source . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.backtranslation.BackTranslationService serviceId bindings)
          'backTranslate sourceLang intermediateLang source))

(define (langrid:BackTranslationWithTemporalDictionary-backTranslate serviceId sourceLang intermediateLang source temporalDict dictTargetLang . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.backtranslation.BackTranslationWithTemporalDictionaryService serviceId bindings)
          'backTranslate sourceLang intermediateLang source temporalDict dictTargetLang))

(define (langrid:MultistatementBackTranslation-multistatementBackTranslate serviceId sourceLang intermediateLang sources . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.backtranslation.MultistatementBackTranslationService serviceId bindings)
          'multistatementBackTranslate sourceLang intermediateLang sources))

(define (langrid:MultistatementBackTranslationWithTemporalDictionary-multistatementBackTranslate serviceId sourceLang intermediateLang sources temporalDict dictTargetLang . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.backtranslation.MultistatementBackTranslationWithTemporalDictionaryService serviceId bindings)
          'multistatementBackTranslate sourceLang intermediateLang sources temporalDict dictTargetLang))

(define (langrid:BilingualDictionaryHeadwordsExtraction-extract serviceId headLang targetLang text . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.bilingualdictionary.BilingualDictionaryHeadwordsExtractionService serviceId bindings)
          'extract headLang targetLang text))

(define (langrid:BilingualDictionary-getLastUpdate serviceId  . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.bilingualdictionary.BilingualDictionaryService serviceId bindings)
          'getLastUpdate ))

(define (langrid:BilingualDictionary-getSupportedLanguagePairs serviceId  . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.bilingualdictionary.BilingualDictionaryService serviceId bindings)
          'getSupportedLanguagePairs ))

(define (langrid:BilingualDictionary-getSupportedMatchingMethods serviceId  . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.bilingualdictionary.BilingualDictionaryService serviceId bindings)
          'getSupportedMatchingMethods ))

(define (langrid:BilingualDictionary-search serviceId headLang targetLang headWord matchingMethod . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.bilingualdictionary.BilingualDictionaryService serviceId bindings)
          'search headLang targetLang headWord matchingMethod))

(define (langrid:BilingualDictionaryWithLongestMatchSearch-searchLongestMatchingTerms serviceId headLang targetLang morphemes . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.bilingualdictionary.BilingualDictionaryWithLongestMatchSearchService serviceId bindings)
          'searchLongestMatchingTerms headLang targetLang morphemes))

(define (langrid:EditableBilingualDictionary-addLanguage serviceId languages . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.bilingualdictionary.EditableBilingualDictionaryService serviceId bindings)
          'addLanguage languages))

(define (langrid:EditableBilingualDictionary-addTerm serviceId terms . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.bilingualdictionary.EditableBilingualDictionaryService serviceId bindings)
          'addTerm terms))

(define (langrid:EditableBilingualDictionary-deleteLanguage serviceId languages . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.bilingualdictionary.EditableBilingualDictionaryService serviceId bindings)
          'deleteLanguage languages))

(define (langrid:EditableBilingualDictionary-deleteTerm serviceId termIds . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.bilingualdictionary.EditableBilingualDictionaryService serviceId bindings)
          'deleteTerm termIds))

(define (langrid:EditableBilingualDictionary-getLastUpdate serviceId  . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.bilingualdictionary.EditableBilingualDictionaryService serviceId bindings)
          'getLastUpdate ))

(define (langrid:EditableBilingualDictionary-getSupportedMatchingMethods serviceId  . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.bilingualdictionary.EditableBilingualDictionaryService serviceId bindings)
          'getSupportedMatchingMethods ))

(define (langrid:EditableBilingualDictionary-listLanguage serviceId  . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.bilingualdictionary.EditableBilingualDictionaryService serviceId bindings)
          'listLanguage ))

(define (langrid:EditableBilingualDictionary-searchTerm serviceId startIndex maxCount language conditions orders . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.bilingualdictionary.EditableBilingualDictionaryService serviceId bindings)
          'searchTerm startIndex maxCount language conditions orders))

(define (langrid:EditableBilingualDictionary-setTerm serviceId entries . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.bilingualdictionary.EditableBilingualDictionaryService serviceId bindings)
          'setTerm entries))

(define (langrid:MultilingualDictionary-getLastUpdate serviceId  . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.bilingualdictionary.MultilingualDictionaryService serviceId bindings)
          'getLastUpdate ))

(define (langrid:MultilingualDictionary-getSupportedLanguagePairs serviceId  . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.bilingualdictionary.MultilingualDictionaryService serviceId bindings)
          'getSupportedLanguagePairs ))

(define (langrid:MultilingualDictionary-getSupportedMatchingMethods serviceId  . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.bilingualdictionary.MultilingualDictionaryService serviceId bindings)
          'getSupportedMatchingMethods ))

(define (langrid:MultilingualDictionary-search serviceId headLang targetLangs headWord matchingMethod . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.bilingualdictionary.MultilingualDictionaryService serviceId bindings)
          'search headLang targetLangs headWord matchingMethod))

(define (langrid:MultilingualDictionaryWithLongestMatchSearch-searchLongestMatchingTerms serviceId headLang targetLangs morphemes . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.bilingualdictionary.MultilingualDictionaryWithLongestMatchSearchService serviceId bindings)
          'searchLongestMatchingTerms headLang targetLangs morphemes))

(define (langrid:ConceptDictionary-getRelatedConcepts serviceId language conceptId relation . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.conceptdictionary.ConceptDictionaryService serviceId bindings)
          'getRelatedConcepts language conceptId relation))

(define (langrid:ConceptDictionary-searchConcepts serviceId language word matchingMethod . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.conceptdictionary.ConceptDictionaryService serviceId bindings)
          'searchConcepts language word matchingMethod))

(define (langrid:DependencyParser-parseDependency serviceId language sentence . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.dependencyparser.DependencyParserService serviceId bindings)
          'parseDependency language sentence))

(define (langrid:MorphemesDependencyParser-parseDependency serviceId language morphs . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.dependencyparser.MorphemesDependencyParserService serviceId bindings)
          'parseDependency language morphs))

(define (langrid:ExampleBasedTranslation-appendExamples serviceId corpusId sourceLang targetLang examples . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.examplebasedtranslation.ExampleBasedTranslationService serviceId bindings)
          'appendExamples corpusId sourceLang targetLang examples))

(define (langrid:ExampleBasedTranslation-createTrainingCorpus serviceId sourceLang targetLang examples . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.examplebasedtranslation.ExampleBasedTranslationService serviceId bindings)
          'createTrainingCorpus sourceLang targetLang examples))

(define (langrid:ExampleBasedTranslation-destroyTrainingCorpus serviceId corpusId . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.examplebasedtranslation.ExampleBasedTranslationService serviceId bindings)
          'destroyTrainingCorpus corpusId))

(define (langrid:ExampleBasedTranslation-getTrainingCorpusInfo serviceId corpusId . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.examplebasedtranslation.ExampleBasedTranslationService serviceId bindings)
          'getTrainingCorpusInfo corpusId))

(define (langrid:ExampleBasedTranslation-replaceExamples serviceId corpusId sourceLang targetLang examples . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.examplebasedtranslation.ExampleBasedTranslationService serviceId bindings)
          'replaceExamples corpusId sourceLang targetLang examples))

(define (langrid:ExampleBasedTranslation-translate serviceId sourceLang targetLang source . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.examplebasedtranslation.ExampleBasedTranslationService serviceId bindings)
          'translate sourceLang targetLang source))

(define (langrid:ExampleBasedTranslation-translateWithTrainingCorpus serviceId corpusIds sourceLang targetLang source . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.examplebasedtranslation.ExampleBasedTranslationService serviceId bindings)
          'translateWithTrainingCorpus corpusIds sourceLang targetLang source))

(define (langrid:ExampleTemplate-getExampleTemplates serviceId language text matchingMethod categoryIds . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.exampletemplate.ExampleTemplateService serviceId bindings)
          'getExampleTemplates language text matchingMethod categoryIds))

(define (langrid:ExampleTemplate-getExampleTemplatesByExampled serviceId language exampleIds . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.exampletemplate.ExampleTemplateService serviceId bindings)
          'getExampleTemplatesByExampled language exampleIds))

(define (langrid:ExampleTemplate-getParallelTexts serviceId sourceLang targetLang source matchingMethod exampleId filledBlanks . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.exampletemplate.ExampleTemplateService serviceId bindings)
          'getParallelTexts sourceLang targetLang source matchingMethod exampleId filledBlanks))

(define (langrid:KeyphraseExtract-extract serviceId language text . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.keyphraseextract.KeyphraseExtractService serviceId bindings)
          'extract language text))

(define (langrid:KeyphraseExtract-getSupportedLanguages serviceId  . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.keyphraseextract.KeyphraseExtractService serviceId bindings)
          'getSupportedLanguages ))

(define (langrid:LanguageIdentification-getSupportedEncodings serviceId  . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.languageidentification.LanguageIdentificationService serviceId bindings)
          'getSupportedEncodings ))

(define (langrid:LanguageIdentification-getSupportedLanguages serviceId  . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.languageidentification.LanguageIdentificationService serviceId bindings)
          'getSupportedLanguages ))

(define (langrid:LanguageIdentification-identify serviceId text originalEncoding . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.languageidentification.LanguageIdentificationService serviceId bindings)
          'identify text originalEncoding))

(define (langrid:LanguageIdentification-identifyLanguageAndEncoding serviceId textBytes . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.languageidentification.LanguageIdentificationService serviceId bindings)
          'identifyLanguageAndEncoding textBytes))

(define (langrid:MorphologicalAnalysis-analyze serviceId language text . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.morphologicalanalysis.MorphologicalAnalysisService serviceId bindings)
          'analyze language text))

(define (langrid:MultihopTranslation-multihopTranslate serviceId sourceLang intermediateLangs targetLang source . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.multihoptranslation.MultihopTranslationService serviceId bindings)
          'multihopTranslate sourceLang intermediateLangs targetLang source))

(define (langrid:MultihopTranslationWithTemporalDictionary-multihopTranslate serviceId sourceLang intermediateLangs targetLang source temporalDict dictTargetLang . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.multihoptranslation.MultihopTranslationWithTemporalDictionaryService serviceId bindings)
          'multihopTranslate sourceLang intermediateLangs targetLang source temporalDict dictTargetLang))

(define (langrid:NamedEntityTagging-getSupportedLanguages serviceId  . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.namedentitytagging.NamedEntityTaggingService serviceId bindings)
          'getSupportedLanguages ))

(define (langrid:NamedEntityTagging-tag serviceId language text . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.namedentitytagging.NamedEntityTaggingService serviceId bindings)
          'tag language text))

(define (langrid:ParallelText-search serviceId sourceLang targetLang text matchingMethod . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.paralleltext.ParallelTextService serviceId bindings)
          'search sourceLang targetLang text matchingMethod))

(define (langrid:Paraphrase-paraphrase serviceId language text . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.paraphrase.ParaphraseService serviceId bindings)
          'paraphrase language text))

(define (langrid:PictogramDictionary-search serviceId language word matchingMethod . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.pictogramdictionary.PictogramDictionaryService serviceId bindings)
          'search language word matchingMethod))

(define (langrid:QualityEstimation-estimate serviceId sourceLang targetlang source target . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.qualityestimation.QualityEstimationService serviceId bindings)
          'estimate sourceLang targetlang source target))

(define (langrid:SimilarityCalculation-calculate serviceId language text1 text2 . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.similaritycalculation.SimilarityCalculationService serviceId bindings)
          'calculate language text1 text2))

(define (langrid:SpeechRecognition-getSupportedAudioTypes serviceId  . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.speech.SpeechRecognitionService serviceId bindings)
          'getSupportedAudioTypes ))

(define (langrid:SpeechRecognition-getSupportedLanguages serviceId  . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.speech.SpeechRecognitionService serviceId bindings)
          'getSupportedLanguages ))

(define (langrid:SpeechRecognition-getSupportedVoiceTypes serviceId  . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.speech.SpeechRecognitionService serviceId bindings)
          'getSupportedVoiceTypes ))

(define (langrid:SpeechRecognition-recognize serviceId language speech . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.speech.SpeechRecognitionService serviceId bindings)
          'recognize language speech))

(define (langrid:TextToSpeech-getSupportedAudioTypes serviceId  . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.speech.TextToSpeechService serviceId bindings)
          'getSupportedAudioTypes ))

(define (langrid:TextToSpeech-getSupportedLanguages serviceId  . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.speech.TextToSpeechService serviceId bindings)
          'getSupportedLanguages ))

(define (langrid:TextToSpeech-getSupportedVoiceTypes serviceId  . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.speech.TextToSpeechService serviceId bindings)
          'getSupportedVoiceTypes ))

(define (langrid:TextToSpeech-speak serviceId language text voiceType audioType . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.speech.TextToSpeechService serviceId bindings)
          'speak language text voiceType audioType))

(define (langrid:SpeechTranslation-translate serviceId sourceLang targetLang source targetVoiceType targetAudioType . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.speechtranslation.SpeechTranslationService serviceId bindings)
          'translate sourceLang targetLang source targetVoiceType targetAudioType))

(define (langrid:TranslationAndSpeech-translateAndSpeak serviceId sourceLang targetLang source targetVoiceType targetAudioType . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.speechtranslation.TranslationAndSpeechService serviceId bindings)
          'translateAndSpeak sourceLang targetLang source targetVoiceType targetAudioType))

(define (langrid:TemplateParallelText-generateSentence serviceId language templateId boundChoiceParameters boundValueParameters . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.templateparalleltext.TemplateParallelTextService serviceId bindings)
          'generateSentence language templateId boundChoiceParameters boundValueParameters))

(define (langrid:TemplateParallelText-getCategoryNames serviceId categoryId languages . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.templateparalleltext.TemplateParallelTextService serviceId bindings)
          'getCategoryNames categoryId languages))

(define (langrid:TemplateParallelText-getTemplatesByTemplateId serviceId language templateIds . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.templateparalleltext.TemplateParallelTextService serviceId bindings)
          'getTemplatesByTemplateId language templateIds))

(define (langrid:TemplateParallelText-listTemplateCategories serviceId language . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.templateparalleltext.TemplateParallelTextService serviceId bindings)
          'listTemplateCategories language))

(define (langrid:TemplateParallelText-searchTemplates serviceId language text matchingMethod categoryIds . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.templateparalleltext.TemplateParallelTextService serviceId bindings)
          'searchTemplates language text matchingMethod categoryIds))

(define (langrid:TextSummarize-getSupportedLanguages serviceId  . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.textsummarize.TextSummarizeService serviceId bindings)
          'getSupportedLanguages ))

(define (langrid:TextSummarize-summarize serviceId language text . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.textsummarize.TextSummarizeService serviceId bindings)
          'summarize language text))

(define (langrid:Translation-translate serviceId sourceLang targetLang source . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.translation.TranslationService serviceId bindings)
          'translate sourceLang targetLang source))

(define (langrid:TranslationWithInternalDictionary-getSupportedInternalDictionaryIds serviceId sourceLang targetLang . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.translation.TranslationWithInternalDictionaryService serviceId bindings)
          'getSupportedInternalDictionaryIds sourceLang targetLang))

(define (langrid:TranslationWithTemporalDictionary-translate serviceId sourceLang targetLang source temporalDict dictTargetLang . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.translation.TranslationWithTemporalDictionaryService serviceId bindings)
          'translate sourceLang targetLang source temporalDict dictTargetLang))

(define (langrid:TranslationSelection-select serviceId sourceLang targetLang source . bindings)
  (invoke (langrid:make-client jp.go.nict.langrid.service_1_2.translationselection.TranslationSelectionService serviceId bindings)
          'select sourceLang targetLang source))

(display "end)")
