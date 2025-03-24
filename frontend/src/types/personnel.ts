export interface Personnel {
    id: string
    name: string
    dateOfBirth: string 
    phoneNumber?: string 
    email: string
    gender: boolean
    role: string
    address?: string
    facility: {
      id: string
      name: string
      address: string
    }
    children: any[] 
    doctorVaccinations: any[]
    vaccinatorVaccinations: any[]
  }
  