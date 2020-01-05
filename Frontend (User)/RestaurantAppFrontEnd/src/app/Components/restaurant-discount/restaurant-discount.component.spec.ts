import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RestaurantDiscountComponent } from './restaurant-discount.component';

describe('RestaurantDiscountComponent', () => {
  let component: RestaurantDiscountComponent;
  let fixture: ComponentFixture<RestaurantDiscountComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RestaurantDiscountComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RestaurantDiscountComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
