import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { HttpClientModule } from '@angular/common/http';

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
import { NavBarComponent } from './Components/nav-bar/nav-bar.component';
import { HomePageComponent } from './Components/home-page/home-page.component';

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
    AddDishComponent,
    NavBarComponent,
    HomePageComponent
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
