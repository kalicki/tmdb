# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
document.addEventListener 'DOMContentLoaded', ->
	THRESHOLD = 500
	$paginationElem = document.querySelector('.pagination')
	$window = window
	$document = document
	paginationUrl = $paginationElem.getAttribute('data-pagination-endpoint')
	pagesAmount = $paginationElem.getAttribute('data-pagination-pages')
	currentPage = 1
	baseEndpoint = undefined

	### validate if the pagination URL has query params ###

	if paginationUrl.indexOf('?') != -1
		baseEndpoint = paginationUrl + '&page='
	else
		baseEndpoint = paginationUrl + '?page='

	### initialize pagination ###

	$paginationElem.style.display = 'none';
	isPaginating = false

	### listen to scrolling ###
	window.addEventListener 'scroll', ->
		documentHeight = Math.max(document.body.scrollHeight, document.body.offsetHeight, document.documentElement.clientHeight, document.documentElement.scrollHeight, document.documentElement.offsetHeight);
		
		if !isPaginating and currentPage < pagesAmount and window.pageYOffset > documentHeight - document.getElementsByTagName('body')[0].clientHeight - THRESHOLD
			isPaginating = true
			currentPage++
			$paginationElem.style.display = 'block';

			request = new XMLHttpRequest
			request.open 'GET', baseEndpoint + currentPage, true

			request.onload = ->
				if request.status >= 200 and request.status < 400
					# Success!
					result = request.responseText
					console.log(result)
					document.querySelector('.movies-list').insertAdjacentHTML 'beforeend', result
					isPaginating = false

					$paginationElem.style.display = 'none';
					return
				return

			request.onerror = ->
				console.log 'Error'
				return

			request.send()
			
		if currentPage >= pagesAmount
			$paginationElem.style.display = 'none';
			return
	return