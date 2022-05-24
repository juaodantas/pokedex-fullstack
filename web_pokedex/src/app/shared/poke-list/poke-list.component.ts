import { Component, OnInit } from '@angular/core';
import { ApiService } from 'src/app/service/api.service';
import { MessagesService } from 'src/app/service/messages.service';


@Component({
  selector: 'poke-list',
  templateUrl: './poke-list.component.html',
  styleUrls: ['./poke-list.component.scss']
})
export class PokeListComponent implements OnInit {
  btnText = 'Capturar!';

  constructor(
    private apiService: ApiService,
    private messagesService: MessagesService,
  ) { }

  public readData:any;
  public message:any = 0;

  ngOnInit(): void {
    console.log(this.apiService.apiListAllPokemons())
    this.apiService.apiListAllPokemons().subscribe(res=>{
      console.log(res,"res==>");
      this.readData = res;
      if(this.readData == undefined || this.readData.length === 0 ){
        this.messagesService.fixed('Sua lista de Pokemon vazia! \n Capture um Pokemon')
      }
    });
  }

  async createHandler(name: string){

    let pokemon = Object.values(name);

    const isCatch = {isCatch: true};
    
    await this.apiService.updatePokemonData(pokemon.toString(), isCatch).subscribe(
      (error) => {
        this.messagesService.add(error.message.message)
      },
    );
    
    this.messagesService.add('Pokemon adicionado com sucesso!')

    window.location.reload();

  }

  async deletePokemon(name: string){

    const isCatch = {isCatch: false};
    
    await this.apiService.updatePokemonData(name, isCatch).subscribe();

    window.location.reload();

    this.messagesService.add('Pokemon retirado da pokedex!')

  }

}
