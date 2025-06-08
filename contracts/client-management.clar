;; Client Management Contract
;; Manages consulting client relationships

(define-constant contract-owner tx-sender)
(define-constant err-not-authorized (err u400))
(define-constant err-client-not-found (err u401))

;; Data structures
(define-map clients
  { client: principal }
  {
    company-name: (string-ascii 100),
    industry: (string-ascii 50),
    registration-date: uint,
    active: bool,
    total-projects: uint
  }
)

(define-map client-consultants
  { client: principal, consultant: principal }
  {
    relationship-start: uint,
    projects-completed: uint,
    rating: uint
  }
)

(define-map client-feedback
  { client: principal, consultant: principal, project-id: uint }
  {
    rating: uint,
    feedback: (string-ascii 500),
    submitted-at: uint
  }
)

;; Public functions
(define-public (register-client (company-name (string-ascii 100)) (industry (string-ascii 50)))
  (begin
    (map-set clients
      { client: tx-sender }
      {
        company-name: company-name,
        industry: industry,
        registration-date: block-height,
        active: true,
        total-projects: u0
      }
    )
    (ok true)
  )
)

(define-public (establish-relationship (consultant principal))
  (begin
    (map-set client-consultants
      { client: tx-sender, consultant: consultant }
      {
        relationship-start: block-height,
        projects-completed: u0,
        rating: u0
      }
    )
    (ok true)
  )
)

(define-public (submit-feedback (consultant principal) (project-id uint) (rating uint) (feedback (string-ascii 500)))
  (begin
    (asserts! (<= rating u5) (err u402))
    (map-set client-feedback
      { client: tx-sender, consultant: consultant, project-id: project-id }
      {
        rating: rating,
        feedback: feedback,
        submitted-at: block-height
      }
    )
    (ok true)
  )
)

;; Read-only functions
(define-read-only (get-client-info (client principal))
  (map-get? clients { client: client })
)

(define-read-only (get-client-consultant-relationship (client principal) (consultant principal))
  (map-get? client-consultants { client: client, consultant: consultant })
)

(define-read-only (get-feedback (client principal) (consultant principal) (project-id uint))
  (map-get? client-feedback { client: client, consultant: consultant, project-id: project-id })
)
