/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import Markdown from 'markdown'

import '../styles/main'

class MarkdownEditor extends React.Component {
	constructor(props) {
		super(props)
		this.handleChange = this.handleChange.bind(this)

		let targetSplit = this.props.target.split('_')

		this.state = {
			name: targetSplit[0] + "[" + targetSplit[1] + "]",
			value: this.props.content,
			html: Markdown.parse(this.props.content)
		}
	}

	handleChange(event) {
		this.setState({
			value: event.target.value,
			html: Markdown.parse(event.target.value)
		})
	}

	render() {
		return <div className="markdown-editor">
			<div className="editor">
				<textarea id={this.props.target} name={this.state.name} className="form-control" defaultValue={this.state.value} onKeyUp={this.handleChange}></textarea>
			</div>
			<div className="results" dangerouslySetInnerHTML={{__html: this.state.html}}></div>
		</div>
	}
}

var md = document.getElementById('md-editor')
ReactDOM.render(
	<MarkdownEditor {...(md.dataset)} />,
	md
)