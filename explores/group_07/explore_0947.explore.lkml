# Explore: explore_0947
# Auto-generated LookML Explore File

include: "/views/domain_42/view_02842.view.lkml"
include: "/views/domain_44/view_02844.view.lkml"
include: "/views/domain_45/view_02845.view.lkml"
include: "/views/domain_46/view_02846.view.lkml"

explore: explore_0947 {
  label: "Explore Explore 0947"
  description: "Comprehensive analytics explore joining base view_02842 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_02842
  
  always_filter: {
    filters: [view_02842.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02842.created_at_date: "7 days"]
    unless: [view_02842.id, view_02842.status]
  }

  join: view_02844 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02842.user_id} = ${view_02844.id} ;;
    required_joins: []
  }

  join: view_02845 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02842.account_id} = ${view_02845.account_id} ;;
    required_joins: [view_02844]
  }

  join: view_02846 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02842.category} = ${view_02846.category} ;;
  }

  access_filter: {
    field: view_02842.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02842.is_deleted} = false ;;
}
