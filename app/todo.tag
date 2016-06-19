
<todo>

  <h4>{this.opts.title}  <span class="health-badge"> {items.filter(whatShow).length} </span> </h4>

  <ul class="items-placeholder">
    <li class="item" each={ items.filter(whatShow) }>


      <form onsubmit={ changeItem } >

        <label class="control control--checkbox" class={ completed: done }>
            <input type="checkbox" checked={ done } onclick={ toggle }>
            <div class="control__indicator"></div>
        </label>

        <input name="task" class="input ellipsis" type="text" disabled = { done } value = { title } onfocus = {select}  required readonly autocomplete="off">
        <input type="submit" class="hide">

        <button class="btn" disabled = { hide: done } onclick = { change }> Edit </button>



        <button class="btn btn-remove" onclick = {removeTodo} >
          <span data-balloon="Delete" data-balloon-pos="up"> <i class="icon-remove"></i></span>
        </button>

      </form>


    </li>

    <form class="item" onsubmit={ add }>
      <button class="btn"><i class="icon-plus"></i></button>
      <input name="input" class="input auto-width" placeholder="Add task" onkeyup={ edit } autocomplete="off">
      <button class="btn btn-save" disabled={ !text }> Save </button>
    </form>

  </ul>

  <button class="btn btn-completed" disabled={ items.filter(onlyDone).length == 0 } onclick={ removeAllDone }>
  Clear completed ({ items.filter(onlyDone).length }) </button>


  <!-- this script tag is optional -->
  <script>


    this.items = opts.items;

     edit = (e) => {
      this.text = e.target.value
    }

     add = (e) => {

      if (this.text) {
        this.items.push({ title: this.text })
        this.text = this.input.value = ''
      }

    }

    change = (e) => {
        let input = e.target.previousElementSibling.previousElementSibling;
        if (!e.item.done) {
          input.focus();
          input.removeAttribute('readonly');
        }
    }

    changeItem = (e) => {

        e.item.title = e.target.task.value;
        e.target.task.setAttribute('readonly', 'enabled');

    }

    editCurrent = (e) => {
        this.currentValue = e.target.value;
    }

    removeTodo = (e) => {
      var item = e.item;
      this.items.splice(this.items.indexOf(item), 1)
	  };

    select = (e) => {
      e.target.focus();
      //e.target.removeAttribute('readonly');
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

  </script>

</todo>
