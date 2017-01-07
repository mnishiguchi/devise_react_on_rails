import React, { PropTypes as T } from 'react'

export default class ReactApp extends React.Component {

  static propTypes = {
    name:       T.string.isRequired,
    isLoggedIn: T.bool.isRequired,
  }

  /**
   * @param props - Comes from your rails view.
   * @param _railsContext - Comes from React on Rails
   */
  constructor(props, _railsContext) {
    super(props)

    this.state = {
      name: this.props.name
    }
  }

  render() {
    const { isLoggedIn } = this.props

    return (
      <div className="alert alert-info">
        <h3>
          Hello, {this.state.name || 'Unnamed'}! This is ReactApp.
        </h3>
        <p>
          {isLoggedIn ? 'You are logged in.' : 'Please log in.'}
        </p>
        <hr />
        <form >
          <label htmlFor="name">
            Say hello to:
          </label>
          <input
            id="name"
            type="text"
            value={this.state.name}
            onChange={(e) => this.updateName(e.target.value)}
          />
        </form>
      </div>
    )
  }

  updateName(name) {
    this.setState({ name })
  }
}
