(require "asdf")
(defpackage lisp
  (:use :cl :cl-json :for)
  (:export
   :main))
(in-package :lisp)

(defclass book()
  ((title :initarg :title :accessor title)
   (author :initarg :author :accessor author)
   (publisher :initarg :publisher :accessor publisher)
   (category :initarg :category :accessor category)
   (saleability :initarg :saleability :accessor saleability :documentation "this is an indicator as to wether the book is free or not")
   (isebook :initarg :isebook :accessor isebook)
   (isbn :initarg :isbn  :accessor isebook)
   (coverurl :initarg :coverurl :accessor isebook)
   )
)

(defun frequency-bags (elements &key (test #'equal))
  (let ((frequencies (make-hash-table :test test))
        (bags (make-hash-table :test #'eql)))
    (dolist (e elements) (incf (gethash e frequencies 0)))
    (maphash (lambda (k v) (push k (gethash v bags))) frequencies)
    (values bags)))
(defun getbook()
  (let ((stream  (drakma:http-request "https://www.googleapis.com/books/v1/volumes?q=The+Last+Wish&maxResults=1&key="secret"
                                                        :want-stream t)))
    (setf (flexi-streams:flexi-stream-external-format stream) :utf-8)
    (let((resultbook(cl-json:decode-json-from-source stream )))
      (format t "~a~%" (rest (assoc :kind resultbook)
                             )
              )
      ;here the filtering would take place
      )
    )
  )
   

(defun main (&optional (listen-address "tcp://*:4242"))
  (write-line "lisp server listening on port 4242")
  (pzmq:with-context nil
    (pzmq:with-socket responder :rep
      (pzmq:bind responder listen-address)
      (loop
        (let ((joske(yason:parse(pzmq:recv-string responder))))
        (let ((authorlist(loop for hashnumber in joske
                                collect(gethash "author" hashnumber))))
          (let ((categorylist(loop for hashnumber in joske
                 collect(gethash "category" hashnumber))))
           (let ((isEbooklist(loop for hashnumber in joske
                                    collect(gethash "isEbook" hashnumber))))
          (let ((publisherlist(loop for hashnumber in joske
                         collect(gethash "publisher" hashnumber))))
          (let ((saleabilitylist(loop for hashnumber in joske
                                      collect(gethash "saleability" hashnumber))))
            
            (let ((author (loop for v being each hash-value of (frequency-bags authorlist)
                            collect v)))
            (let ((category (loop for v being each hash-value of (frequency-bags categorylist)
                            collect v)))
           (let ((isebook (loop for v being each hash-value of (frequency-bags isebooklist)
                            collect v)))
           (let ((publisher (loop for v being each hash-value of (frequency-bags publisherlist)
                            collect v)))
           (let ((saleability (loop for v being each hash-value of (frequency-bags saleabilitylist)
                                    collect v)))
             
             (print (first(first author)))
             (print (first(first category)))
             (print (first(first isebook)))
             (print (first(first publisher)))
             (print (first(first saleability)))
             ;these should be passed to get book and based on that 
          )))))))))))
        
        (pzmq:send responder (json:encode-json-to-string(make-instance 'book :title "The Witcher - Het Seizoen van Stormen" :author "Andrzej Sapkowski" :publisher "Luitingh Sijthoff Fantasy" :category "Fiction" :saleability "FOR_SALE" :isebook T :isbn "9781473232488" :coverurl "http://books.google.com/books/content?id=H2RIDgAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api" )))))))
