import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

// Componentes
import { PokeHeaderComponent } from './poke-header/poke-header.component';
import { PokeSearchComponent } from './poke-search/poke-search.component';
import { PokeListComponent } from './poke-list/poke-list.component';

import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MessagesComponent } from './messages/messages.component';



@NgModule({
  declarations: [
    PokeHeaderComponent,
    PokeSearchComponent,
    PokeListComponent,
    MessagesComponent
  ],
  exports:[
    PokeHeaderComponent,
    PokeListComponent,
    PokeSearchComponent
  ],
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule
  ]
})
export class SharedModule { }
