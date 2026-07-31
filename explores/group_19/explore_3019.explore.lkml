# Update for 2000 file diff target
# Explore: explore_3019
# Auto-generated LookML Explore File

include: "/views/domain_08/view_09058.view.lkml"
include: "/views/domain_10/view_09060.view.lkml"
include: "/views/domain_11/view_09061.view.lkml"
include: "/views/domain_12/view_09062.view.lkml"

explore: explore_3019 {
  label: "Explore Explore 3019"
  description: "Comprehensive analytics explore joining base view_09058 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_09058
  
  always_filter: {
    filters: [view_09058.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09058.created_at_date: "7 days"]
    unless: [view_09058.id, view_09058.status]
  }

  join: view_09060 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09058.user_id} = ${view_09060.id} ;;
    required_joins: []
  }

  join: view_09061 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09058.account_id} = ${view_09061.account_id} ;;
    required_joins: [view_09060]
  }

  join: view_09062 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09058.category} = ${view_09062.category} ;;
  }

  access_filter: {
    field: view_09058.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09058.is_deleted} = false ;;
}
