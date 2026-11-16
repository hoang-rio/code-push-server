// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

// Ambient declaration: augments the Express types, so the namespace name itself is never referenced.
// eslint-disable-next-line @typescript-eslint/no-unused-vars
declare namespace Express {
  export interface Session {
    [key: string]: any;
  }

  export interface Request {
    user: any;
    session?: Session;
  }
}
