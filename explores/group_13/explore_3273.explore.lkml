# Explore: explore_3273
# Auto-generated LookML Explore File

include: "/views/domain_20/view_09820.view.lkml"
include: "/views/domain_22/view_09822.view.lkml"
include: "/views/domain_23/view_09823.view.lkml"
include: "/views/domain_24/view_09824.view.lkml"

explore: explore_3273 {
  label: "Explore Explore 3273"
  description: "Comprehensive analytics explore joining base view_09820 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_09820
  
  always_filter: {
    filters: [view_09820.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09820.created_at_date: "7 days"]
    unless: [view_09820.id, view_09820.status]
  }

  join: view_09822 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09820.user_id} = ${view_09822.id} ;;
    required_joins: []
  }

  join: view_09823 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09820.account_id} = ${view_09823.account_id} ;;
    required_joins: [view_09822]
  }

  join: view_09824 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09820.category} = ${view_09824.category} ;;
  }

  access_filter: {
    field: view_09820.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09820.is_deleted} = false ;;
}
