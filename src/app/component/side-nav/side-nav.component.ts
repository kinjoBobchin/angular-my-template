import { Component } from '@angular/core';
import { SideNavStatusService } from 'src/app/service/side-nav-status/side-nav-status.service';
const packageJson = require('../../../../package.json');

@Component({
  selector: 'app-side-nav',
  templateUrl: './side-nav.component.pug',
  styleUrls: ['./side-nav.component.sass']
})
export class SideNavComponent {
  constructor(private sideNavStatusService: SideNavStatusService) {}

  version = packageJson.version;

  get sideNavStatus() {
    return this.sideNavStatusService.isOpen;
  }
}
