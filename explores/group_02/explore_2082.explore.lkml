# Explore: explore_2082
# Auto-generated LookML Explore File

include: "/views/domain_47/view_06247.view.lkml"
include: "/views/domain_49/view_06249.view.lkml"
include: "/views/domain_50/view_06250.view.lkml"
include: "/views/domain_01/view_06251.view.lkml"

explore: explore_2082 {
  label: "Explore Explore 2082"
  description: "Comprehensive analytics explore joining base view_06247 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_06247
  
  always_filter: {
    filters: [view_06247.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06247.created_at_date: "7 days"]
    unless: [view_06247.id, view_06247.status]
  }

  join: view_06249 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06247.user_id} = ${view_06249.id} ;;
    required_joins: []
  }

  join: view_06250 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06247.account_id} = ${view_06250.account_id} ;;
    required_joins: [view_06249]
  }

  join: view_06251 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06247.category} = ${view_06251.category} ;;
  }

  access_filter: {
    field: view_06247.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06247.is_deleted} = false ;;
}
