import { Vaccination } from "./vaccination"

export interface Children {
  id: string
  name: string
  childCode?: string
  dateOfBirth?: Date
  height?: number
  weight?: number
  gender?: boolean
  medicalNote?: string
  vaccination?: Vaccination[]
}
