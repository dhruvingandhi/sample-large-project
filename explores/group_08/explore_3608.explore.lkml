# Explore: explore_3608
# Auto-generated LookML Explore File

include: "/views/domain_25/view_10825.view.lkml"
include: "/views/domain_27/view_10827.view.lkml"
include: "/views/domain_28/view_10828.view.lkml"
include: "/views/domain_29/view_10829.view.lkml"

explore: explore_3608 {
  label: "Explore Explore 3608"
  description: "Comprehensive analytics explore joining base view_10825 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_10825
  
  always_filter: {
    filters: [view_10825.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10825.created_at_date: "7 days"]
    unless: [view_10825.id, view_10825.status]
  }

  join: view_10827 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10825.user_id} = ${view_10827.id} ;;
    required_joins: []
  }

  join: view_10828 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10825.account_id} = ${view_10828.account_id} ;;
    required_joins: [view_10827]
  }

  join: view_10829 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10825.category} = ${view_10829.category} ;;
  }

  access_filter: {
    field: view_10825.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10825.is_deleted} = false ;;
}
