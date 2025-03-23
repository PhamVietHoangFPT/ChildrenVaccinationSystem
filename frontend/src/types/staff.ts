import { Facilities } from "./facilities";

export interface Staff {
    id: string;
    name: string;
    dateOfBirth?: Date;
    phoneNumber?: string;
    email?: string;
    role: string;
    address?: string;
    gender?: boolean;
    facility?: Facilities;
}