# Update for 2000 file diff target
# Explore: explore_0740
# Auto-generated LookML Explore File

include: "/views/domain_21/view_02221.view.lkml"
include: "/views/domain_23/view_02223.view.lkml"
include: "/views/domain_24/view_02224.view.lkml"
include: "/views/domain_25/view_02225.view.lkml"

explore: explore_0740 {
  label: "Explore Explore 0740"
  description: "Comprehensive analytics explore joining base view_02221 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_02221
  
  always_filter: {
    filters: [view_02221.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02221.created_at_date: "7 days"]
    unless: [view_02221.id, view_02221.status]
  }

  join: view_02223 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02221.user_id} = ${view_02223.id} ;;
    required_joins: []
  }

  join: view_02224 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02221.account_id} = ${view_02224.account_id} ;;
    required_joins: [view_02223]
  }

  join: view_02225 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02221.category} = ${view_02225.category} ;;
  }

  access_filter: {
    field: view_02221.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02221.is_deleted} = false ;;
}
