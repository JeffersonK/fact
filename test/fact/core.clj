(ns fact.test.core
  (:use [fact.core])
  ;;(:import [com.hvf.alephnull.fact.thrift])
  (:use [clojure.test])  
  )

;;(def sample-fact-obj
;;  (doto (AlpephNullFact.) 
;;    (.setP_uuid (str (java.util.UUID/randomUUID)))

;;    (.setFirst_name "Homer")
;;    (.setLast_name "Simpson")
;;    (.setMiddle_name "Jay")
;;    (.setGender Gender/MALE)


;;)
;;  )
  

(deftest test-fact-all
  (testing "Serializing and deserializing A Fact"
    
    ;;(let [serialized-person (to-thrift sample-fact-obj)]
    ;;  (is serialized-person "Serialized from TBase" ))
    )
  )

 ;;(deftest a-test
 ;; (testing "FIXME, I fail."
 ;;   (is (= 0 1))))