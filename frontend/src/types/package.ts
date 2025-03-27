export interface Packages {
  id: string
  name: string
  price: number
  packageItems: [
    {
      vaccine: {
        id: string
        name: string
        price: number
        sequence: number
      }
    },
  ]
  totalItems: number
}

export interface PackageDetails {
  id: string
  name: string
  price: number
  packageItems: [
    {
      vaccine: {
        id: string
        name: string
        price: number
      }
    },
  ]
}
