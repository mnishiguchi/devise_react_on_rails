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

    const logOutLink = (
      <div className="nav-center">
        <a className="nav-item" rel="nofollow" data-method="delete" href="/auth/logout">Log out</a>
      </div>
    )

    const authLinks = (
      <div className="nav-center">
        <a className="nav-item" onClick={e => this._openSignUpModal(e)}>Sign up</a>
        <a className="nav-item" onClick={e => this._openLogInModal(e)}>Log in</a>
      </div>
    )

    return (
      <div>
        <nav className="nav">
          <h1 className="nav-left">
            <a className="nav-item">
              Hello
            </a>
          </h1>

          {isLoggedIn ? logOutLink : authLinks}
        </nav>

        <div className="container">
          <div className="notification">
            <h3>
              Hello, {this.state.name || 'Unnamed'}! This is ReactApp.
            </h3>
            <hr />
            <form >
              <label htmlFor="name">
                Say hello to:
              </label>
              <input
                id="name"
                type="text"
                value={this.state.name}
                onChange={(e) => this._updateName(e.target.value)}
              />
            </form>
          </div>
        </div>
      </div>
    )
  }

  // NOTE: Do not make auth links react components because react will complain
  // about data-target and data-toggle attributes as unknown props.
  // The auth forms are hidden in the app/views/layouts/application template and
  // a modal will open when a link is clicked.
  _openSignUpModal(e) {
    document.querySelector('#signup_modal.modal').classList.add('is-active')
  }
  _openLogInModal(e) {
    document.querySelector('#login_modal.modal').classList.add('is-active')
  }

  _updateName(name) {
    this.setState({ name })
  }
}
