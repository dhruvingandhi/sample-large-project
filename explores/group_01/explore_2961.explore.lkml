# Explore: explore_2961
# Auto-generated LookML Explore File

include: "/views/domain_34/view_08884.view.lkml"
include: "/views/domain_36/view_08886.view.lkml"
include: "/views/domain_37/view_08887.view.lkml"
include: "/views/domain_38/view_08888.view.lkml"

explore: explore_2961 {
  label: "Explore Explore 2961"
  description: "Comprehensive analytics explore joining base view_08884 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_08884
  
  always_filter: {
    filters: [view_08884.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08884.created_at_date: "7 days"]
    unless: [view_08884.id, view_08884.status]
  }

  join: view_08886 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08884.user_id} = ${view_08886.id} ;;
    required_joins: []
  }

  join: view_08887 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08884.account_id} = ${view_08887.account_id} ;;
    required_joins: [view_08886]
  }

  join: view_08888 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08884.category} = ${view_08888.category} ;;
  }

  access_filter: {
    field: view_08884.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08884.is_deleted} = false ;;
}
