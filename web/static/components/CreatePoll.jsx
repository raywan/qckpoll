var Choice = React.createClass({
  render: function() {
    return (<input type="text" className="form-control" placeholder="Text input" ref="choice"/>);
  }
})
var Choices = React.createClass({
  render: function() {
    var items = [];
    for (var i=0; i < this.props.options.length; i++) {
      items.push(<input type="text" className="form-control" placeholder="Text input"/>);
    }
    return (
      <div>{items}</div>
    );
  }
});

var CreatePoll = React.createClass({
  getInitialState: function() {
    return {options: [1]};
  },
  handleClick: function() {
    this.setState(function(previousState, currentProps) {
      previousState.options.push(1);
    });
  },
  handleSubmit: function(e) {
    e.preventDefault();
    var choices = [];
    title = React.findDOMNode(this.refs.title).value;
    options = React.findDOMNode(this.refs.choices);
    for (var i=0; i < options.children.length; i++) {
      choices.push(options.children[i].value);
    }
    console.log("TITLE: " + title);
    console.log("CHOICES: ");
    console.log(choices);
    return;
  },
  render: function() {
    return (
      <div>
        <form className='form-group' onSubmit={this.handleSubmit}>
          <textarea className="form-control" rows="2" placeholder="Question" ref="title"></textarea>
          <Choices options={this.state.options} ref="choices"/>
          <button type="submit" className="btn btn-default">Submit</button>
        </form>
        <button onClick={this.handleClick} className="btn btn-default">Add Option</button>
      </div>
    );
  }
});

React.render(<CreatePoll/>, document.getElementById("create"));
