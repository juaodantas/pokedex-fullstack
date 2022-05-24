import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

//Observable
import { Observable, tap } from 'rxjs';


@Injectable({
  providedIn: 'root'
})
export class ApiService {
  private apiUrl: string="http://localhost:3000/pokemon"
  constructor(
    private _http: HttpClient,
  ) { }

  apiListAllPokemons():Observable<any>{
    var req = this._http.get(this.apiUrl);
    return req;
  }
  
  updatePokemonData( name: string, isCatch: Object):Observable<any>{
    var pokemon = Object.values(name);
    var url = this.apiUrl + '/' + pokemon
    console.log(url)
    return this._http.patch( `${this.apiUrl}/${pokemon}`, isCatch );
  }
}
