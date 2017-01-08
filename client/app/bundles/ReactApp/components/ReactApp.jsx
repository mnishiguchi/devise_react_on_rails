import React, { PropTypes as T } from 'react'

export default class ReactApp extends React.Component {

  static propTypes = {
    currentIdentity: T.object,
    isLoggedIn:      T.bool,
  }

  /**
   * @param props - Comes from your rails view.
   * @param _railsContext - Comes from React on Rails
   */
  constructor(props, _railsContext) {
    super(props)

    this.state = {
      name: this.props.currentIdentity && this.props.currentIdentity.email || "Stranger"
    }
  }

  render() {
    const { isLoggedIn, currentIdentity } = this.props
    const { name } = this.state

    const logOutLink = (
      <div className="nav-right is-flex-mobile">
        <a className="nav-item is-tab" rel="nofollow" data-method="delete" href="/auth/logout">Log out</a>
      </div>
    )

    const authLinks = (
      <div className="nav-right is-flex-mobile">
        <a className="nav-item is-tab" onClick={e => this._openSignUpModal(e)}>Sign up</a>
        <a className="nav-item is-tab" onClick={e => this._openLogInModal(e)}>Log in</a>
      </div>
    )

    return (
      <div>
        <nav className="nav">
          <div className="nav-left is-flex-mobile">
            <a className="nav-item">
              <div style={{fontSize: '2rem'}}>
                ReactApp
              </div>
              <div>
                { isLoggedIn ?
                  <span className="tag is-success">Authenticated</span> :
                  <span className="tag is-light">Unauthenticated</span> }
                </div>
            </a>
          </div>

          {isLoggedIn ? logOutLink : authLinks}
        </nav>

        <div className="container">
          <div className="notification">
            <h3>
              Hello{name ? `, ${name}` : ''}!
            </h3>
            <hr />

            <form className="control is-horizontal">
              <div className="control-label">
                <label htmlFor="name" className="label">
                  Say hello to:
                </label>
              </div>
              <div className="control">
                <input
                  className="input"
                  id="name"
                  type="text"
                  value={this.state.name}
                  onChange={(e) => this._updateName(e.target.value)}
                />
              </div>
            </form>
          </div>
        </div>
      </div>
    )
  }

  // NOTE: The auth forms are hidden in the app/views/layouts/application template
  // and a modal will open when a link is clicked.
  _openLogInModal(e) {
    document.querySelector('#auth_modal').classList.add('is-active')
    document.querySelector('#signup_form').style.display = 'none'
    document.querySelector('#login_form').style.display = 'block'
  }
  _openSignUpModal(e) {
    document.querySelector('#auth_modal').classList.add('is-active')
    document.querySelector('#signup_form').style.display = 'block'
    document.querySelector('#login_form').style.display = 'none'
  }

  _updateName(name) {
    this.setState({ name })
  }
}
