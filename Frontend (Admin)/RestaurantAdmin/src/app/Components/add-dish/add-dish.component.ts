import { Component, OnInit } from '@angular/core';
import { RestApiService } from 'src/app/Services/rest-api.service';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-add-dish',
  templateUrl: './add-dish.component.html',
  styleUrls: ['./add-dish.component.css']
})
export class AddDishComponent implements OnInit {

  name: string;
  price: number;
  kcal: number;
  url: string;
  description: string;
  constructor(private restApiService: RestApiService,
              private route: ActivatedRoute,
              private router: Router) { }

  ngOnInit() {
  }

  onSubmit() {
    console.log(this.url);
    const id = this.route.snapshot.paramMap.get('id');
    const dishValue: Dish = {id: 333, description: this.description,
      price: this.price, kcal: this.kcal, menuId: Number(id), title: this.name, picture: this.url};
    this.restApiService.createDish(dishValue).subscribe(
      (val) => {
          console.log('POST call successful value returned in body',
                      val);
          this.router.navigateByUrl('/Menu/' + id);
      },
      response => {
          console.log('POST call in error', response);
      },
      () => {
          console.log('The POST observable is now completed.');
      });
    }
}
export interface Dish {
  id: number;
  title: string;
  description: string;
  kcal: number;
  price: number;
  picture: string;
  menuId: number;
}
