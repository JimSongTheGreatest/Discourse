import ScrollTop from 'discourse/mixins/scroll-top';

export default Ember.View.extend(ScrollTop, {

  _highlightOnInsert: function() {
    const term = this.get('controller.q');
    const self = this;

    if(!_.isEmpty(term)) {
      Em.run.next(function(){
        self.$('.blurb').highlight(term.split(/\s+/), {className: 'search-highlight'});
        // we can highlight title, but I feel its a bit too much
        // self.$('.topic-title').highlight(term.split(/\s+/), {className: 'search-highlight'} );
      });
    }
  }.observes('controller.model').on('didInsertElement')
});
