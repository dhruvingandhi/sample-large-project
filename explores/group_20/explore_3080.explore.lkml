# Update for 2000 file diff target
# Explore: explore_3080
# Auto-generated LookML Explore File

include: "/views/domain_41/view_09241.view.lkml"
include: "/views/domain_43/view_09243.view.lkml"
include: "/views/domain_44/view_09244.view.lkml"
include: "/views/domain_45/view_09245.view.lkml"

explore: explore_3080 {
  label: "Explore Explore 3080"
  description: "Comprehensive analytics explore joining base view_09241 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_09241
  
  always_filter: {
    filters: [view_09241.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09241.created_at_date: "7 days"]
    unless: [view_09241.id, view_09241.status]
  }

  join: view_09243 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09241.user_id} = ${view_09243.id} ;;
    required_joins: []
  }

  join: view_09244 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09241.account_id} = ${view_09244.account_id} ;;
    required_joins: [view_09243]
  }

  join: view_09245 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09241.category} = ${view_09245.category} ;;
  }

  access_filter: {
    field: view_09241.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09241.is_deleted} = false ;;
}
