# Explore: explore_1867
# Auto-generated LookML Explore File

include: "/views/domain_02/view_05602.view.lkml"
include: "/views/domain_04/view_05604.view.lkml"
include: "/views/domain_05/view_05605.view.lkml"
include: "/views/domain_06/view_05606.view.lkml"

explore: explore_1867 {
  label: "Explore Explore 1867"
  description: "Comprehensive analytics explore joining base view_05602 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_05602
  
  always_filter: {
    filters: [view_05602.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05602.created_at_date: "7 days"]
    unless: [view_05602.id, view_05602.status]
  }

  join: view_05604 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05602.user_id} = ${view_05604.id} ;;
    required_joins: []
  }

  join: view_05605 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05602.account_id} = ${view_05605.account_id} ;;
    required_joins: [view_05604]
  }

  join: view_05606 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05602.category} = ${view_05606.category} ;;
  }

  access_filter: {
    field: view_05602.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05602.is_deleted} = false ;;
}
