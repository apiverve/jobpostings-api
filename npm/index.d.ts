declare module '@apiverve/jobpostings' {
  export interface jobpostingsOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface jobpostingsResponse {
    status: string;
    error: string | null;
    data: JobPostingsData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface JobPostingsData {
      company:    null | string;
      boardTotal: number | null;
      truncated:  boolean | null;
      total:      number | null;
      page:       number | null;
      pages:      number | null;
      count:      number | null;
      jobs:       Job[];
  }
  
  interface Job {
      id:              null | string;
      title:           null | string;
      department:      null | string;
      team:            null;
      location:        null | string;
      locations:       (null | string)[];
      remote:          boolean | null;
      workplaceType:   null | string;
      employmentType:  null;
      experienceLevel: null;
      postedAt:        Date | null;
      updatedAt:       Date | null;
      url:             null | string;
      applyURL:        null | string;
      summary:         null | string;
      description:     null | string;
      salary:          Salary;
  }
  
  interface Salary {
      min:      null;
      max:      null;
      currency: null;
      interval: null;
      summary:  null;
  }

  export default class jobpostingsWrapper {
    constructor(options: jobpostingsOptions);

    execute(callback: (error: any, data: jobpostingsResponse | null) => void): Promise<jobpostingsResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: jobpostingsResponse | null) => void): Promise<jobpostingsResponse>;
    execute(query?: Record<string, any>): Promise<jobpostingsResponse>;
  }
}
