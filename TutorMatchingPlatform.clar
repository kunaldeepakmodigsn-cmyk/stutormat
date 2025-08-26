;; EduChain Escrow Contract
;; Handles session payments and escrow

(define-constant contract-owner tx-sender)
(define-constant err-owner-only (err u100))
(define-constant err-not-found (err u101))
(define-constant err-unauthorized (err u102))
(define-constant err-invalid-amount (err u103))
(define-constant err-session-completed (err u104))

;; Session data structure
(define-map sessions
  { session-id: uint }
  {
    student: principal,
    tutor: principal,
    amount: uint,
    status: (string-ascii 20),
    created-at: uint,
    expires-at: uint
  }
)

;; Session counter
(define-data-var session-counter uint u0)

;; Create new tutoring session with escrow
(define-public (create-session (tutor principal) (amount uint) (duration uint))
  (let
    (
      (session-id (+ (var-get session-counter) u1))
      (expires-at (+ block-height duration))
    )
    (asserts! (> amount u0) err-invalid-amount)
    (try! (stx-transfer? amount tx-sender (as-contract tx-sender)))
    (map-set sessions
      { session-id: session-id }
      {
        student: tx-sender,
        tutor: tutor,
        amount: amount,
        status: "pending",
        created-at: block-height,
        expires-at: expires-at
      }
    )
    (var-set session-counter session-id)
    (ok session-id)
  )
)

;; Complete session and release payment
(define-public (complete-session (session-id uint))
  (let
    (
      (session-data (unwrap! (map-get? sessions { session-id: session-id }) err-not-found))
    )
    (asserts! (is-eq tx-sender (get student session-data)) err-unauthorized)
    (asserts! (is-eq (get status session-data) "pending") err-session-completed)
    (try! (as-contract (stx-transfer? (get amount session-data) tx-sender (get tutor session-data))))
    (map-set sessions
      { session-id: session-id }
      (merge session-data { status: "completed" })
    )
    (ok true)
  )
)

;; Cancel session and refund (if not started)
(define-public (cancel-session (session-id uint))
  (let
    (
      (session-data (unwrap! (map-get? sessions { session-id: session-id }) err-not-found))
    )
    (asserts! (is-eq tx-sender (get student session-data)) err-unauthorized)
    (asserts! (is-eq (get status session-data) "pending") err-session-completed)
    (try! (as-contract (stx-transfer? (get amount session-data) tx-sender (get student session-data))))
    (map-set sessions
      { session-id: session-id }
      (merge session-data { status: "cancelled" })
    )
    (ok true)
  )
)

;; Get session details
(define-read-only (get-session (session-id uint))
  (map-get? sessions { session-id: session-id })
)

;; Get session counter
(define-read-only (get-session-count)
  (var-get session-counter)
)