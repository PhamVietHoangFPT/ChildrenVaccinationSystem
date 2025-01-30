> # ⚠ **Sử dụng YARN**
>
> Phải sử dụng `yarn` thay vì `npm` để quản lý dependencies nhằm tăng hiệu suất và đảm bảo tính nhất quán.

> # ⚠ **Trước khi push code lên git cần phải chạy lệnh `yarn format`**
>
> # ⚠ **Tạo file mới theo format dưới đâyđây**

# Cấu trúc thư mục dự án React + Vite + TypeScript + Redux Toolkit + RTK Query

📂 frontend  
│── 📂 node_modules  
│── 📂 public  
│── 📂 src  
│ │── 📂 apis # Cấu hình API chính với createApi của RTK Query  
│ │ │── apiSlice.ts  
│ │── 📂 assets # Chứa ảnh, icon, font, CSS global  
│ │── 📂 components # Chứa các component dùng chung  
│ │── 📂 features # Chứa từng feature của ứng dụng (Redux logic)  
│ │ │── 📂 auth  
│ │ │ │── authSlice.ts # Redux slice của authentication  
│ │ │ │── authApi.ts # API calls liên quan đến authentication  
│ │ │── 📂 users  
│ │ │ │── usersSlice.ts # Redux slice của users  
│ │ │ │── usersApi.ts # API calls liên quan đến users  
│ │── 📂 hooks # Chứa các custom hooks  
│ │ │── useAuth.ts # Hook tùy chỉnh liên quan đến authentication  
│ │── 📂 layouts # Chứa các layout chính (MainLayout, AuthLayout,...)  
│ │── 📂 pages # Chứa các trang chính của ứng dụng  
│ │ │── 📂 Home  
│ │ │ │── Home.tsx  
│ │ │── 📂 Login  
│ │ │ │── Login.tsx  
│ │── 📂 routes # Chứa các định nghĩa routes  
│ │ │── routes.ts  
│ │── 📂 services # Chứa các file setup của Redux & API config  
│ │ │── store.ts # Cấu hình Redux store  
│ │── 📂 types # Chứa các kiểu TypeScript dùng chung  
│ │── 📂 utils # Chứa các hàm utility/helper dùng chung  
│ │── App.tsx # File root chính của ứng dụng  
│ │── main.tsx # Điểm vào chính của ứng dụng (render React)  
│── .env # File môi trường cho các biến môi trường (API_URL, v.v.)  
│── .eslintrc.js # Cấu hình ESLint  
│── .prettierrc # Cấu hình Prettier  
│── tsconfig.json # Cấu hình TypeScript  
│── vite.config.ts # Cấu hình Vite  
│── package.json # File khai báo package và scripts  
│── README.md # Hướng dẫn sử dụng dự án

## 📌 Giải thích các thư mục chính:

- **`/features`**: Chứa các Redux slice riêng biệt và các API liên quan đến từng feature.
- **`/hooks`**: Chứa các custom hooks để tái sử dụng logic.
- **`/services`**: Cấu hình `store.ts` (Redux store).
- **`/apis`** Cấu hình `sliceApi.ts` (RTK Query base API).
- **`/routes`**: Quản lý định tuyến của ứng dụng.
- **`/types`**: Định nghĩa các kiểu dữ liệu TypeScript dùng chung (ví dụ: `User`, `AuthResponse`).
- **`/utils`**: Chứa các hàm tiện ích như xử lý định dạng thời gian, validate input, v.v.
