import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { RestaurantInfoComponent } from './Components/restaurant-info/restaurant-info.component';
import { HomePageComponent } from './Components/home-page/home-page.component';
import { DiscountInfoComponent } from './Components/discount-info/discount-info.component';
import { MenuInfoComponent } from './Components/menu-info/menu-info.component';
import { DishInfoComponent } from './Components/dish-info/dish-info.component';
import { AddDiscountComponent } from './Components/add-discount/add-discount.component';
import { AddMenuComponent } from './Components/add-menu/add-menu.component';
import { AddDishComponent } from './Components/add-dish/add-dish.component';
import { AddRestaurantComponent } from './Components/add-restaurant/add-restaurant.component';


const routes: Routes = [
  { path: 'Info/:id', component: RestaurantInfoComponent},
  { path: 'Dish/:id', component: DishInfoComponent},
  { path: 'Menu/:id', component: MenuInfoComponent},
  { path: 'Discount/:id', component: DiscountInfoComponent},
  { path: 'AddDiscount/:id', component: AddDiscountComponent},
  { path: 'AddMenu/:id', component: AddMenuComponent},
  { path: 'AddDish/:id', component: AddDishComponent},
  { path: 'AddRestaurant', component: AddRestaurantComponent},
  { path: '', component: HomePageComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
