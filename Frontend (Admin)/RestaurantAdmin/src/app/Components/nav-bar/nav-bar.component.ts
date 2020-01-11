import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import { RestApiService } from 'src/app/Services/rest-api.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-nav-bar',
  templateUrl: './nav-bar.component.html',
  styleUrls: ['./nav-bar.component.css']
})
export class NavBarComponent implements OnInit {

  id = '0';
  restaurats: Observable<any>;

  constructor(private restApiService: RestApiService, private router: Router) { }

  ngOnInit() {
    this.restaurats = this.restApiService.getRestaurants();
  }
  onChange(value) {
      this.id = value;
  }
  onClick() {
    if (this.id !== '0') {
      this.router.navigateByUrl('/');
      this.router.navigateByUrl('/Info/' + this.id);
    }

  }
}
