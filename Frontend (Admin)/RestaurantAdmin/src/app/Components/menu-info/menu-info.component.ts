import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import { RestApiService } from 'src/app/Services/rest-api.service';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-menu-info',
  templateUrl: './menu-info.component.html',
  styleUrls: ['./menu-info.component.css']
})
export class MenuInfoComponent implements OnInit {

  menu: Observable<any>;

  constructor(private restApiService: RestApiService,
              private route: ActivatedRoute,
              private router: Router) { }

  ngOnInit() {
    const id = this.route.snapshot.paramMap.get('id');
    this.menu = this.restApiService.getRestaurantMenu(id);
  }

  onClick(id) {
    console.log(id);
    this.router.navigateByUrl('/Dish/' + id);
  }

  onDelete() {
    const id = this.route.snapshot.paramMap.get('id');
    this.restApiService.deleteMenu(id).subscribe(
      (val) => {
          console.log('DELETE call successful value returned in body', 
                      val);
      },
      response => {
          console.log('DELETE call in error', response);
      },
      () => {
          console.log('The DELETE observable is now completed.');
      });
    this.router.navigateByUrl('');
  }

}
