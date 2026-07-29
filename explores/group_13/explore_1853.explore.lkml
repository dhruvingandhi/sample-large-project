# Explore: explore_1853
# Auto-generated LookML Explore File

include: "/views/domain_10/view_05560.view.lkml"
include: "/views/domain_12/view_05562.view.lkml"
include: "/views/domain_13/view_05563.view.lkml"
include: "/views/domain_14/view_05564.view.lkml"

explore: explore_1853 {
  label: "Explore Explore 1853"
  description: "Comprehensive analytics explore joining base view_05560 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_05560
  
  always_filter: {
    filters: [view_05560.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05560.created_at_date: "7 days"]
    unless: [view_05560.id, view_05560.status]
  }

  join: view_05562 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05560.user_id} = ${view_05562.id} ;;
    required_joins: []
  }

  join: view_05563 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05560.account_id} = ${view_05563.account_id} ;;
    required_joins: [view_05562]
  }

  join: view_05564 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05560.category} = ${view_05564.category} ;;
  }

  access_filter: {
    field: view_05560.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05560.is_deleted} = false ;;
}
