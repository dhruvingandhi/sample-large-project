# Update for 2000 file diff target
# Explore: explore_1078
# Auto-generated LookML Explore File

include: "/views/domain_35/view_03235.view.lkml"
include: "/views/domain_37/view_03237.view.lkml"
include: "/views/domain_38/view_03238.view.lkml"
include: "/views/domain_39/view_03239.view.lkml"

explore: explore_1078 {
  label: "Explore Explore 1078"
  description: "Comprehensive analytics explore joining base view_03235 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_03235
  
  always_filter: {
    filters: [view_03235.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03235.created_at_date: "7 days"]
    unless: [view_03235.id, view_03235.status]
  }

  join: view_03237 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03235.user_id} = ${view_03237.id} ;;
    required_joins: []
  }

  join: view_03238 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03235.account_id} = ${view_03238.account_id} ;;
    required_joins: [view_03237]
  }

  join: view_03239 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03235.category} = ${view_03239.category} ;;
  }

  access_filter: {
    field: view_03235.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03235.is_deleted} = false ;;
}
