# Explore: explore_2106
# Auto-generated LookML Explore File

include: "/views/domain_19/view_06319.view.lkml"
include: "/views/domain_21/view_06321.view.lkml"
include: "/views/domain_22/view_06322.view.lkml"
include: "/views/domain_23/view_06323.view.lkml"

explore: explore_2106 {
  label: "Explore Explore 2106"
  description: "Comprehensive analytics explore joining base view_06319 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_06319
  
  always_filter: {
    filters: [view_06319.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06319.created_at_date: "7 days"]
    unless: [view_06319.id, view_06319.status]
  }

  join: view_06321 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06319.user_id} = ${view_06321.id} ;;
    required_joins: []
  }

  join: view_06322 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06319.account_id} = ${view_06322.account_id} ;;
    required_joins: [view_06321]
  }

  join: view_06323 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06319.category} = ${view_06323.category} ;;
  }

  access_filter: {
    field: view_06319.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06319.is_deleted} = false ;;
}
