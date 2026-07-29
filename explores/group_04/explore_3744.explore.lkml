# Explore: explore_3744
# Auto-generated LookML Explore File

include: "/views/domain_33/view_11233.view.lkml"
include: "/views/domain_35/view_11235.view.lkml"
include: "/views/domain_36/view_11236.view.lkml"
include: "/views/domain_37/view_11237.view.lkml"

explore: explore_3744 {
  label: "Explore Explore 3744"
  description: "Comprehensive analytics explore joining base view_11233 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_11233
  
  always_filter: {
    filters: [view_11233.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11233.created_at_date: "7 days"]
    unless: [view_11233.id, view_11233.status]
  }

  join: view_11235 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11233.user_id} = ${view_11235.id} ;;
    required_joins: []
  }

  join: view_11236 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11233.account_id} = ${view_11236.account_id} ;;
    required_joins: [view_11235]
  }

  join: view_11237 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11233.category} = ${view_11237.category} ;;
  }

  access_filter: {
    field: view_11233.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11233.is_deleted} = false ;;
}
