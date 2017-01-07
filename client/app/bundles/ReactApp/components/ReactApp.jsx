import React, { PropTypes as T } from 'react'

// NOTE: Do not make auth links react components because react will complain
// about data-target and data-toggle attributes as unknown props.
// The auth forms are hidden in the app/views/layouts/application template and
// a modal will open when a link is clicked.
const logOutLink = (
  <a rel="nofollow" data-method="delete" href="/auth/logout">Log out</a>
)
const logInLink = (
  <a data-target="#login_modal__target" data-toggle="modal" href="#">Log in</a>
)
const signUpLink = (
  <a data-target="#signup_modal__target" data-toggle="modal" href="#">Sign up</a>
)

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

    const authLinks = (
      <div>
        {signUpLink}{' | '}{logInLink}
      </div>
    )

    return (
      <div className="alert alert-info">
        {isLoggedIn ? logOutLink : authLinks}

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
            onChange={(e) => this.updateName(e.target.value)}
          />
        </form>
      </div>
    )
  }

  // componentDidMount() {
  //   // Detect clicks from outside the react app.
  //   $('#document_wrapper').on('click', (e) => this.handleDocumentClick(e))
  // }
  //
  // handleDocumentClick(event) {
  //   console.log(event.target)
  // }

  updateName(name) {
    this.setState({ name })
  }
}
