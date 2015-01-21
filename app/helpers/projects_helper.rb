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
end
