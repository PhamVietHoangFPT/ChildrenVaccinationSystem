export interface Vaccines {
  id: string
  name: string
  images?: {
    imageSource: string
  }[]
  description?: string
  price?: number
  startRecommendAge?: number
  endRecommendAge?: number
  sequence?: number
  dosage?: string
  dosageInterval?: number
}
