import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

//Observable
import { catchError, Observable, of } from 'rxjs';


@Injectable({
  providedIn: 'root'
})
export class ApiService {
  private apiUrl: string="http://localhost:3000/pokemon"
  constructor(
    private _http: HttpClient,
  ) { }

  // GET my pokemons
  apiListAllPokemons():Observable<any>{
    var req = this._http.get(this.apiUrl);
    return req;
  }
  
  //PUTH pokemon data
  updatePokemonData( name: string, isCatch: Object):Observable<any>{
   
    return this._http.patch( `${this.apiUrl}/${name}`, isCatch ).pipe(
      catchError(val=> of(val))
    );
    
  }
}
