import { Component, OnInit } from '@angular/core';
import { RestApiService } from 'src/app/Services/rest-api.service';
import { ActivatedRoute, Router } from '@angular/router';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-dish-info',
  templateUrl: './dish-info.component.html',
  styleUrls: ['./dish-info.component.css']
})
export class DishInfoComponent implements OnInit {

  dish: Observable<any>;

  constructor(private restApiService: RestApiService,
              private route: ActivatedRoute,
              private router: Router) { }

  ngOnInit() {
    const id = this.route.snapshot.paramMap.get('id');
    this.dish = this.restApiService.getDish(id);
  }

  onClick(id) {
    console.log(id);
  }
  onDelete(idMenu) {
    const id = this.route.snapshot.paramMap.get('id');
    this.restApiService.deleteDish(id).subscribe(
      (val) => {
          console.log('DELETE call successful value returned in body', 
                      val);
          this.router.navigateByUrl('/Menu/' + idMenu);
      },
      response => {
          console.log('DELETE call in error', response);
      },
      () => {
          console.log('The DELETE observable is now completed.');
      });
  }
}
