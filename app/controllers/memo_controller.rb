class MemoController < ApplicationController
  def index
    @memos = Memo.all
    @labels = Label.all
  end

  def create
    @memo = Memo.new
    @memo.title = params[:title]
    @memo.content = params[:content]

    if @memo.save
      render json: { title: @memo.title, content: @memo.content, updated_at: @memo.updated_at.to_formatted_s(:rfc822), created_at: @memo.created_at.to_formatted_s(:rfc822), eid: @memo.id}
    else
      render json: { eid: -1 }
    end
  end

  def select
    @json_labels = []
    @labels = Label.all
    @labels.each do |l|
      @json_labels << {name: l.name, updated_at: l.updated_at.to_formatted_s(:rfc822), created_at: l.created_at.to_formatted_s(:rfc822), eid: l.id}
    end

    @json_memos = []
    @memos = params[:label_id].nil? ? Memo.where(label_id: params[:label_id]) : Memo.all
    @memos.each do |m|
      @json_memos << {title: m.title, content: m.content, labels: m.labels, updated_at: m.updated_at.to_formatted_s(:rfc822), created_at: m.created_at.to_formatted_s(:rfc822), eid: m.id}
    end
 
    render json: { labels: @json_labels.to_json, memos: @json_memos.to_json }
  end

  def show
    m = Memo.find(params[:memo_id])
    render json: { title: m.title, content: m.content, updated_at: m.updated_at, created_at: m.created_at.to_formatted_s(:rfc822), eid: @memo.id }
  end
end
