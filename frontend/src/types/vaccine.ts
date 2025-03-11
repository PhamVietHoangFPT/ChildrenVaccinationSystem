export interface Vaccines {
  id: number
  name: string
  imageUrl?: string
  description?: string
  price?: number
  startRecommendAge?: number
  endRecommendAge?: number
  sequence?: number
  dosage?: string
  dosageInterval?: number
}
