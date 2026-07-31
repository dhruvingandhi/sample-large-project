# Update for 2000 file diff target
# Explore: explore_3137
# Auto-generated LookML Explore File

include: "/views/domain_12/view_09412.view.lkml"
include: "/views/domain_14/view_09414.view.lkml"
include: "/views/domain_15/view_09415.view.lkml"
include: "/views/domain_16/view_09416.view.lkml"

explore: explore_3137 {
  label: "Explore Explore 3137"
  description: "Comprehensive analytics explore joining base view_09412 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_09412
  
  always_filter: {
    filters: [view_09412.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09412.created_at_date: "7 days"]
    unless: [view_09412.id, view_09412.status]
  }

  join: view_09414 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09412.user_id} = ${view_09414.id} ;;
    required_joins: []
  }

  join: view_09415 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09412.account_id} = ${view_09415.account_id} ;;
    required_joins: [view_09414]
  }

  join: view_09416 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09412.category} = ${view_09416.category} ;;
  }

  access_filter: {
    field: view_09412.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09412.is_deleted} = false ;;
}
