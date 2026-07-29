# Explore: explore_3994
# Auto-generated LookML Explore File

include: "/views/domain_33/view_11983.view.lkml"
include: "/views/domain_35/view_11985.view.lkml"
include: "/views/domain_36/view_11986.view.lkml"
include: "/views/domain_37/view_11987.view.lkml"

explore: explore_3994 {
  label: "Explore Explore 3994"
  description: "Comprehensive analytics explore joining base view_11983 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_11983
  
  always_filter: {
    filters: [view_11983.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11983.created_at_date: "7 days"]
    unless: [view_11983.id, view_11983.status]
  }

  join: view_11985 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11983.user_id} = ${view_11985.id} ;;
    required_joins: []
  }

  join: view_11986 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11983.account_id} = ${view_11986.account_id} ;;
    required_joins: [view_11985]
  }

  join: view_11987 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11983.category} = ${view_11987.category} ;;
  }

  access_filter: {
    field: view_11983.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11983.is_deleted} = false ;;
}
