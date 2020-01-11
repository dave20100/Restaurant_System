import { Component, OnInit } from '@angular/core';
import { RestApiService } from 'src/app/Services/rest-api.service';
import { ActivatedRoute, Router } from '@angular/router';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-restaurant-info',
  templateUrl: './restaurant-info.component.html',
  styleUrls: ['./restaurant-info.component.css']
})
export class RestaurantInfoComponent implements OnInit {

  restaurant: Observable<any>;

  constructor(private restApiService: RestApiService,
              private route: ActivatedRoute,
              private router: Router) { }

  ngOnInit() {
    this.route.params.subscribe(
      params => {
        this.restaurant = this.restApiService.getRestaurant(params.id);
      }
  );
  }

  onClick(id) {
    this.router.navigateByUrl('/Menu/' + id);
  }
  onDelete(id) {
    this.restApiService.deleteDiscount(id).subscribe(
      (val) => {
          console.log('DELETE call successful value returned in body',
                      val);
          window.location.reload();
      },
      response => {
          console.log('DELETE call in error', response);
      },
      () => {
          console.log('The DELETE observable is now completed.');
      });
  }
  onDeleteRestaurant(id) {
    this.restApiService.deleteRestaurant(id).subscribe(
      (val) => {
          console.log('DELETE call successful value returned in body',
                      val);
          this.router.navigateByUrl('/');
      },
      response => {
          console.log('DELETE call in error', response);
      },
      () => {
          console.log('The DELETE observable is now completed.');
      });
  }
}

