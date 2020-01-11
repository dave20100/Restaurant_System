import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { retry, catchError } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class RestApiHandlerService {

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
    return this.http.get<any>(this.apiURL + '/api/Restaurant/Full/' + id)
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

  getRestaurantDiscounts(id): Observable<any> {
    return this.http.get<any>(this.apiURL + '/api/Restaurant/Full/' + id)
    .pipe(
      retry(1),
      catchError(this.handleError)
    );
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
