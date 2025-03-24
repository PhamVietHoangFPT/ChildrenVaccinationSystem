import { Children } from "./children"
import { Staff } from "./staff"
import { Vaccines } from "./vaccine"

export interface Vaccination {
    id: string
    schedule: Date
    note?: string
    status?: number
    child?: Children
    doctor?: Staff
    vaccinator?: Staff
    vaccine?: Vaccines
    price?: number
}


