import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RestaurantDishListComponent } from './restaurant-dish-list.component';

describe('RestaurantDishListComponent', () => {
  let component: RestaurantDishListComponent;
  let fixture: ComponentFixture<RestaurantDishListComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RestaurantDishListComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RestaurantDishListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
