# Explore: explore_3635
# Auto-generated LookML Explore File

include: "/views/domain_06/view_10906.view.lkml"
include: "/views/domain_08/view_10908.view.lkml"
include: "/views/domain_09/view_10909.view.lkml"
include: "/views/domain_10/view_10910.view.lkml"

explore: explore_3635 {
  label: "Explore Explore 3635"
  description: "Comprehensive analytics explore joining base view_10906 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_10906
  
  always_filter: {
    filters: [view_10906.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10906.created_at_date: "7 days"]
    unless: [view_10906.id, view_10906.status]
  }

  join: view_10908 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10906.user_id} = ${view_10908.id} ;;
    required_joins: []
  }

  join: view_10909 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10906.account_id} = ${view_10909.account_id} ;;
    required_joins: [view_10908]
  }

  join: view_10910 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10906.category} = ${view_10910.category} ;;
  }

  access_filter: {
    field: view_10906.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10906.is_deleted} = false ;;
}
