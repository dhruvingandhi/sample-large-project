# Explore: explore_3082
# Auto-generated LookML Explore File

include: "/views/domain_47/view_09247.view.lkml"
include: "/views/domain_49/view_09249.view.lkml"
include: "/views/domain_50/view_09250.view.lkml"
include: "/views/domain_01/view_09251.view.lkml"

explore: explore_3082 {
  label: "Explore Explore 3082"
  description: "Comprehensive analytics explore joining base view_09247 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_09247
  
  always_filter: {
    filters: [view_09247.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09247.created_at_date: "7 days"]
    unless: [view_09247.id, view_09247.status]
  }

  join: view_09249 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09247.user_id} = ${view_09249.id} ;;
    required_joins: []
  }

  join: view_09250 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09247.account_id} = ${view_09250.account_id} ;;
    required_joins: [view_09249]
  }

  join: view_09251 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09247.category} = ${view_09251.category} ;;
  }

  access_filter: {
    field: view_09247.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09247.is_deleted} = false ;;
}
