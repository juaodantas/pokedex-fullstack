import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'poke-search',
  templateUrl: './poke-search.component.html',
  styleUrls: ['./poke-search.component.scss']
})
export class PokeSearchComponent implements OnInit {
  @Output() onSubmit = new EventEmitter();
  @Input() btnText!: string;

  pokemonForms!: FormGroup;

  constructor( ) {}

  ngOnInit(): void {
    this.pokemonForms = new FormGroup({
      name: new FormControl('', Validators.required), 
    })
  }

  get name(){
    return this.pokemonForms.get('name')!;
  }
  
  submit(){
    if(this.pokemonForms.invalid){
      return;
    }
    
    this.onSubmit.emit(this.pokemonForms.value);
  }
}
