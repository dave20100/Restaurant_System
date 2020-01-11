import { Component, OnInit, Input } from '@angular/core';
import { Observable } from 'rxjs';
import { RestApiHandlerService } from 'src/app/Services/rest-api-handler.service';

@Component({
  selector: 'app-restaurant-discount',
  templateUrl: './restaurant-discount.component.html',
  styleUrls: ['./restaurant-discount.component.css']
})
export class RestaurantDiscountComponent implements OnInit {

  @Input() id: string;
  discounts: Observable<any>;
  constructor(private restApiService: RestApiHandlerService) { }

  ngOnInit() {
    this.discounts = this.restApiService.getRestaurantDiscounts(this.id);
  }

}
