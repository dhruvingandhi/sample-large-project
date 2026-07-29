# Explore: explore_2608
# Auto-generated LookML Explore File

include: "/views/domain_25/view_07825.view.lkml"
include: "/views/domain_27/view_07827.view.lkml"
include: "/views/domain_28/view_07828.view.lkml"
include: "/views/domain_29/view_07829.view.lkml"

explore: explore_2608 {
  label: "Explore Explore 2608"
  description: "Comprehensive analytics explore joining base view_07825 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_07825
  
  always_filter: {
    filters: [view_07825.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07825.created_at_date: "7 days"]
    unless: [view_07825.id, view_07825.status]
  }

  join: view_07827 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07825.user_id} = ${view_07827.id} ;;
    required_joins: []
  }

  join: view_07828 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07825.account_id} = ${view_07828.account_id} ;;
    required_joins: [view_07827]
  }

  join: view_07829 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07825.category} = ${view_07829.category} ;;
  }

  access_filter: {
    field: view_07825.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07825.is_deleted} = false ;;
}
