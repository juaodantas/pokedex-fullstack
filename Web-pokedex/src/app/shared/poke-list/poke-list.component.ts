import { Component, OnInit } from '@angular/core';
import { ApiService } from 'src/app/service/api.service';



@Component({
  selector: 'poke-list',
  templateUrl: './poke-list.component.html',
  styleUrls: ['./poke-list.component.scss']
})
export class PokeListComponent implements OnInit {
  btnText = 'Capturar!';

  constructor(
    private apiService: ApiService 
  ) { }

  public readData:any;

  ngOnInit(): void {
    console.log(this.apiService.apiListAllPokemons())
    this.apiService.apiListAllPokemons().subscribe(res=>{
      console.log(res,"res==>");
      this.readData = res;
    });
  }

  async createHandler(name: string){

    
    const isCatch = {isCatch: true};
    

    await this.apiService.updatePokemonData(name, isCatch).subscribe();
  }


}
