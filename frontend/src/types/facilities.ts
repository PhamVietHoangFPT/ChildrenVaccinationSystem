export interface FacilityItem {
  id: string
  vaccine: {
    id: string
    name: string
    price: number
  }
}

export interface Facilities {
  id: string
  name: string
  address: string
  facilityItems?: FacilityItem[]
}

export interface FacilityDetails {
  id: string
  name: string
  price: number
  packageItems: {
    vaccine: {
      id: string
      name: string
      price: number
    }
  }[]
}
