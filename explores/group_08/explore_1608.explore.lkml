# Explore: explore_1608
# Auto-generated LookML Explore File

include: "/views/domain_25/view_04825.view.lkml"
include: "/views/domain_27/view_04827.view.lkml"
include: "/views/domain_28/view_04828.view.lkml"
include: "/views/domain_29/view_04829.view.lkml"

explore: explore_1608 {
  label: "Explore Explore 1608"
  description: "Comprehensive analytics explore joining base view_04825 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_04825
  
  always_filter: {
    filters: [view_04825.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04825.created_at_date: "7 days"]
    unless: [view_04825.id, view_04825.status]
  }

  join: view_04827 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04825.user_id} = ${view_04827.id} ;;
    required_joins: []
  }

  join: view_04828 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04825.account_id} = ${view_04828.account_id} ;;
    required_joins: [view_04827]
  }

  join: view_04829 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04825.category} = ${view_04829.category} ;;
  }

  access_filter: {
    field: view_04825.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04825.is_deleted} = false ;;
}
