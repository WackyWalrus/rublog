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
import RemoveMarkdown from 'remove-markdown'

import '../styles/main'

class MarkdownEditor extends React.Component {
	constructor(props) {
		super(props)
		this.handleContentChange = this.handleContentChange.bind(this)
		this.handleTitleChange = this.handleTitleChange.bind(this)

		this.state = {
			content: this.props.content,
			title: this.props.title,
			html: Markdown.parse('# ' + RemoveMarkdown(this.props.title) + '\n\n' + this.props.content)
		}
	}

	handleTitleChange(event) {
		const content = this.state.content

		this.setState({
			title: event.target.value,
			html: Markdown.parse('# ' + RemoveMarkdown(event.target.value) + '\n\n' + content)
		})
	}

	handleContentChange(event) {
		const title = this.state.title

		this.setState({
			content: event.target.value,
			html: Markdown.parse('# ' + RemoveMarkdown(title) + '\n\n' + event.target.value)
		})
	}

	render() {
		return <div>
			<div className="form-group">
				<label htmlFor="post_title">Title</label>
				<input className="form-control" defaultValue={this.state.title} name="post[title]" id="post_title" type="text" onKeyUp={this.handleTitleChange} />
			</div>
			<div className="form-group">
				<div className="markdown-editor">
					<div className="editor">
						<label htmlFor={this.props.target + "_content"}>Content</label>
						<textarea id={this.props.target + "_content"} name={this.props.target + "[content]"} className="form-control" defaultValue={this.state.content} onKeyUp={this.handleContentChange}></textarea>
					</div>
					<div className="results" dangerouslySetInnerHTML={{__html: this.state.html}}></div>
				</div>
			</div>
		</div>
	}
}

var md = document.getElementById('md-editor')
ReactDOM.render(
	<MarkdownEditor {...(md.dataset)} />,
	md
)