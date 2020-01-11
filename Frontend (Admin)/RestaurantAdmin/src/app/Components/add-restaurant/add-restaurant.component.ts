import { Component, OnInit } from '@angular/core';
import { RestApiService } from 'src/app/Services/rest-api.service';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-add-restaurant',
  templateUrl: './add-restaurant.component.html',
  styleUrls: ['./add-restaurant.component.css']
})
export class AddRestaurantComponent implements OnInit {

  name: string;
  price: string;
  city: string;
  postCode: string;
  description: string;
  street: string;
  number: string;
  constructor(private restApiService: RestApiService,
              private route: ActivatedRoute,
              private router: Router) { }

  ngOnInit() {
  }

  onSubmit() {
    const restaurantValue: Restaurant = {id: 333, description: this.description, name: this.name,
      idNavigation: {id: 10, street: this.street, number: this.number, city: this.city, postCode: this.postCode}, discount: [], menu: []};
    this.restApiService.createRestaurant(restaurantValue).subscribe(
      (val) => {
          console.log('POST call successful value returned in body',
                      val);
          this.router.navigateByUrl('/');
      },
      response => {
          console.log('POST call in error', response);
      },
      () => {
          console.log('The POST observable is now completed.');
      });
    }
}
export interface Restaurant {
  id: number;
  name: string;
  description: string;
  idNavigation: {
    id: number;
    street: string;
    number: string;
    city: string;
    postCode: string;
  };
  discount: [];
  menu: [];
}
