import { Component, OnInit, Input } from '@angular/core';

@Component({
  selector: 'app-restaurant-discount',
  templateUrl: './restaurant-discount.component.html',
  styleUrls: ['./restaurant-discount.component.css']
})
export class RestaurantDiscountComponent implements OnInit {

  @Input() id: string;

  constructor() { }

  ngOnInit() {
  }

}
