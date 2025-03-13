import { Children } from "./children";

export interface Customer {
    id: string;
    name: string;
    dateOfBirth?: Date;
    email?: string;
    phoneNumber: string;
    address?: string;
    gender?: boolean;
    children?: Children[]
}

