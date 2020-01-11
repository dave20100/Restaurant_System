import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { retry, catchError } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class RestApiService {

  apiURL = 'https://localhost:5001';

  httpOptions = {
    headers: new HttpHeaders({
      'Content-Type': 'application/json'
    })
  };

  constructor(private http: HttpClient) { }

  getRestaurants(): Observable<any> {
    return this.http.get<any>(this.apiURL + '/api/Restaurant')
    .pipe(
      retry(1),
      catchError(this.handleError)
    );
  }

  getRestaurant(id): Observable<any> {
    return this.http.get<any>(this.apiURL + '/api/restaurant/full/' + id)
    .pipe(
      retry(1),
      catchError(this.handleError)
    );
  }

  getRestaurantDishes(id): Observable<any> {
    return this.http.get<any>(this.apiURL + '/api/Restaurant/Dishes/' + id)
    .pipe(
      retry(1),
      catchError(this.handleError)
    );
  }

  getDish(id): Observable<any> {
    return this.http.get<any>(this.apiURL + '/api/Dish/' + id)
    .pipe(
      retry(1),
      catchError(this.handleError)
    );
  }

  getRestaurantDiscounts(id): Observable<any> {
    return this.http.get<any>(this.apiURL + '/api/Restaurant/Discounts/' + id)
    .pipe(
      retry(1),
      catchError(this.handleError)
    );
  }

  getRestaurantMenu(id): Observable<any> {
    return this.http.get<any>(this.apiURL + '/api/Menu/' + id)
    .pipe(
      retry(1),
      catchError(this.handleError)
    );
  }

    createMenu(menu) {
      return this.http.post<any>(this.apiURL + '/api/Menu', JSON.stringify(menu), this.httpOptions);
    }

    deleteMenu(id) {
      return this.http.delete<any>(this.apiURL + '/api/Menu/' + id, this.httpOptions);
    }

    createDish(dish) {
      return this.http.post<any>(this.apiURL + '/api/Dish', JSON.stringify(dish), this.httpOptions);
    }

    deleteDish(id) {
      return this.http.delete<any>(this.apiURL + '/api/dish/' + id, this.httpOptions);
    }

    createRestaurant(restaurant) {
      return this.http.post<any>(this.apiURL + '/api/Restaurant/', JSON.stringify(restaurant), this.httpOptions);
    }

    deleteRestaurant(id) {
      return this.http.delete<any>(this.apiURL + '/api/Restaurant/' + id, this.httpOptions);
    }

    createDiscount(discount) {
      return this.http.post<any>(this.apiURL + '/api/Discount', JSON.stringify(discount), this.httpOptions);
    }

    deleteDiscount(id) {
      return this.http.delete<any>(this.apiURL + '/api/Discount/' + id, this.httpOptions);
    }

  handleError(error) {
     let errorMessage = '';
     if (error.error instanceof ErrorEvent) {
       // Get client-side error
       errorMessage = error.error.message;
     } else {
       // Get server-side error
       errorMessage = `Error Code: ${error.status}\nMessage: ${error.message}`;
     }
     window.alert(errorMessage);
     return throwError(errorMessage);
  }
}
