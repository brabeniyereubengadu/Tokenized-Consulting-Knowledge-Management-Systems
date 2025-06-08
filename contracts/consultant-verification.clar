;; Consultant Verification Contract
;; Validates and manages consulting professionals

(define-constant contract-owner tx-sender)
(define-constant err-owner-only (err u100))
(define-constant err-already-verified (err u101))
(define-constant err-not-found (err u102))

;; Data structures
(define-map consultants
  { consultant: principal }
  {
    verified: bool,
    specialization: (string-ascii 50),
    experience-years: uint,
    verification-date: uint
  }
)

(define-map verification-requests
  { consultant: principal }
  {
    requested-at: uint,
    status: (string-ascii 20)
  }
)

;; Public functions
(define-public (request-verification (specialization (string-ascii 50)) (experience-years uint))
  (let ((consultant tx-sender))
    (map-set verification-requests
      { consultant: consultant }
      {
        requested-at: block-height,
        status: "pending"
      }
    )
    (ok true)
  )
)

(define-public (verify-consultant (consultant principal) (specialization (string-ascii 50)) (experience-years uint))
  (begin
    (asserts! (is-eq tx-sender contract-owner) err-owner-only)
    (map-set consultants
      { consultant: consultant }
      {
        verified: true,
        specialization: specialization,
        experience-years: experience-years,
        verification-date: block-height
      }
    )
    (map-set verification-requests
      { consultant: consultant }
      {
        requested-at: block-height,
        status: "approved"
      }
    )
    (ok true)
  )
)

;; Read-only functions
(define-read-only (is-verified (consultant principal))
  (match (map-get? consultants { consultant: consultant })
    consultant-data (get verified consultant-data)
    false
  )
)

(define-read-only (get-consultant-info (consultant principal))
  (map-get? consultants { consultant: consultant })
)
