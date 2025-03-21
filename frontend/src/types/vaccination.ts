import { Children } from "./children"
import { Facilities } from "./facilities"
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

interface Staff {
    id: string;
    name: string;
    phoneNumber?: string;
    email?: string;
    gender?: boolean;
    facility?: Facilities;
}
