# Update for 2000 file diff target
# Explore: explore_3059
# Auto-generated LookML Explore File

include: "/views/domain_28/view_09178.view.lkml"
include: "/views/domain_30/view_09180.view.lkml"
include: "/views/domain_31/view_09181.view.lkml"
include: "/views/domain_32/view_09182.view.lkml"

explore: explore_3059 {
  label: "Explore Explore 3059"
  description: "Comprehensive analytics explore joining base view_09178 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_09178
  
  always_filter: {
    filters: [view_09178.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09178.created_at_date: "7 days"]
    unless: [view_09178.id, view_09178.status]
  }

  join: view_09180 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09178.user_id} = ${view_09180.id} ;;
    required_joins: []
  }

  join: view_09181 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09178.account_id} = ${view_09181.account_id} ;;
    required_joins: [view_09180]
  }

  join: view_09182 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09178.category} = ${view_09182.category} ;;
  }

  access_filter: {
    field: view_09178.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09178.is_deleted} = false ;;
}
