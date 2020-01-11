import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import { RestApiService } from 'src/app/Services/rest-api.service';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-add-discount',
  templateUrl: './add-discount.component.html',
  styleUrls: ['./add-discount.component.css']
})
export class AddDiscountComponent implements OnInit {

  name = '';
  value: number;
  constructor(private restApiService: RestApiService,
              private route: ActivatedRoute,
              private router: Router) { }

  ngOnInit() {
  }

  onSubmit() {
    const id = this.route.snapshot.paramMap.get('id');
    const discountValue: Discount = {id: 15, description: this.name, value: this.value, resteurantId: Number(id)};
    this.restApiService.createDiscount(discountValue).subscribe(
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
export interface Discount {
  id: number;
  description: string;
  value: number;
  resteurantId: number;
}

