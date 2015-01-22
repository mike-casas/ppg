module ProjectsHelper

  def list_project(project,state)

   if state== 'invited'

    html = <<-HTML
    <div class="col-lg-3  content-project-invited">
      <p>#{project.name}</p>
    </div>
    HTML

    link_to html.html_safe ,project_path(project)


  else
    html = <<-HTML
    <div class="col-lg-3  content-project">
      <p>#{project.name}</p>
      <i class='fa fa-fw fa-user icon-dashboard'></i>
      <a id="trash" data-confirm="Deseas eliminar este registro" rel="nofollow" data-method="delete" href="/projects/#{project.id}">
        <i class='fa fa-fw fa-trash icon-dashboard'></i></a>
      </div>
      HTML

      link_to html.html_safe ,project_path(project)

    end

  end

  def extension(ext)

      case ext # a_variable is the variable we want to compare
      when "js"    #compare to 1

        html = <<-HTML
              <i class='js'></i>
              HTML
          html.html_safe
      when "css"    #compare to 2
             html = <<-HTML
              <i class='fa fa-fw fa-css3 css3'></i>
              HTML
          html.html_safe
      when "html"    #compare to 2

            html = <<-HTML
              <i class='fa fa-fw fa-html5 html5'></i>
              HTML
          html.html_safe

      when "rb"    #compare to 2
         html = <<-HTML
              <i class='rb'></i>
              HTML
          html.html_safe

      when "erb"    #compare to 2
        html = <<-HTML
              <i class='fa fa-file-code-o erb'></i>
              HTML
          html.html_safe

      else
          html = <<-HTML
              <i class="fa fa-file-text-o"></i>
              HTML
          html.html_safe

      end

  end

end
