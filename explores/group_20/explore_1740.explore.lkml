# Explore: explore_1740
# Auto-generated LookML Explore File

include: "/views/domain_21/view_05221.view.lkml"
include: "/views/domain_23/view_05223.view.lkml"
include: "/views/domain_24/view_05224.view.lkml"
include: "/views/domain_25/view_05225.view.lkml"

explore: explore_1740 {
  label: "Explore Explore 1740"
  description: "Comprehensive analytics explore joining base view_05221 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_05221
  
  always_filter: {
    filters: [view_05221.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05221.created_at_date: "7 days"]
    unless: [view_05221.id, view_05221.status]
  }

  join: view_05223 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05221.user_id} = ${view_05223.id} ;;
    required_joins: []
  }

  join: view_05224 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05221.account_id} = ${view_05224.account_id} ;;
    required_joins: [view_05223]
  }

  join: view_05225 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05221.category} = ${view_05225.category} ;;
  }

  access_filter: {
    field: view_05221.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05221.is_deleted} = false ;;
}
