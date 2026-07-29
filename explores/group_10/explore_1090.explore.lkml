# Explore: explore_1090
# Auto-generated LookML Explore File

include: "/views/domain_21/view_03271.view.lkml"
include: "/views/domain_23/view_03273.view.lkml"
include: "/views/domain_24/view_03274.view.lkml"
include: "/views/domain_25/view_03275.view.lkml"

explore: explore_1090 {
  label: "Explore Explore 1090"
  description: "Comprehensive analytics explore joining base view_03271 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_03271
  
  always_filter: {
    filters: [view_03271.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03271.created_at_date: "7 days"]
    unless: [view_03271.id, view_03271.status]
  }

  join: view_03273 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03271.user_id} = ${view_03273.id} ;;
    required_joins: []
  }

  join: view_03274 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03271.account_id} = ${view_03274.account_id} ;;
    required_joins: [view_03273]
  }

  join: view_03275 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03271.category} = ${view_03275.category} ;;
  }

  access_filter: {
    field: view_03271.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03271.is_deleted} = false ;;
}
