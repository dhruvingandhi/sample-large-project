# Explore: explore_3858
# Auto-generated LookML Explore File

include: "/views/domain_25/view_11575.view.lkml"
include: "/views/domain_27/view_11577.view.lkml"
include: "/views/domain_28/view_11578.view.lkml"
include: "/views/domain_29/view_11579.view.lkml"

explore: explore_3858 {
  label: "Explore Explore 3858"
  description: "Comprehensive analytics explore joining base view_11575 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_11575
  
  always_filter: {
    filters: [view_11575.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11575.created_at_date: "7 days"]
    unless: [view_11575.id, view_11575.status]
  }

  join: view_11577 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11575.user_id} = ${view_11577.id} ;;
    required_joins: []
  }

  join: view_11578 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11575.account_id} = ${view_11578.account_id} ;;
    required_joins: [view_11577]
  }

  join: view_11579 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11575.category} = ${view_11579.category} ;;
  }

  access_filter: {
    field: view_11575.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11575.is_deleted} = false ;;
}
