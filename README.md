# Litho Shared Contracts
Shared data contracts for the Computational Lithography Decision Engine.
This repo is the contract layer between:
- Python / FastAPI backend
- React / Vite web console
- SwiftUI iOS app
It contains:
- Swift Package models
- JSON schema
- TypeScript interfaces
- sample frame payloads
- shared explanatory content
## Goals
- Keep backend, web, and iOS in sync
- Prevent drift in frame structure
- Support local development on macOS / Xcode
- Provide a stable foundation for future demo and product surfaces
## Repo Structure
```text
Sources/LithoSharedContracts/
  Swift Codable models for Xcode / SwiftUI
schemas/
  JSON schema and sample payloads
typescript/
  Interfaces for the web console
```
