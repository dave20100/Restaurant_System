import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { HttpClientModule } from '@angular/common/http';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { NavBarComponent } from './Components/nav-bar/nav-bar.component';
import { RestaurantInfoComponent } from './Components/restaurant-info/restaurant-info.component';
import { RestaurantDiscountComponent } from './Components/restaurant-discount/restaurant-discount.component';
import { RestaurantDishListComponent } from './Components/restaurant-dish-list/restaurant-dish-list.component';
import { HomePageComponent } from './Components/home-page/home-page.component';

@NgModule({
  declarations: [
    AppComponent,
    NavBarComponent,
    RestaurantInfoComponent,
    RestaurantDiscountComponent,
    RestaurantDishListComponent,
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
