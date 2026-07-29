# Explore: explore_2586
# Auto-generated LookML Explore File

include: "/views/domain_09/view_07759.view.lkml"
include: "/views/domain_11/view_07761.view.lkml"
include: "/views/domain_12/view_07762.view.lkml"
include: "/views/domain_13/view_07763.view.lkml"

explore: explore_2586 {
  label: "Explore Explore 2586"
  description: "Comprehensive analytics explore joining base view_07759 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_07759
  
  always_filter: {
    filters: [view_07759.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07759.created_at_date: "7 days"]
    unless: [view_07759.id, view_07759.status]
  }

  join: view_07761 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07759.user_id} = ${view_07761.id} ;;
    required_joins: []
  }

  join: view_07762 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07759.account_id} = ${view_07762.account_id} ;;
    required_joins: [view_07761]
  }

  join: view_07763 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07759.category} = ${view_07763.category} ;;
  }

  access_filter: {
    field: view_07759.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07759.is_deleted} = false ;;
}
