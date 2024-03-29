class SubjectsController < ApplicationController
  
  layout 'admin'

  def index
    @subjects = Subject.order('position ASC')
    @page_title = "All Subjects"
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new
    @subject_count = Subject.count + 1
  end

  def create  
    @subject = Subject.new(subject_params)
    if @subject.save
      flash[:notice] = "Subject successfully created!"
      redirect_to(subjects_path)
    else
      @subject_count = Subject.count + 1
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count
  end

  def update
    @subject = Subject.find(params[:id])
    if @subject.update(subject_params_modified)
      flash[:notice] = "Subject updated successfully!"
      redirect_to(subjects_path(@subject))
    else
      @subject_count = Subject.count
      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    flash[:notice] = "Subject #{@subject.name} deleted successfully!"
    redirect_to(subjects_path)
  end

  private
    def subject_params
      params.require(:subject).permit(:name, :visible, :position, :created_at)
    end

    def subject_params_modified
      params.require(:subject).permit(:name, :visible, :position, :updated_at)
    end
end
