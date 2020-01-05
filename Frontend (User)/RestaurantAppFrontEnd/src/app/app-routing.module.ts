import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { RestaurantInfoComponent } from './Components/restaurant-info/restaurant-info.component';
import { HomePageComponent } from './Components/home-page/home-page.component';


const routes: Routes = [
  { path: 'Info', component: RestaurantInfoComponent},
  { path: '', component: HomePageComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
