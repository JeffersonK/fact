(defproject fact "0.1.0-SNAPSHOT"
  :omit-default-repositories false
  :repositories {
                 "conjars" "http://conjars.org/repo"
                 ;;"sun"  "http://download.java.net/maven/2"	
                }
  :description "Sample project serializing and deserializing Thrift/TBase Facts"
  :dependencies [[org.clojure/clojure "1.2.0"]
                 [org.clojure/clojure-contrib "1.2.0"]
		 [org.apache.thrift/libthrift "0.8.0"]                 
                 ]
  :javac-options {:debug "true" :fork "true"}
  :dev-dependencies [[lein-thrift "0.1.0"]]
  :thrift-source-path "thrift"
  :thrift-java-path "src/java"
  :source-path "src/clj"
  :aot :all
  :java-source-path "src/java"
  ;;:extra-classpath-dirs ["classes"]
  :hooks [leiningen.hooks.thrift]
  )
