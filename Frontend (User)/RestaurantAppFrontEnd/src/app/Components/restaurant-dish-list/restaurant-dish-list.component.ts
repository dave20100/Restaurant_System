import { Component, OnInit, Input } from '@angular/core';
import { RestApiHandlerService } from 'src/app/Services/rest-api-handler.service';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-restaurant-dish-list',
  templateUrl: './restaurant-dish-list.component.html',
  styleUrls: ['./restaurant-dish-list.component.css']
})
export class RestaurantDishListComponent implements OnInit {

  @Input() id: string;
  dishes: Observable<any>;

  constructor(private restApiService: RestApiHandlerService) { }

  ngOnInit() {
    this.dishes = this.restApiService.getRestaurantDishes(this.id);
  }

}
