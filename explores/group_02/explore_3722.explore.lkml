# Explore: explore_3722
# Auto-generated LookML Explore File

include: "/views/domain_17/view_11167.view.lkml"
include: "/views/domain_19/view_11169.view.lkml"
include: "/views/domain_20/view_11170.view.lkml"
include: "/views/domain_21/view_11171.view.lkml"

explore: explore_3722 {
  label: "Explore Explore 3722"
  description: "Comprehensive analytics explore joining base view_11167 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_11167
  
  always_filter: {
    filters: [view_11167.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11167.created_at_date: "7 days"]
    unless: [view_11167.id, view_11167.status]
  }

  join: view_11169 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11167.user_id} = ${view_11169.id} ;;
    required_joins: []
  }

  join: view_11170 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11167.account_id} = ${view_11170.account_id} ;;
    required_joins: [view_11169]
  }

  join: view_11171 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11167.category} = ${view_11171.category} ;;
  }

  access_filter: {
    field: view_11167.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11167.is_deleted} = false ;;
}
