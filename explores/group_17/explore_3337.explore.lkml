# Explore: explore_3337
# Auto-generated LookML Explore File

include: "/views/domain_12/view_10012.view.lkml"
include: "/views/domain_14/view_10014.view.lkml"
include: "/views/domain_15/view_10015.view.lkml"
include: "/views/domain_16/view_10016.view.lkml"

explore: explore_3337 {
  label: "Explore Explore 3337"
  description: "Comprehensive analytics explore joining base view_10012 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_10012
  
  always_filter: {
    filters: [view_10012.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10012.created_at_date: "7 days"]
    unless: [view_10012.id, view_10012.status]
  }

  join: view_10014 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10012.user_id} = ${view_10014.id} ;;
    required_joins: []
  }

  join: view_10015 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10012.account_id} = ${view_10015.account_id} ;;
    required_joins: [view_10014]
  }

  join: view_10016 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10012.category} = ${view_10016.category} ;;
  }

  access_filter: {
    field: view_10012.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10012.is_deleted} = false ;;
}
