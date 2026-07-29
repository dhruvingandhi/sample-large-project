# Explore: explore_3377
# Auto-generated LookML Explore File

include: "/views/domain_32/view_10132.view.lkml"
include: "/views/domain_34/view_10134.view.lkml"
include: "/views/domain_35/view_10135.view.lkml"
include: "/views/domain_36/view_10136.view.lkml"

explore: explore_3377 {
  label: "Explore Explore 3377"
  description: "Comprehensive analytics explore joining base view_10132 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_10132
  
  always_filter: {
    filters: [view_10132.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10132.created_at_date: "7 days"]
    unless: [view_10132.id, view_10132.status]
  }

  join: view_10134 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10132.user_id} = ${view_10134.id} ;;
    required_joins: []
  }

  join: view_10135 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10132.account_id} = ${view_10135.account_id} ;;
    required_joins: [view_10134]
  }

  join: view_10136 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10132.category} = ${view_10136.category} ;;
  }

  access_filter: {
    field: view_10132.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10132.is_deleted} = false ;;
}
