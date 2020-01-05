import { Component, OnInit } from '@angular/core';
import { RestApiHandlerService } from 'src/app/Services/rest-api-handler.service';
import { Observable } from 'rxjs';
@Component({
  selector: 'app-nav-bar',
  templateUrl: './nav-bar.component.html',
  styleUrls: ['./nav-bar.component.css']
})
export class NavBarComponent implements OnInit {

  restaurats: Observable<any>;

  constructor(private restApiService: RestApiHandlerService) { }

  ngOnInit() {
    this.restaurats = this.restApiService.getRestaurants();
  }
}
