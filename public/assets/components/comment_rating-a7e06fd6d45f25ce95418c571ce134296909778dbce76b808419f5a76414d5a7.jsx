window.Star = React.createClass({
  render: function() {
    var r = 'fa fa-star';
    if(!this.props.selected){
      r += '-o';
    }
    return (
      <i {...this.props} className={r}/>
    );
  }
});

window.Rating = React.createClass({
  getInitialState: function(){
    return {rating: 5, hoverAt: null};
  },
  handleMouseOver: function(idx, evt){
    this.state.hoverAt = idx + 1;
    this.forceUpdate();
  },
  handleMouseOut: function(idx, evt){
    this.state.hoverAt = null;
    this.forceUpdate();
  },
  handleClick: function(idx, evt){
    this.state.rating = idx + 1;
    $('#comment_rating').val(this.state.rating);
    this.forceUpdate();
  },
  render: function(){
    var stars = [];
    for(var i = 0 ; i < 5; i++){
      var rating = this.state.hoverAt != null ? this.state.hoverAt : this.state.rating;
      var selected = (i < rating);
      stars.push(
        <Star key={i} selected={selected}
              onMouseOver={this.handleMouseOver.bind(this, i)}
              onMouseOut={this.handleMouseOut.bind(this, i)}
              onClick={this.handleClick.bind(this, i)}
          />);
    }
    return (<div>{stars}</div>);
  }
});

