
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

;; Define a map to store voters
(define-map Voters principal { voting-power: uint})


;; Define the has-voted function to check if a voter exists in the Voters map
(define-read-only (has-voted (voter principal))
	(is-some (map-get? Voters voter))
)

;; Assign voting power to a user if they don't already have one
;;(define-public (get-voting-power (voter principal))
;;	(map-set Voters tx-sender { voting-power: u1 })
;;	(ok "cool")
;;)

;; Upvote function that checks if a user has already voted
(define-public (upvote)
    (begin
        (if (has-voted tx-sender)
            (err "Already voted")
            (begin
				;; get & set the voting power of the user
                (map-set Voters tx-sender { voting-power: u1 })

				(let
					((user-power
						(get voting-power (unwrap! (map-get? Voters tx-sender)
						(err "Failed to get voting power")))
					))
					(var-set upvotes (+ (var-get upvotes) user-power))
					;; Return the updated upvote count
					(ok (var-get upvotes))
				)
            )
        )
    )
)

(define-public (downvote)
    (begin
        (if (has-voted tx-sender)
            (err "Already voted")
            (begin
				;; get & set the voting power of the user
                (map-set Voters tx-sender { voting-power: u1 })

				(let
					((user-power
						(get voting-power (unwrap! (map-get? Voters tx-sender)
						(err "Failed to get voting power")))
					))
					(var-set upvotes (- (var-get upvotes) user-power))
					;; Return the updated upvote count
					(ok (var-get upvotes))
				)
            )
        )
    )
)
