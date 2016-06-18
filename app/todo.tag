
<todo>

  <h4>My tasks  <span class="health-badge"> {items.filter(whatShow).length} </span> </h4>

  <ul class="items-placeholder">
    <li class="item" each={ items.filter(whatShow) }>


      <form onsubmit={ changeItem } >

        <label class="control control--checkbox" class={ completed: done }>
            <input type="checkbox" checked={ done } onclick={ toggle }>
            <div class="control__indicator"></div>
        </label>

        <input name="task" class="input ellipsis" type="text" readonly= { change } onkeyup = { editCurrent } disabled = { done } value={ title }  onfocus={ select } required>

        <button class="btn" type="hidden" disabled = { hide: done } > Edit </button>

        <button class="btn btn-remove" onclick = { removeTodo } >
          <span data-balloon="Delete" data-balloon-pos="up"> <i class="icon-remove"></i></span>
        </button>

      </form>


    </li>

    <form class="item" onsubmit={ add }>
      <button class="btn"><i class="icon-plus"></i></button>
      <input name="input" class="input auto-width" placeholder="Add task" onkeyup={ edit }>
      <button class="btn btn-save" disabled={ !text }> Save </button>
    </form>

  </ul>

  <button class="btn" disabled={ items.filter(onlyDone).length == 0 } onclick={ removeAllDone }>
  Clear completed ({ items.filter(onlyDone).length }) </button>


  <!-- this script tag is optional -->
  <script>

  // Retrieve the object from storage
  var retrievedObject = localStorage.getItem('items');

    this.items = opts.items;

     edit = (e) => {
      this.text = e.target.value
    }

     add = (e) => {

      if (this.text) {
        this.items.push({ title: this.text })
        this.text = this.input.value = ''
      }

      localStorage.setItem('items', JSON.stringify(this.items));

    }

    change = (e) => {

        if (!e.item.done) {
          let input = e.target.previousElementSibling
          console.log(e.target);
          input.focus();
          input.removeAttribute('readonly');
        }
    }

    changeItem = (e) => {
      if (this.currentValue) {
        e.item.title = this.currentValue;
        e.target.addAttribute('disabled');
      }
    }

    editCurrent = (e) => {
        this.currentValue = e.target.value;
        //e.target.addAttribute('readonly');
    }

    removeTodo = (e) => {

      var item = e.item;

      //console.log(item);

  		this.items.filter(function (item) {
        console.log(item);
  			if (item) {

  				this.items.splice(this.items.indexOf(item), 1);

  			}

  		});
	   };

    select = (e) => {
      e.target.focus();
      e.target.select();
    }

     removeAllDone = (e) => {
      this.items = this.items.filter(function(item){
        return !item.done
      });
    }
    // an two example how to filter items on the list
    whatShow = (item) => {
      return !item.hidden
    }

    onlyDone = (item) => {
      return item.done
    }

    toggle = (e) => {
      var item = e.item
      item.done = !item.done
      return true
    }



      // console.log('retrievedObject: ', JSON.parse(retrievedObject);

  </script>

</todo>
