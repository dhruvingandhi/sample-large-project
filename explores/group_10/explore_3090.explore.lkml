# Update for 2000 file diff target
# Explore: explore_3090
# Auto-generated LookML Explore File

include: "/views/domain_21/view_09271.view.lkml"
include: "/views/domain_23/view_09273.view.lkml"
include: "/views/domain_24/view_09274.view.lkml"
include: "/views/domain_25/view_09275.view.lkml"

explore: explore_3090 {
  label: "Explore Explore 3090"
  description: "Comprehensive analytics explore joining base view_09271 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_09271
  
  always_filter: {
    filters: [view_09271.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09271.created_at_date: "7 days"]
    unless: [view_09271.id, view_09271.status]
  }

  join: view_09273 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09271.user_id} = ${view_09273.id} ;;
    required_joins: []
  }

  join: view_09274 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09271.account_id} = ${view_09274.account_id} ;;
    required_joins: [view_09273]
  }

  join: view_09275 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09271.category} = ${view_09275.category} ;;
  }

  access_filter: {
    field: view_09271.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09271.is_deleted} = false ;;
}
