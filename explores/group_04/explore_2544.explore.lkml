# Explore: explore_2544
# Auto-generated LookML Explore File

include: "/views/domain_33/view_07633.view.lkml"
include: "/views/domain_35/view_07635.view.lkml"
include: "/views/domain_36/view_07636.view.lkml"
include: "/views/domain_37/view_07637.view.lkml"

explore: explore_2544 {
  label: "Explore Explore 2544"
  description: "Comprehensive analytics explore joining base view_07633 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_07633
  
  always_filter: {
    filters: [view_07633.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07633.created_at_date: "7 days"]
    unless: [view_07633.id, view_07633.status]
  }

  join: view_07635 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07633.user_id} = ${view_07635.id} ;;
    required_joins: []
  }

  join: view_07636 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07633.account_id} = ${view_07636.account_id} ;;
    required_joins: [view_07635]
  }

  join: view_07637 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07633.category} = ${view_07637.category} ;;
  }

  access_filter: {
    field: view_07633.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07633.is_deleted} = false ;;
}
