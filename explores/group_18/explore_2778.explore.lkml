# Explore: explore_2778
# Auto-generated LookML Explore File

include: "/views/domain_35/view_08335.view.lkml"
include: "/views/domain_37/view_08337.view.lkml"
include: "/views/domain_38/view_08338.view.lkml"
include: "/views/domain_39/view_08339.view.lkml"

explore: explore_2778 {
  label: "Explore Explore 2778"
  description: "Comprehensive analytics explore joining base view_08335 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_08335
  
  always_filter: {
    filters: [view_08335.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08335.created_at_date: "7 days"]
    unless: [view_08335.id, view_08335.status]
  }

  join: view_08337 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08335.user_id} = ${view_08337.id} ;;
    required_joins: []
  }

  join: view_08338 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08335.account_id} = ${view_08338.account_id} ;;
    required_joins: [view_08337]
  }

  join: view_08339 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08335.category} = ${view_08339.category} ;;
  }

  access_filter: {
    field: view_08335.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08335.is_deleted} = false ;;
}
