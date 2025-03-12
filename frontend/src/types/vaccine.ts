export interface Vaccines {
  id: string
  name: string
  images?: {
    imageSource: string
  }[]
  description?: string
  price?: number
  startRecommendedAge?: number
  endRecommendedAge?: number
  sequence?: number
  dosage?: string
  dosageInterval?: number
  manufacturer?: {
    name: string
    country?: {
      name: string
    }
  }
  category?: {
    id: string
    name: string
  }
  vaccineInventories?: {
    stock: number
    expiryDate: string | Date
    batchNumber: string
    facilities?: {
      id: string
      name: string
      address: string
    }
  }[]
}
