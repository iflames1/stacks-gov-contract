
;; title: voting
;; version:
;; summary:
;; description:

;; traits
;;

;; token definitions
;;

;; constants
;;

;; data vars
;;

;; data maps
;;

;; public functions
;;

;; read only functions
;;

;; private functions
;;


;; Define variables to store counts
(define-data-var upvotes uint u0)
(define-data-var downvotes uint u0)

(define-public (upvote)
	(begin
		(var-set upvotes (+ (var-get upvotes) u1))
		(ok (var-get upvotes))
	)
)

(define-public (downvote)
	(begin
		(var-set downvotes (+ (var-get downvotes) u1))
		(ok (var-get downvotes))
	)
)