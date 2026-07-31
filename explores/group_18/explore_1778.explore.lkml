# Update for 2000 file diff target
# Explore: explore_1778
# Auto-generated LookML Explore File

include: "/views/domain_35/view_05335.view.lkml"
include: "/views/domain_37/view_05337.view.lkml"
include: "/views/domain_38/view_05338.view.lkml"
include: "/views/domain_39/view_05339.view.lkml"

explore: explore_1778 {
  label: "Explore Explore 1778"
  description: "Comprehensive analytics explore joining base view_05335 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_05335
  
  always_filter: {
    filters: [view_05335.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05335.created_at_date: "7 days"]
    unless: [view_05335.id, view_05335.status]
  }

  join: view_05337 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05335.user_id} = ${view_05337.id} ;;
    required_joins: []
  }

  join: view_05338 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05335.account_id} = ${view_05338.account_id} ;;
    required_joins: [view_05337]
  }

  join: view_05339 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05335.category} = ${view_05339.category} ;;
  }

  access_filter: {
    field: view_05335.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05335.is_deleted} = false ;;
}
