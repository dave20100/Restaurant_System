import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import { RestApiService } from 'src/app/Services/rest-api.service';
import { ActivatedRoute, Router } from '@angular/router';
import { MenuInfoComponent } from '../menu-info/menu-info.component';

@Component({
  selector: 'app-add-menu',
  templateUrl: './add-menu.component.html',
  styleUrls: ['./add-menu.component.css']
})
export class AddMenuComponent implements OnInit {

  menu: Observable<any>;
  name = '';
  constructor(private restApiService: RestApiService,
              private route: ActivatedRoute,
              private router: Router) { }

  ngOnInit() {
  }

  onSubmit() {
    const id = this.route.snapshot.paramMap.get('id');
    const menuValue: Menu = {id: 15, description: this.name, resteurantId: Number(id)};
    this.restApiService.createMenu(menuValue).subscribe(
      (val) => {
          console.log('POST call successful value returned in body',
                      val);
          this.router.navigateByUrl('/Info/' + id);
      },
      response => {
          console.log('POST call in error', response);
      },
      () => {
          console.log('The POST observable is now completed.');
      });
    }
}
export interface Menu {
  id: number;
  description: string;
  resteurantId: number;
}
