import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { RestaurantListComponent } from './Components/restaurant-list/restaurant-list.component';
import { AddRestaurantComponent } from './Components/add-restaurant/add-restaurant.component';
import { RestaurantInfoComponent } from './Components/restaurant-info/restaurant-info.component';
import { DiscountInfoComponent } from './Components/discount-info/discount-info.component';
import { AddDiscountComponent } from './Components/add-discount/add-discount.component';
import { MenuInfoComponent } from './Components/menu-info/menu-info.component';
import { AddMenuComponent } from './Components/add-menu/add-menu.component';
import { DishInfoComponent } from './Components/dish-info/dish-info.component';
import { AddDishComponent } from './Components/add-dish/add-dish.component';

import { HttpClientModule } from '@angular/common/http';

@NgModule({
  declarations: [
    AppComponent,
    RestaurantListComponent,
    AddRestaurantComponent,
    RestaurantInfoComponent,
    DiscountInfoComponent,
    AddDiscountComponent,
    MenuInfoComponent,
    AddMenuComponent,
    DishInfoComponent,
    AddDishComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
