(defsystem "lisp"
  :version "0.1.1"
  :author "Joey Lybaert<joeylybaert@outlook.com>"
  :license "BSD-3-Clause"
;looks locally , quicklisp has to download them
  :depends-on (:zeromq
               :drakma
               :cl-ppcre
               :cl-json
               "pzmq"
               )
  :components ((:module "src"
                :components
                ((:file "main"))))
  :build-operation "asdf:program-op" ;; leave as is
  :build-pathname "../lispscripts/lispServerBin"
  :entry-point "lisp:main"
  :description "lisp api for trending topics"
  :in-order-to ((test-op (test-op "lisp/tests"))))

(defsystem "lisp/tests"
  :author ""
  :license ""
  :depends-on ("lisp"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))  
  :description "Test system for lisp"
  :perform (test-op (op c) (symbol-call :rove :run c)))
