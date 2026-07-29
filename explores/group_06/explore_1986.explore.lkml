# Explore: explore_1986
# Auto-generated LookML Explore File

include: "/views/domain_09/view_05959.view.lkml"
include: "/views/domain_11/view_05961.view.lkml"
include: "/views/domain_12/view_05962.view.lkml"
include: "/views/domain_13/view_05963.view.lkml"

explore: explore_1986 {
  label: "Explore Explore 1986"
  description: "Comprehensive analytics explore joining base view_05959 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_05959
  
  always_filter: {
    filters: [view_05959.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05959.created_at_date: "7 days"]
    unless: [view_05959.id, view_05959.status]
  }

  join: view_05961 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05959.user_id} = ${view_05961.id} ;;
    required_joins: []
  }

  join: view_05962 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05959.account_id} = ${view_05962.account_id} ;;
    required_joins: [view_05961]
  }

  join: view_05963 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05959.category} = ${view_05963.category} ;;
  }

  access_filter: {
    field: view_05959.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05959.is_deleted} = false ;;
}
