import { LightningElement, api } from 'lwc';

export default class VideoPlayer extends LightningElement {
    @api videoURL;

    @api get isPlaying() {
        const player = this.template.querySelector('video');
        return player !== null && player.paused === false;
    }

    @api get play() {
        const player = this.template.querySelector('video');
        if(player) {
            player.play();
        }
    }

    @api get pause() {
        const player = this.template.querySelector('video');
        if(player) {
            player.pause();
        }
    }

    get videoType() {
        return 'video/' + this.videoURL.split('.').pop();
    }
}