import { Children } from './children'
import { Staff } from './staff'
import { Vaccines } from './vaccine'

export interface Vaccination {
  id: string
  schedule: Date
  note?: string
  status?: number
  child?: Children
  doctor?: Staff
  currentSequence: number;
  vaccinator?: Staff
  vaccine?: Vaccines
  price?: number
}

export interface AllVaccinationHistory {
  category: {
    name: string
  }
  vaccinations: VaccinationHistory[]
}

export interface VaccinationHistory {
  id: string
  schedule: Date
  status: string
  name: string
  currentSequence: number
}
