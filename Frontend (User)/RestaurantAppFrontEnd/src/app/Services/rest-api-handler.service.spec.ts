import { TestBed } from '@angular/core/testing';

import { RestApiHandlerService } from './rest-api-handler.service';

describe('RestApiHandlerService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: RestApiHandlerService = TestBed.get(RestApiHandlerService);
    expect(service).toBeTruthy();
  });
});
